mvn -f C:\Users\cherif\Desktop\workspaceSpring\EtablissementSJS2\pom.xml clean package -Ptest
Copy-Item -Path C:\Users\cherif\Desktop\workspaceSpring\EtablissementSJS2\EtablissementScolaire-presentation\target\EtablissementScolaire-presentation-1.0-SNAPSHOT.war -Destination C:\apache-tomcat-9.0.43\webapps\ -PassThru