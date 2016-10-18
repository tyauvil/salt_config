include:
  - core

/etc/smartd.conf:
  file.managed:
    - source: salt://templates/smartd/smartd.conf
    - template: jinja
    - listen_in:
      - service: smartd

smartd:
  service.running:
    - enable: True
