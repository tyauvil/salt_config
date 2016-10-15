{{ pillar['nzbget']['env_file'] }}:
  file.managed:
    - source: salt://templates/nzbget/nzbget.env
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: nzbget

{{ pillar['nzbget']['label_file'] }}:
  file.managed:
    - source: salt://templates/nzbget/nzbget.label
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: nzbget

nzbget:
  file.managed:
    - name: /etc/systemd/system/nzbget.service
    - source: salt://templates/nzbget/nzbget.service
    - template: jinja
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: /etc/systemd/system/nzbget.service
  service.running:
    - enable: True
    - require:
      - pkg: docker-engine
