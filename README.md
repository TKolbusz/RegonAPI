
# Regon API - iOS

![Screen Shot 2022-12-06 at 11 14 50](https://user-images.githubusercontent.com/10707925/205885927-0cc74815-e609-41bc-b757-a6e9c2ba1587.png)
![Screen Shot 2022-12-06 at 11 14 22](https://user-images.githubusercontent.com/10707925/205885877-36e4586d-6f2b-4b67-a29b-6a5e372ca841.png)

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
