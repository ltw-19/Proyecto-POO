FROM tomcat:9.0-jdk17

# Elimina la aplicación por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia tu archivo WAR (renombrado como ROOT.war) dentro de la carpeta de Tomcat
COPY target/ShopSmartAI-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Exponer el puerto en el que correrá la app
EXPOSE 8080

# Comando para iniciar Tomcat
CMD ["catalina.sh", "run"]