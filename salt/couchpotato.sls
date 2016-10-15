{{ pillar['couchpotato']['env_file'] }}:
  file.managed:
    - source: salt://templates/couchpotato/couchpotato.env
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: couchpotato

{{ pillar['couchpotato']['label_file'] }}:
  file.managed:
    - source: salt://templates/couchpotato/couchpotato.label
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: couchpotato

couchpotato:
  file.managed:
    - name: /etc/systemd/system/couchpotato.service
    - source: salt://templates/couchpotato/couchpotato.service
    - template: jinja
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: /etc/systemd/system/couchpotato.service
  service.running:
    - enable: True
    - require:
      - pkg: docker-engine
