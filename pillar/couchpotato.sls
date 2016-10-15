couchpotato:
  image: tyauvil/couchpotato
  tag: latest
  config: /zdata/docker/etc/couchpotato/config
  media: /zdata/media/movies
  downloads: /zdata/usenet/downloads
  env_file: /zdata/docker/etc/couchpotato/couchpotato.env
  label_file: /zdata/docker/etc/couchpotato/couchpotato.label
  port: 5050
  uid: 998
  gid: 997
