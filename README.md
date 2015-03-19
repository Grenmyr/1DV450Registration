# 1DV450Registration

##OBS FÖR HITTA ANGULAR app gå till https://github.com/Grenmyr/1DV450Angular  där finns kommentarer av ändringar kring api samt angular o allt sånt. Api finns nu även publiserat så installationer för api behövs ej. Gå därför och installera angular appen localt. https://github.com/Grenmyr/1DV450Angular


## Installationsguide

###  1: För Testa labb 1 hämta [Labb 1] (https://github.com/Grenmyr/1DV450Registration/releases/tag/Release1.01) för testa labb2 [Labb 2] (https://github.com/Grenmyr/1DV450Registration/releases/tag/Registration.API1.01)  
###  2: Öppna applikation med ide eller via konsol navigera till repo katalog.
###  3: Skriv i konsol: "cd Registration/" för hamna i applikationsrot.
###  4: Skriv i konsol: "bundle install"
###  5: Skriv i konsol:Rake "db:setup"
###  6: Skriv i konsol: "rails s" 
### För Registreringsapp (labb 1) gå till 7: För API(labb 2) gå till 8:
###  7: Öppna webbläsare och navigera till "http://localhost:3000/"
#### Release1.00
Det finns 2 användare som kan användas och loggas in på. 
dg222cs@student.lnu.se är vanlig användare och har användarrättigheter.
admin@admin.com är admin och kan även ta bort andra användare.

email : dg222cs@student.lnu.se 
Password : hemligt

email: admin@admin.com
Password : Password

###  8:
#### Registration.Api  
I seed filen har api med id 1 (som används för Autorization token) fått sin key: hårkodad till 123. Detta för snabbare testning, I systemet annars så slumpas det med SecureRandom.hex

######Api   
id:1   
key: 123   

I seed filen har Creator med id 1 david Grenmyr blivit hårdkodad ihop med password hemligt för göra testning enkare.

######Creator   
name: david Grenmyr   
Password: hemligt  

Men dessa filer är såklart redan förifyllda för mina postman tester. Så bara tuta o köra, men om ni vill testa med egen ny creator, så regga bara en med Postman Registrering: och fyll i med vilka uppgifter du vill ha uppgifter istället. 

Öppna dessa urler i postman för lägga in mina tester, kör dom föreslagsvis i denna ordning, men fritt att välja själv.
Glöm bara inte att ersätta JWT key med den ni fått från inloggningen i alla postman tester som kräver klient validering.  
Registrering: https://www.getpostman.com/collections/78f6543184a34e27cf31  
Login: https://www.getpostman.com/collections/9635d04c0b2f1a29c285  
Types: https://www.getpostman.com/collections/3e588e733b6ed09b8f7f    
Events: https://www.getpostman.com/collections/1bbefe1609d772a8ee1c   
Positions: https://www.getpostman.com/collections/b7fba9968371edb69602    
Creator: https://www.getpostman.com/collections/f90a65d6799cdfa418f8    




