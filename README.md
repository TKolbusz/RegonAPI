
# Regon API - iOS

![Zrzut ekranu 2022-12-6 o 11 37 20](https://user-images.githubusercontent.com/10707925/205890570-6db28f3e-cab6-451c-80e4-bdc7532a5ae9.png)
![Zrzut ekranu 2022-12-6 o 11 44 04](https://user-images.githubusercontent.com/10707925/205890584-89afc769-57bd-48c1-a9e0-6497e1719561.png)

## Autor 

Tomasz Kolbusz

## Instalacja

Projekt po pobraniu git clone uruchamia sie, w przypadku problemów, należy zainstalować zależności. Do zainstalowania zależnosci należy wykonać komendę

```
carthage update --use-xcframeworks --platform ios
```

## Działanie

W aplikacji można wyszukiwać polskie firmy oraz stowarzyszenia po nazwie. Aplikacja wyświetla listę firm, po wejsciu w wynik wyświetlają sie szczegółowe informacje o firmie oraz jej lokalizacja na mapie.

## Technologia i narzedzia

Aplikacja uzywa nastepujacych narzedzi i technologi:
1. SwiftUI
2. MapKit
3. RxSwift https://github.com/ReactiveX/RxSwift
4. Alamofire https://github.com/Alamofire/Alamofire
5. rejestr.io - API z danymi o polskich firmach

## Feedback

Aplikacja działa poprawnie, jest to klient API rejestr.io, można wyszukać firmy oraz wyświetlic dane lącznie z dokladnym adresem firmy pokazanym na mapie.
Udało sie wykorzystac Alamofire do wykonania zapytań HTTP oraz spiąć to razem z RxSwift.
W aplikacji nie udało sie zaimplementowac persystencji. Pierwotnie miał byc to Realm, natomiast z uwagi na trudność konfiguracji, zdecydowałem sie na CoreData żeby sprawdzić rozwiązanie dostosowane wylacznie do iOS. Finalnie persystencji nie udało sie zaimplementować.
