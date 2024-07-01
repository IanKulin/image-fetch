# Use the official lightweight Python image
FROM python:3.9.19-alpine as builder

# Set the working directory in the container to /app
WORKDIR /app

# Create the /app/data directory
RUN mkdir -p /app/data

# Install cron
RUN apk add --no-cache cronie

# Set the username for cron to use when executing tasks (replace "myuser" with your actual username)
USER root:root

# Create a file to hold the Cron job configuration (e.g., crontab.conf)
COPY crontab.conf /etc/crontabs/root

# copy the python requirements in
ADD requirements.txt /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# copy the python code file into the container at /app
ADD image-fetch.py /app

# Start the cron daemon
CMD ["crond", "-f"]