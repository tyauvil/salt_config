nzbget:
  image: linuxserver/nzbget
  tag: latest
  config: /zdata/docker/etc/nzbget/config
  downloads: /zdata/usenet/downloads
  env_file: /zdata/docker/etc/nzbget/nzbget.env
  label_file: /zdata/docker/etc/nzbget/nzbget.label
  port: 6789
  uid: 998
  gid: 997
