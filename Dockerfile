FROM ghcr.io/matco/connectiq-tester:latest

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
