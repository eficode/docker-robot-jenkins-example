FROM alpine:3.10.1

# PYTHON
RUN apk add --no-cache python3 py3-pip
RUN pip3 install --upgrade pip

# CHROME
RUN apk --no-cache upgrade && apk add --no-cache chromium chromium-chromedriver
RUN apk add libexif udev

# ROBOT + LIBRARIES
COPY requirements.txt /tmp/requirements.txt
RUN  pip3 install -r /tmp/requirements.txt
