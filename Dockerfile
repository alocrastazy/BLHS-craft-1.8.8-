FROM eclipse-temurin:8-jdk
WORKDIR /app

# Copy the server JAR & manifest
COPY EaglerXServer.jar .
COPY MANIFEST.MF .

# Update the JAR in-place so it has the Main-Class
RUN jar ufm EaglerXServer.jar MANIFEST.MF

# Copy your start script
COPY main.sh .
RUN chmod +x main.sh

CMD ["bash", "main.sh"]
