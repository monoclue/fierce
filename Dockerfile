FROM python:alpine AS build
COPY ./fierce/ /usr/fierce/

FROM python:alpine
RUN pip3 uninstall dnspython
RUN pip3 install --upgrade dnspython
COPY ./fierce/ /usr/fierce/
#COPY --from=build /usr/fierce /usr/fierce
WORKDIR /usr/fierce
ENTRYPOINT ["./fierce.py"]
CMD ["--domain google.com"]