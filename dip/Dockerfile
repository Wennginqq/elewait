
FROM python:3.10
COPY . /app
WORKDIR /app 
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["./app.py"]