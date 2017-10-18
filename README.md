# Análise estática de código com Sonarcube e Docker 

 **Passo 1 configurando o Container**
 
O primeiro passo é fazer o Build da imagem com as configurações necessárias para o seu container

```
$ sudo docker build -t sonarqube-docker-5.6.7 .
```

O próximo passo é subir o contêiner, o comando abaixo sobe o contêiner com base na imagem que acabamos de criar e expõe a porta 9000 para que possamos acessar o sonar no contêiner.
``` 
$ sudo docker run -v $PWD/qualityprofile:/qualityprofile -p 9000:9000 -p 9002:9002 --env-file ./env.file sonarqube-docker-5.6.7
```

Após executar o comando, você pode ver o sonar executando  [nesse endereço](http://localhost:9000)


```
Imagem aqui do sonar rodando
```

**Passo 2 - configurando o maven e os projetos** 

Com o sonar sendo o executado, agora podemos configura o nosso ambiente e projetos para serem analisados pelo sonar e podermos nos aproveitar dos feedback dessa ferramenta.

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
Após essa configuração, já podemos ter a analise do sonar em nosso projeto, para gerar os relatórios execute o comando abaixo e acesse novamente o Sonar  [aqui](http://localhost:9000)
```
mvn sonar:sonar
```

![enter image description here](https://i.stack.imgur.com/fWm1N.png)

**Importando regras de qualidade do personalizadas**

É possível importar regras personalizadas no Sonar caso seu time utilize padrões próprios de desenvolvimento, para isso vá em,  Quality Profile > Create > Restore Profile e importe o arquivo xml com as regras de sua equipe.

![enter image description here](https://github.com/checkstyle/resources/raw/master/img/sonar-wiki/sonar-import-checkstyle-config.png)

Após importar as regras personalizadas clique no perfil importado clique Set as default para ativar as regras importadas
```
Incluir imagem aqui
```

**Integração com a IDE de desenvolvimento**

É possível visualizar os apontamentos do sonar em tempo de desenvolvimento, para fazer isso basta instalar o plugin [sonarLint](http://www.sonarlint.org/), com esse plugin é possível sincronizar as regras do seu container sonar e utiliza-las no seu projeto e em tempo real ter o feed back das regras de qualidade do sonar.

A instalação desse plugin é bem simples, abaixo seguem os links para cada IDE e passo a passo de instalação.

 -  [Eclipse](http://www.sonarlint.org/eclipse/index.html)
 - [Vscode](https://code.visualstudio.com/)
 - [Intellij](http://www.sonarlint.org/intellij/index.html)

Referencias
 -  https://github.com/linagora/docker-sonarqube-pr


