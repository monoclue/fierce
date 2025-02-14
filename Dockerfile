#FROM python:alpine AS build
#COPY ./fierce/ /usr/fierce/

FROM python:alpine
RUN pip3 uninstall dnspython
RUN pip3 install --upgrade dnspython
#COPY ./fierce /usr/local/bin/fierce/
#COPY --from=build /usr/fierce /usr/fierce
RUN python3 -m pip install fierce && \
    touch /tmp/fierce.log
ENTRYPOINT [ "/bin/sh -c '/usr/local/bin/fierce google.com'" ]
#ENTRYPOINT [ "tail", "-f", "/dev/null" ]
