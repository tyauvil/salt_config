docker-repo:
  pkgrepo.managed:
    - humanname: Docker Apt Repo
    - name: deb https://apt.dockerproject.org/repo ubuntu-{{ grains['oscodename'] }} main
    - dist: ubuntu-{{ grains['oscodename']  }}
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: hkp://p80.pool.sks-keyservers.net:80

/etc/docker/daemon.json:
  file.managed:
    - source: salt://files/docker/daemon.json
    - listen_in:
        - service: docker

docker-engine:
  pkg.installed:
    - version: {{ pillar['docker']['version'] }}~{{ grains['oscodename'] }}
    - require:
      - pkgrepo: docker-repo

docker-service:
  service.running:
    - name: docker
    - enable: True
    - require:
      - pkg: docker-engine
    - watch:
        - file: /etc/docker/daemon.json

python-pip:
  pkg.installed

docker-compose:
  pip.installed:
  - require:
    - pkg: python-pip
