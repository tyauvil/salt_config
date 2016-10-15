{{ pillar['plex']['env_file'] }}:
  file.managed:
    - source: salt://templates/plex/plex.env
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: plex

{{ pillar['plex']['label_file'] }}:
  file.managed:
    - source: salt://templates/plex/plex.label
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: plex

plex:
  file.managed:
    - name: /etc/systemd/system/plex.service
    - source: salt://templates/plex/plex.service
    - template: jinja
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: /etc/systemd/system/plex.service
  service.running:
    - enable: True
    - require:
      - pkg: docker-engine
