datadog-repo:
  pkgrepo.managed:
    - humanname: "Datadog, Inc."
    - name: deb https://apt.datadoghq.com/ stable main
    - keyserver: keyserver.ubuntu.com
    - keyid: C7A7DA52
    - file: /etc/apt/sources.list.d/datadog.list

/etc/dd-agent/conf.d/docker_daemon.yaml:
  file.managed:
    - source: salt://files/datadog/docker_daemon.yaml
    - listen_in:
        - service: datadog-agent-service

/etc/dd-agent/datadog.conf:
  file.managed:
    - source: salt://templates/datadog/datadog.conf
    - template: jinja
    - listen_in:
        - service: datadog-agent-service

datadog-agent-pkg:
  pkg.installed

datadog-agent:
  service.running:
    - require:
      - pkg: datadog-agent
