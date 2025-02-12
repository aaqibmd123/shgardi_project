FROM python:3.9-slim
WORKDIR /app
COPY shgardi_app.py /app/shgardi_app.py
RUN pip install flask
EXPOSE 8080
CMD ["python", "shgardi_app.py"]
