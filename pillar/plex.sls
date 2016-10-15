plex:
  image: tyauvil/plex
  tag: latest
  env_file: /zdata/docker/etc/plex/plex.env
  label_file: /zdata/docker/etc/plex/plex.label
  config: /zdata/docker/etc/plex/config
  media: /zdata/media
  port: 32400
