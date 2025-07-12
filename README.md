# PearDrop (initially Drag-nShare)
A nearby sharing app designed to unify airdrop users from the apple ecosystem with whatever they're using down in the Android one .


To start the server in :   
- **Sharing Mode** : ```./mvnw spring-boot:run -Dspring-boot.run.arguments="--mode=s"```
- **Receiving Mode** : ```./mvnw spring-boot:run -Dspring-boot.run.arguments="--mode=r"```

## Architecture For PC   
<img src="img/Architecture.png/">
<br>
This is more or less the same thing I will implement for mobile , but given how I cannot start a Spring Boot server on android unless it is rooted (so much for freedom), I will have to writean HTTP server in dart to interact with the spring boot one.   

SO to resume : 

- The PC client will have a ```.jar``` file of the server as well as the application
- The android client (I ain't making an app for IOS that no one will be able to download anyway) will be just the apk . I just wanted to make an app in the summer , this is a whole wormhole man :( .   

**ReadME written in VIM btw**
