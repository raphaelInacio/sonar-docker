FROM sonarqube:5.6.7

ADD ./plugins/sonar-github-plugin-1.1.jar /opt/sonarqube/extensions/plugins/sonar-github-plugin-1.1.jar
ADD ./plugins/sonar-stash-plugin-1.1.0-SNAPSHOT.jar /opt/sonarqube/extensions/plugins/sonar-stash-plugin-1.1.0-SNAPSHOT.jar
ADD ./plugins/sonar-java-plugin-4.14.0.11784.jar /opt/sonarqube/extensions/plugins/sonar-java-plugin-4.14.0.11784.jar
ADD ./plugins/sonar-javascript-plugin-3.2.0.5506.jar /opt/sonarqube/extensions/plugins/sonar-javascript-plugin-3.2.0.5506.jar
ADD ./plugins/sonar-javascript-plugin-3.2.0.5506.jar /opt/sonarqube/extensions/plugins/sonar-javascript-plugin-3.2.0.5506.jar
ADD ./plugins/sonar-checkstyle-plugin-3.7.jar /opt/sonarqube/extensions/plugins/sonar-checkstyle-plugin-3.7.jar
ADD ./plugins/sonar-pmd-plugin-2.5.jar /opt/sonarqube/extensions/plugins/checkstyle-sonar-plugin-3.7.jar

VOLUME /qualityprofile

ADD start_with_profile.sh /opt/sonarqube/start_with_profile.sh

ENTRYPOINT ["/opt/sonarqube/start_with_profile.sh"]
