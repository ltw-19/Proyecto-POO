# Le decimos a Render que use una imagen base con Tomcat 9 y Java 17
FROM tomcat:9.0-jdk17

# Eliminamos la aplicación por defecto de Tomcat para tener un entorno limpio
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiamos tu archivo WAR a la carpeta donde Tomcat la desplegará automáticamente
# Usamos un comodín (*) para que funcione aunque la versión del archivo cambie
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Exponemos el puerto estándar que usará nuestra aplicación
EXPOSE 8080

# Comando para iniciar el servidor Tomcat
CMD ["catalina.sh", "run"]