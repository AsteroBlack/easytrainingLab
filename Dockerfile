FROM centos:centos7
LABEL author="Tigoli Frédéric"
RUN yum update -y && yum install -y httpd && yum install -y git
WORKDIR /var/www/html
RUN rm -vf /var/www/html/* 
RUN git clone https://github.com/diranetafen/static-website-example && echo "ServerName easytraining" >> /etc/httpd/conf/httpd.conf
COPY ./static.conf /etc/httpd/conf.d/
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
