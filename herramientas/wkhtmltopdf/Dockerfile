FROM ubuntu:23.10

# INSTALL WKHTMLTOPDF
RUN apt-get update
RUN apt-get install wkhtmltopdf -y

ENTRYPOINT [ "wkhtmltopdf", "--enable-local-file-access" ]