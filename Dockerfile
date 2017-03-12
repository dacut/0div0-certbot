FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive
RUN mv /etc/apt/sources.list /etc/apt/sources.list.old
RUN sed -e 's/archive.ubuntu.com/dctddvrerm64v.cloudfront.net/g' /etc/apt/sources.list.old > /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install -y build-essential libffi-dev libssl-dev python python-dev \
  python-pip
RUN pip install certbot certbot-route53
RUN mkdir -p /etc/letsencrypt
RUN ls -r /etc/letsencrypt
VOLUME ["/etc/letsencrypt"]

COPY certbot-runner /certbot-runner
RUN chmod ugo+x /certbot-runner
CMD ["/certbot-runner"]
