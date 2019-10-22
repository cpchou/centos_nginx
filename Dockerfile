FROM cpchou/centos7
RUN yum -y update
#安裝 keepalived 和 nginx
#下載
RUN cd /usr/local/src/
RUN wget http://nginx.org/download/nginx-1.9.7.tar.gz
#解壓
RUN tar -zvxf nginx-1.9.7.tar.gz 
RUN cd nginx-1.9.7
#建立Nginx使用者
RUN groupadd -g 1001 nginx 
RUN useradd -u 900 nginx -g nginx -s /sbin/nologin
RUN tail -1 /etc/passwd  
#安裝Nginx
RUN /configure --prefix=/usr/local/nginx --with-http_dav_module --with-http_stub_status_module --with-http_addition_module --with-http_sub_module --with-http_flv_module --with-http_mp4_module --with-http_ssl_module --with-http_gzip_static_module --user=nginx --group=nginx && make && make install
RUN ln -s /usr/local/nginx/sbin/* /usr/local/sbin/ 


#將nginx服務加入開機啟動服務
RUN echo "/usr/local/nginx/sbin/nginx" >> /etc/rc.local


#關閉防火牆
RUN systemctl stop firewalld.service    #停止firewall
RUN systemctl disable firewalld.service #禁止firewall開機啟動
