# Korištenje mapa u aplikaciji

Seminarski rad iz kolegija RAMPU

## Plan rada

Bavimo se izradom jednostavne iOS aplikacije koja će imati mogućnosti:
1. Prikaza mape/karte (MapKit for SwiftUI)
2. Traženje dozvole korisnika za korištenje njegove lokacije
3. Dodavanja POI-ja i drugih grafičkih elemenata na mapu/kartu (markeri, anotacije)
4. reagiranja na korsnikov klik kad klikne na elemente

Kod većinski prati službene Appleove materijale navedene u odjeljku [Literatura](#literatura).

## Koraci

| Korak | Sadržaj | Status |
|---|---|---|
| 1 | Prazan SwiftUI projekt i prikaz mape | u tijeku |
| 2 | Markeri i anotacije (POI) | ne dovršeno |
| 3 | Dozvola za lokaciju i prikaz korisnikove lokacije | ne dovršeno |
| 4 | Odabir (klik) na markere i prikaz detalja | ne dovršeno |
| 5 | Klik na proizvoljno mjesto na mapi (dodavanje vlastitog POI-ja) | ne dovršeno |


## Korak 1- Prazan SwiftUI projekt i prikaz mape

Da bi mogli prikazati mapu/kartu moramo koristiti Appleov framework MapKit, pošto smo stavili da je najmanja podrška iOS 17, MapKit ima potpuno podršku za SwiftUI pa je zbog toga dovoljno sam napisati jedan red koda: Map()

U ContentView.swift dodamo import MapKit te umjesto predloška s Hello world dodamo Map()

```swift
import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        Map()
    }
}
```
Import MapKit- služi da možemo koristiti mape i sve povezano s njima (Map, Marker, Annotation)
Map()- otvara interaktivnu mapu na kojoj korisnik može zumirat, kretat se i ostalo




## Literatura

1. Apple Inc. (2023). *Meet MapKit for SwiftUI*. WWDC23, sesija 10043. https://developer.apple.com/videos/play/wwdc2023/10043/
2. Apple Inc. (2024). *What's new in location authorization*. WWDC24. https://developer.apple.com/videos/maps-location
3. Apple Inc. (2024). *Unlock the power of places with MapKit*. WWDC24, sesija 10097. https://developer.apple.com/videos/play/wwdc2024/10097/
4. Apple Inc. (2025). *Go further with MapKit*. WWDC25, sesija 204. https://developer.apple.com/videos/play/wwdc2025/204/
5. Apple Inc. *CLLocationManager*. Apple Developer Documentation. https://developer.apple.com/documentation/corelocation/cllocationmanager
6. Apple Inc. *requestWhenInUseAuthorization()*. Apple Developer Documentation. https://developer.apple.com/documentation/corelocation/cllocationmanager/requestwheninuseauthorization()
7. Apple Inc. *MapKit for SwiftUI*. Apple Developer Documentation. https://developer.apple.com/documentation/mapkit/mapkit-for-swiftui
8. Ahmad Sahar (2023). *iOS 17 Programming for Beginners* (8. izd.), poglavlje „Using MapKit for SwiftUI”. Packt Publishing.
