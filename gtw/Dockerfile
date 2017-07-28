FROM debian
RUN apt-get update;
RUN apt-get install -y iptables
COPY runme.sh /runme.sh
EXPOSE '400-500'
ENTRYPOINT ./runme.sh
