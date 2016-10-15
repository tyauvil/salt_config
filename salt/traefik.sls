/etc/traefik/traefik.toml:
  file.managed:
    - source: salt://files/traefik/traefik.toml
    - makedirs: True
    - listen_in:
        - service: traefik

traefik:
  file.managed:
    - name: /etc/systemd/system/traefik.service
    - source: salt://templates/systemd/traefik.service
    - template: jinja
  service.running:
    - enable: True
    - require:
      - pkg: docker-engine
    - watch:
        - file: /etc/docker/daemon.json
