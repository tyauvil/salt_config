docker-engine:
  pkg.installed:
    - version: {{ pillar['docker']['version'] }}~{{ grains['oscodename'] }}

pkgrepo.managed:
    - humanname: Docker Apt Repo
    - name: deb https://apt.dockerproject.org/repo ubuntu-{{ grains['oscodename'] }} main
    - dist: ubuntu-{{ grains['oscodename']  }}
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: hkp://p80.pool.sks-keyservers.net:80

python-pip:
  pkg.installed
