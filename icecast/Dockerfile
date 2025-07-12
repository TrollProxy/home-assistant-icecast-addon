FROM moul/icecast

# Install jq to parse JSON configuration
RUN apt-get update && apt-get install -y jq

# Copy the run script
COPY run.sh /run.sh

# Make the run script executable
RUN chmod +x /run.sh

# Set the entrypoint to our custom script
ENTRYPOINT ["/run.sh"]
