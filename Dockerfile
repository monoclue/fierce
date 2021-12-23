FROM python:alpine AS build
COPY . /fierce
WORKDIR /fierce

FROM python:alpine
RUN pip3 uninstall dnspython
RUN pip3 install --upgrade dnspython
COPY --from=build /fierce/fierce .
ENTRYPOINT ["./fierce.py"]
SHELL ["/bin/bash", "-c"]