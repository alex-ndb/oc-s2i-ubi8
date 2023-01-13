FROM it-nb-203:5000/library/ubi8-init-original
MAINTAINER ohubohu@tuk.tam

RUN yum install -y httpd && yum clean all && systemctl enable httpd 
RUN echo "Let's see what will be" > /var/www/html/index.html
# You have to create servername directive
RUN echo "ServerName  my.local.host" >> /etc/httpd/conf/httpd.conf

ARG PORT=80
expose	$PORT

ENTRYPOINT [ "/usr/sbin/init" ]
