# Use Python 3.11 or later as a base image
FROM python:3.11
# Copy contents into image
COPY . . 
# Install pip dependencies from requirements
RUN pip3 install -r requirements.txt
# Set YOUR_NAME environment variable

# Expose the correct port
EXPOSE 9000
# Create an entrypoint
ENTRYPOINT python3 lbg.py --PORT 9000
