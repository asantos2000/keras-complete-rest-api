FROM python:3.6

LABEL maintainer="Anderson Santos <adsantos@gmail.com>"

WORKDIR /workspace

COPY . /workspace

# Tensorflow version
ARG tf_version=1.7.0

# Install Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y apache2-dev

# Install the necessary packages
RUN pip install --upgrade pip && \
    pip install mod_wsgi && \
    pip install tensorflow==${tf_version} && \
    pip install Pillow && \
    pip install flask gevent && \
    pip install numpy && \
    pip install scipy h5py && \
    pip install keras && \
    pip install imutils requests && \
    pip install redis

# sym-link
RUN ln -s /workspace /var/www/html/keras-complete-rest-api

# apache conf
COPY ./config/apache.conf /etc/apache2/sites-available/000-default.conf

# Add scripts
RUN chmod +x /workspace/scripts/*.sh

# Command to run
ENTRYPOINT ["/workspace/scripts/run-apache.sh"]
CMD [""]

# Expose listen port
EXPOSE 80
EXPOSE 5000

# Expose our app, data and configuration volumes
VOLUME ["/var/www/html", "/workspace", "/etc/apache2/sites-available"]