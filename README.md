# Drag-nShare
A nearby sharing app designed to unify airdrop users from the apple ecosystem with whatever they're using down in the Android one .


Right now , to start it on the reciever , annotate the class UdpDiscoveryListenner with the ```@Component``` annotation.  
And to start it on the sharing device , annotate the class UdpDiscoveryWriter with the same annotation.  

Do not forget to change the IP address in the FileRequester Class to the IP of the sharing device and keep the port of course till I change it later.  
I plan to make a cross-platform client using Flutter and Dart but for now , the server is the priority .  
<br>
**I still have to look into making the server boot with the app but that is for another time .**
