# iOS starter Guide
###### Objetivo do projeto

Projeto simples demonstrando o inicio do desenvolvimento iOS

### Tecnologias Usadas/Estudadas
- iOS
- [Swift](https://www.apple.com/br/swift/)
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [Cocoapods](https://cocoapods.org/)
- [PokeApi](https://pokeapi.co/)

## TableView Stroryboard

#### Adicionando e ligando tableview do storyboard ao código Swift
[Ligações no Stroy board para criar o table view](https://github.com/BersonCrios/pokedex-ios/blob/main/Pokedex/imgs/storyboard-init-table.png)

No view Controller adiciona a linha que é onde será ligado o story board ao código swift
```swift
 @IBOutlet var tableView: UITableView!
```

Extende o UITableViewDelegate e o UITableViewDataSource na classe
```swift
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
```

Adiciona o delegate e o datasource na função viewDidLoad
 ```swift
 override func viewDidLoad() {
     super.viewDidLoad()
     
     tableView.delegate = self
     tableView.dataSource = self
 }
 ```
 
 ##### Funções do delegate
 📄 [Doc - didSelectRowAt](https://developer.apple.com/documentation/uikit/uitableviewdelegate/1614877-tableview) 
  ```swift
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

  }
```

##### Funções do datasource 
📄 [Doc - numberOfSections](https://developer.apple.com/documentation/uikit/uitableviewdatasource/1614860-numberofsections) 
```swift
func numberOfSections(in tableView: UITableView) -> Int {
    return 1
}
```
📄 [Doc - numberOfRowsInSection](https://developer.apple.com/documentation/uikit/uitableviewdatasource/1614931-tableview) 
```swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
}
```
📄 [Doc - cellForRowAt](https://developer.apple.com/documentation/uikit/uitableviewdatasource/1614861-tableview) 
```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //
}
```
## Iniciando o cocoapods

Para iniciar, precisamos fechar todo o projeto, e em seguida, abri-lo no terminal

*Obs: [Caso ainda não tenha, instale o cocoapods, que é o gerenciamento de depêndencias usado para instalar as pods](https://cocoapods.org/)
#### No terminal
1
```shell
    pod init
```

2
```shell
    pod install
```

Para abrir o projeto, clique no arquivo 
```
✅ Pokedex.xcworkspace
```
ao invés do que seria o padrão 
 ```
 ❌ Pokedex.xcodeproj
```
Abrindo o Podfile (Pods/Podfilr), adicione a lib do alamorfire abaixo da linha !use_frameworks

```
pod 'Alamofire', '~> 5.2'

```
Pronto, ja podemos usar a lib de requisição http Alamorfire.
