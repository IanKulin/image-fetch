# Use the official lightweight Python image
FROM python:3.9.19-alpine as builder

# Set the working directory in the container to /app
WORKDIR /app

# Create the /app/data directory
RUN mkdir -p /app/data

# Copy the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run image-fetch.py when the container launches
CMD ["python", "image-fetch.py"]
