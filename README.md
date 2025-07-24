# PearDrop
![spring-boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white)
![flutter](https://img.shields.io/badge/Flutter-00AAFF?style=for-the-badge&logo=Flutter&logoColor=white)
![dart](https://img.shields.io/badge/Dart-007FFF?style=for-the-badge&logo=Dart&logoColor=white)

<p align="center">
  "A nearby file-sharing app ."
</p>

>[!TIP]
> All you need to run the application is the Flutter SDK available here : https://docs.flutter.dev/get-started/install

## Architecture For PC   
<img src="img/Architecture.png/">
<br>
This is more or less the same thing I will implement for mobile , but given how I cannot start a Spring Boot server on android unless it is rooted (so much for freedom), I will have to writean HTTP server in dart to interact with the spring boot one.   

SO to resume : 

- The PC client will have a ```.jar``` file of the server as well as the application
- The android client (I ain't making an app for IOS that no one will be able to download anyway) will be just the apk . I just wanted to make an app in the summer , this is a whole wormhole man :( .   

**ReadME written in VIM btw**
