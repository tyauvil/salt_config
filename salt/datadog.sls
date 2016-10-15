datadog-repo:
  pkgrepo.managed:
    - humanname: "Datadog, Inc."
    - name: deb https://apt.datadoghq.com/ stable main
    - keyserver: keyserver.ubuntu.com
    - keyid: C7A7DA52
    - file: /etc/apt/sources.list.d/datadog.list

datadog-agent-pkg:
  pkg.installed:
    - name: datadog-agent

/etc/dd-agent/conf.d/docker_daemon.yaml:
  file.managed:
    - source: salt://files/datadog/docker_daemon.yaml
    - listen_in:
        - service: datadog-agent

/etc/dd-agent/datadog.conf:
  file.managed:
    - source: salt://templates/datadog/datadog.conf
    - template: jinja
    - listen_in:
        - service: datadog-agent

datadog-agent:
  service.running:
    - require:
      - pkg: datadog-agent
