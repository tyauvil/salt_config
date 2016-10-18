postfix_pkgs:
  pkg.installed:
    - pkgs:
      - postfix
      - mailutils

/etc/postfix/main.cf:
  file.managed:
    - source: salt://templates/postfix/main.cf
    - template: jinja
    - listen_in:
      - service: postfix

/etc/postfix/sasl_passwd:
  file.managed:
    - source: salt://templates/postfix/sasl_passwd
    - template: jinja

postmap:
  cmd.run:
    - name: '/usr/sbin/postmap /etc/postfix/sasl_passwd'
    - onchanges:
      - file: /etc/postfix/sasl_passwd

postfix:
  service.running:
    - enable: True
    - require:
      - pkg: docker-engine
      - file: /etc/postfix/main.cnf
