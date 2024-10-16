
# FROM ubuntu:22.04

# # Set the working directory
# WORKDIR /app

# # Copy the requirements and application files to the working directory
# COPY requirements.txt /app
# COPY devops /app

# # Install Python, pip, and other necessary tools
# RUN apt-get update && \
#     apt-get install -y python3 python3-pip python3-venv && \
#     python3 -m venv /app/venv

# # Activate the virtual environment and install dependencies
# RUN /app/venv/bin/pip install --upgrade pip && \
#     /app/venv/bin/pip install -r /app/requirements.txt

# # Ensure the virtual environment is activated when the container starts
# ENV PATH="/app/venv/bin:$PATH"

# # Expose port 8000 for Django development server
# EXPOSE 8000

# # Set the entrypoint and default command to run Django server
# ENTRYPOINT ["python3"]
# CMD ["manage.py", "runserver", "0.0.0.0:8000"]



# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set the working directory
WORKDIR /app

# Copy the requirements and application files to the working directory
COPY requirements.txt /app/
COPY manage.py /app/
COPY devops /app/devops/
COPY demo /app/demo/

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Expose port 8000 for the Django development server
EXPOSE 8000

# Set the command to run the Django server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
