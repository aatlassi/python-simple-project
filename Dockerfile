# Dockerfile to build a flask app

FROM python:3.8
 
WORKDIR /app
COPY . /app
 
RUN pip install -r requirements.txt
 
ENTRYPOINT ["python"]
CMD ["app.py"]