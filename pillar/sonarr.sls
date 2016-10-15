sonarr:
  image: linuxserver/sonarr
  tag: latest
  config: /zdata/docker/etc/sonarr/config
  tv: /zdata/media/tv
  downloads: /zdata/usenet/downloads
  env_file: /zdata/docker/etc/sonarr/sonarr.env
  label_file: /zdata/docker/etc/sonarr/sonarr.label
  port: 8989
  uid: 998
  gid: 997
