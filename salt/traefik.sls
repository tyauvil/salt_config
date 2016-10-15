{{ pillar['traefik']['config_file'] }}:
  file.managed:
    - source: salt://templates/traefik/traefik.toml
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: traefik

traefik:
  file.managed:
    - name: /etc/systemd/system/traefik.service
    - source: salt://templates/traefik/traefik.service
    - template: jinja
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: /etc/systemd/system/traefik.service
  service.running:
    - enable: True
    - require:
      - pkg: docker-engine
