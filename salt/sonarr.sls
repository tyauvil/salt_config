{{ pillar['sonarr']['env_file'] }}:
  file.managed:
    - source: salt://templates/sonarr/sonarr.env
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: sonarr

{{ pillar['sonarr']['label_file'] }}:
  file.managed:
    - source: salt://templates/sonarr/sonarr.label
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: sonarr

sonarr:
  file.managed:
    - name: /etc/systemd/system/sonarr.service
    - source: salt://templates/sonarr/sonarr.service
    - template: jinja
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: /etc/systemd/system/sonarr.service
  service.running:
    - enable: True
    - require:
      - pkg: docker-engine
