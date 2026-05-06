# Etapa 1: Construcción (build)
FROM maven:3.8-openjdk-17 AS builder

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo pom.xml (para descargar dependencias primero, aprovechando caché)
COPY pom.xml .

# Descarga las dependencias (esto se cachea si no cambia pom.xml)
RUN mvn dependency:go-offline

# Copia todo el código fuente
COPY src ./src

# Compila y genera el archivo .war
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución (runtime)
FROM tomcat:9.0-jdk17

# Elimina la aplicación por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia el archivo .war generado desde la etapa anterior
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expone el puerto 8080
EXPOSE 8080

# Comando para iniciar Tomcat
CMD ["catalina.sh", "run"]