# Análise estática de código com Sonarcube e Docker 

 **Passo 1 configurando o Container**
 
Primeiramente é necessário fazer o Build da imagem com o comando abaixo

```
$ sudo docker build -t sonarqube-docker-5.6.7 .
```

O próximo passo é levantear o container, o comando abaixo indica que sobe o container na porta 9000
```
$ sudo docker run --name sonarqube-docker-5.6.7 -v $PWD/qualityprofile:/qualityprofile -p 9000:9000 -p 9002:9002 --env-file ./env.file sonarqube-docker-5.6.7
```

Se tudo o ocorreu bem até aqui você já pode testar o sonar no endereço abaixo:

    http://localhost:9000

Caso queira parar o container em execução

```
sudo docker container stop sonarqube-docker-5.6.7
```

Remover o container

```
sudo docker container stop sonarqube-docker-5.6.7
```

**Passo 2 - configurando maven e os projetos** 

Para podermos ter nossos projetos sendo analizados pelo maven, precisamos configurar alguns pontos em nosso ambiente.

O primeiro ponto é alterar o arquivo setings do maven, insira o código abaixo no seu arquivo settings

```
<settings>
    <pluginGroups>
        <pluginGroup>org.sonarsource.scanner.maven</pluginGroup>
    </pluginGroups>
    <profiles>
        <profile>
            <id>sonar</id>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <properties>
                <!-- Optional URL to server. Default value is http://localhost:9000 -->
                <sonar.host.url>
                  http://localhost:9000
                </sonar.host.url>
            </properties>
        </profile>
     </profiles>
</settings>

```
Para ver o projeto sendo executado pelo maven pasta executar o plugin sonar do maven

```
mvn sonar:sonar
```

Agora basta acessar o sonar no endereço e ver os relatórios do gerados pelo sonar 

```
http://localhost:9000
```

```
Incluir imagem aqui
```

**Importando regras de qualidade do time**

É possível importar regras personalizadas no Sonar caso seu time utilize padrões proprios de desenvolvimento, para isso vá em,  Quality Profile > Create > Restore Profile e importe o arquivo xml com as regras de sua equipe.

```
Incluir imagem aqui
```
Após importar as regras personalizadas clique no perfil importado e em Set as default
```
Incluir imagem aqui
```

**integrando o Sonar com o eclipse**

É possível visualizar os apontamentos do sonar em tempo de desenvolvimento, para fazer isso basta instalar o plugin [sonarLint](http://www.sonarlint.org/), com esse plugin é possível sincronizar as regras do seu container sonar e utiliza-las no seu projeto e em tempo real ter o feed back das regras de qualidade do sonar.

A instalação desse plugin é bem simples, abaixo seguem os links para cada IDE e passo a passo de instalação.

 -  [Eclipse](http://www.sonarlint.org/eclipse/index.html)
 - [Vscode](https://code.visualstudio.com/)
 - [Intellij](http://www.sonarlint.org/intellij/index.html)

