FROM cpchou/centos7
RUN yum -y update

RUN bash -c 'echo -e "# 穩定版"' > /etc/yum.repos.d/nginx.repo
RUN bash -c 'echo -e "[nginx-stable]"' >> /etc/yum.repos.d/nginx.repo
RUN bash -c 'echo -e "name=nginx stable repo"' >> /etc/yum.repos.d/nginx.repo
RUN bash -c 'echo -e "gpgcheck=0"' >> /etc/yum.repos.d/nginx.repo
RUN bash -c 'echo -e "enabled=1"' >> /etc/yum.repos.d/nginx.repo
RUN bash -c 'echo -e "module_hotfixes=true"' >> /etc/yum.repos.d/nginx.repo
RUN bash -c 'echo -e "baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/"' >> /etc/yum.repos.d/nginx.repo

RUN yum-config-manager --enable nginx-stable
RUN yum install nginx -y
RUN systemctl start nginx

