# Use a full JDK so we can patch the manifest
FROM eclipse-temurin:8-jdk

WORKDIR /app

# Copy server JAR and manifest patch
COPY EaglerXServer.jar .
COPY MANIFEST.MF .

# Embed the Main-Class entry so 'java -jar' works
RUN jar ufm EaglerXServer.jar MANIFEST.MF

# Copy and make our startup script executable
COPY main.sh .
RUN chmod +x main.sh

# Expose the default Minecraft port internally (Railway will map 443→$PORT)
EXPOSE 25565

# Use ENTRYPOINT so Railway knows this is the process to keep alive
ENTRYPOINT ["bash", "main.sh"]