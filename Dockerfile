# Base image for the backend (Django)
FROM python:3.8-slim-buster as backend

# Set the working directory in the container
WORKDIR /

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files to the working directory
COPY . .

# Run database migrations
RUN python manage.py makemigrations
RUN python manage.py migrate

# Expose the port that Django runs on
EXPOSE 8000

# Set the command to run when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
