FROM registry.access.redhat.com/ubi8-init:latest
MAINTAINER ohubohu@tuk.tam

RUN yum update -y && yum install -y httpd && yum clean all && systemctl enable httpd 
RUN echo "Let's see what will be" > /var/www/html/index.html
# You have to create servername directive
RUN echo "ServerName  my.local.host" >> /etc/httpd/conf/httpd.conf
RUN sed -i 's/80/8080/g' /etc/httpd/conf/httpd.conf

ARG PORT=8080
expose	$PORT

ENTRYPOINT [ "/usr/sbin/init" ]
