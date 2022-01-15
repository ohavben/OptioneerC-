
FROM oby1/quantlib-ci:1
RUN apt-get -y install --fix-missing \
  cmake-curses-gui \
  gdb \
  gdbserver \
  python-is-python3 \
  vim \
  && apt-get autoremove -y && apt-get clean && \
  \
  groupadd -g 1000 dev && \
  useradd -m -u 1000 -g 1000 -d /home/dev -s /bin/bash dev && \
  usermod -a -G adm,cdrom,sudo,dip,plugdev dev && \
  echo 'dev:dev' | chpasswd && \
  echo "dev   ALL=(ALL:ALL) ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev

RUN sed -i 's/\\h/docker/;s/01;32m/01;33m/' /home/dev/.bashrc \
  && mkdir -p /home/dev/git
