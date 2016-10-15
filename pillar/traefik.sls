traefik:
  image: traefik
  tag: latest
  config_file: /zdata/docker/etc/traefik/traefik.toml
  http_port: 80
  https_port: 443
  dashboard_port: 8081
  domain: ty.zone
