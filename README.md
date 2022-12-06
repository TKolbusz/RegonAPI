
# Regon API - iOS

![Zrzut ekranu 2022-12-6 o 11 37 20](https://user-images.githubusercontent.com/10707925/205890570-6db28f3e-cab6-451c-80e4-bdc7532a5ae9.png)
![Zrzut ekranu 2022-12-6 o 11 44 04](https://user-images.githubusercontent.com/10707925/205890584-89afc769-57bd-48c1-a9e0-6497e1719561.png)

## Autor 

Tomasz Kolbusz

## Instalacja

Projekt po pobraniu git clone uruchamia sie, w przypadku problemow do zainstalowania zaleznosci nalezy wykonac komende

```
carthage update --use-xcframeworks --platform ios
```

## Dzialanie

W aplikacji mozna wyszukiwac polskie firmy po nazwie. Aplikacja wyswietla liste firm, po wejsciu w firme wyswietlaja sie szczegolowe informacje o niej oraz lokalizacja na mapie.

## Technologia i narzedzia

Aplikacja uzywa nastepujacych narzedzi i technologi:
1. SwiftUI
2. MapKit
3. RxSwift https://github.com/ReactiveX/RxSwift
4. Alamofire https://github.com/Alamofire/Alamofire
5. rejestr.io - API z danymi o polskich firmach

## Feedback

Aplikacja dziala poprawnie, jest to klient API rejestr.io, mozna wyszukac firmy oraz wyswietlic dane lacznie z dokladnym adresem firmy pokazanym na mapie.
Udalo sie wykorzystac Alamofire do wykonania zapytan HTTP oraz spiac to razem z RxSwift.
W aplikacji nie udalo sie zaimplementowac persystencji. Pierwotnie mial byc to Realm, natomiast z uwagi na trudnosc konfiguracji, zdecydowalem sie na CoreData zeby sprawdzic rozwiazania dostosowanego wylacznie do iOS. Finalnie persystencji nie udalo sie zaimplementowac
