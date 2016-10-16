openvpn:
  image: kylemanna/openvpn
  tag: "2.0.0"
  config: /zdata/docker/etc/openvpn
  env_file: /zdata/docker/etc/openvpn/openvpn.env
  label_file: /zdata/docker/etc/openvpn/openvpn.label
