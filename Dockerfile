# Use a full JDK so we can patch the manifest
FROM eclipse-temurin:8-jdk

WORKDIR /app

# Copy server JAR and manifest patch
COPY EaglerXServer.jar .
COPY MANIFEST.MF .

# Embed the Main-Class entry so 'java -jar' works
RUN jar ufm EaglerXServer.jar MANIFEST.MF

# Copy the startup script
COPY main.sh .

# Ensure Unix line endings and make it executable
RUN apt-get update && apt-get install -y dos2unix \
    && dos2unix main.sh \
    && chmod +x main.sh

# Internal Minecraft port; Railway maps external 443→$PORT
EXPOSE 25565

# Run the startup script
ENTRYPOINT ["bash", "main.sh"]