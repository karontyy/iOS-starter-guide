# iOS starter Guide
###### Objetivo do projeto

Projeto simples demonstrando o inicio do desenvolvimento iOS

### Tecnologias Usadas/Estudadas
- iOS
- [Swift](https://www.apple.com/br/swift/)
- [Alamofire](https://github.com/Alamofire/Alamofire)

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
