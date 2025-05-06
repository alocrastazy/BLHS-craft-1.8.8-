FROM eclipse-temurin:8-jre
WORKDIR /app
COPY . .
RUN chmod +x main.sh
EXPOSE 25565
CMD ["bash", "main.sh"]
