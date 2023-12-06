#!/bin/bash

mkdir tempdirs
mkdir tempdirs/templates
mkdir tempdirs/static

cp sample_app.py tempdirs/.
cp -r templates/* tempdirs/templates/.
cp -r static/* tempdirs/static

echo "FROM python" >> tempdirs/Dockerfile
echo "RUN pip install flask" >> tempdirs/Dockerfile
echo "COPY ./static /home/myapp/static" >> tempdirs/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdirs/Dockerfile
echo "COPY sample_app.py /home/myapp/" >> tempdirs/Dockerfile
echo "EXPOSE 8080" >> tempdirs/Dockerfile
echo "CMD python3 /home/myapp/sample_app.py" >> tempdirs/Dockerfile

cd tempdirs
sudo docker build -t sampleapp .
sudo docker run -t -d -p 8080:8080 --name samplerunning sampleapp
sudo docker ps -a

