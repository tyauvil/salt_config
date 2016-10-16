# Initialize the OpenVPN server:
# docker run --volumes-from $OVPN_DATA --rm kylemanna/openvpn ovpn_genconfig -u udp://VPN.SERVERNAME.COM
# docker run --volumes-from $OVPN_DATA --rm -it kylemanna/openvpn ovpn_initpki

{{ pillar['openvpn']['env_file'] }}:
  file.managed:
    - source: salt://templates/openvpn/openvpn.env
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: openvpn

{{ pillar['openvpn']['label_file'] }}:
  file.managed:
    - source: salt://templates/openvpn/openvpn.label
    - template: jinja
    - makedirs: True
    - listen_in:
        - service: openvpn

openvpn:
  file.managed:
    - name: /etc/systemd/system/openvpn.service
    - source: salt://templates/openvpn/openvpn.service
    - template: jinja
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: /etc/systemd/system/openvpn.service
  service.running:
    - enable: True
    - require:
      - pkg: docker-engine
