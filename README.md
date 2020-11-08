# Marvel-Heroes
<img src="/Images/appIcon.jpg" alt="appIcon" width="200"/>  

Arquiteutura utilizada [MVC](https://www.devmedia.com.br/introducao-ao-padrao-mvc/29308)

Bibliotecas internas:
- [Codable](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)

Bibliotecas Externas:
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [KingFisher](https://github.com/onevcat/Kingfisher)
- [SwiftHash](https://github.com/onmyway133/SwiftHash)

## Funcionamento
Na primeira tela do app é exibido um campo onde permite pesquisar um Herói da API [MARVEL](https://developer.marvel.com/):
- Após pesquisar um herói será exibida na TableView uma lista com os heróis que possuam o nome pesquisado, caso contrário exibirá e mensagem "Hero, not found", 

## Heróis
<img src="/Images/launchScreen.png" alt="launchScreen" width="200"/> <img src="/Images/searchScreen.png" alt="searchScreen" width="200"/>   <img src="/Images/loadingScreen.png" alt="loadingScreen" width="200"/> <img src="/Images/resultScreen.png" alt="resultScreen" width="200"/> <img src="/Images/heroDetails.png" alt="heroDetails" width="200"/>

## Build do app em sua máquina
Antes de abrir o app na máquina, é necessário:

Xcode 11.5 ou superior. 
Ter o cocoapods instalado.

Você pode acompanhar o passo a passo pra instalar aqui [CocoaPods](https://cocoapods.org/)

Depois de instalar, abra a pasta do projeto e digite o comando:
- pod install


