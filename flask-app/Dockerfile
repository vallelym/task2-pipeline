# Use Python 3.7 as a base image
FROM python:3.7

WORKDIR /app
# Copy contents into image
COPY . /app
# install pip dependencies from requirements file
RUN pip install --no-cache-dir -r requirements.txt
# Expose correct port
EXPOSE 5000
# Create an entrypoint
CMD ["python", "app.py"]

