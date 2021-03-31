# AnimalSearch
## ScreenShot
![AnimalsSearch](https://user-images.githubusercontent.com/57670228/113099160-7ee7b080-9234-11eb-9cc8-f51d2ef20758.gif)
## 회고, 얻은 것
### UISearchController
네비게이션 바에 검색 바를 두는 방법은 두 가지가 있다. SearchBar를 사용하는 것과 UISearchController를 이용하는 것. 나는 후자를 택했다.
~~~swift
let searchController = UISearchController(searchResultsController: nil)

func setSearchController() {
    searchController.searchBar.placeholder = "Search animals"
    searchController.searchResultsUpdater = self
    
    self.navigationItem.searchController = searchController
    self.navigationItem.title = "Animals"
    self.navigationItem.hidesSearchBarWhenScrolling = true
    self.navigationController?.navigationBar.prefersLargeTitles = true
}
~~~
먼저 UISearchController를 생성한 후, 검색 기능을 사용하기 위해서 searchResultsUpdater를 self로 설정했고
hidesSearchBarWhenScrolling을 통해 스크롤 시 검색 바가 숨겨지도록 했다.
### Model
~~~swift
struct Animal {
    let name: String
    let type: Type
    
    init(_ name: String, _ type: Type) {
        self.name = name
        self.type = type
    }
}

enum Type: String {
    case a = "포유류"
    case b = "양서류"
    case c = "파충류"
    case d = "조류"
}
~~~
모델 구성은 위와 같다. Animal이라는 구조체를 만든 후, String형의 name과 enum형인 Type이라는 속성을 가진 type이라는 변수를 선언했다. 그리고 Animal 형 리스트를 생성해서 값을 채워 넣었다.
### UITableView
~~~swift
func sectionTypeDidMatched(section: Int, list: [Animal]) -> Int {
    var count = 0
    
    for animal in list {
        if animal.type == .a && section == 0 {
            count += 1
        } else if animal.type == .b && section == 1 {
            count += 1
        } else if animal.type == .c && section == 2 {
            count += 1
        } else if animal.type == .d && section == 3 {
            count += 1
        }
    }
    
    return count
}

func typeDidMatched(section: Int, list: [Animal]) -> [Animal] {
    switch section {
    case 0:
        return list.filter { $0.type == .a }
    case 1:
        return list.filter { $0.type == .b }
    case 2:
        return list.filter { $0.type == .c }
    case 3:
        return list.filter { $0.type == .d }
    default:
        return list
    }
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if isFiltering {
        return sectionTypeDidMatched(section: section, list: filteredList)
    } else {
        return sectionTypeDidMatched(section: section, list: animalList)
    }
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
    cell.selectionStyle = .none
            
    var tempList = [Animal]()
    
    if isFiltering {
        tempList = typeDidMatched(section: indexPath.section, list: filteredList)
    } else {
        tempList = typeDidMatched(section: indexPath.section, list: animalList)

    }
    cell.textLabel?.text = tempList[indexPath.row].name
    cell.detailTextLabel?.text = tempList[indexPath.row].type.rawValue
    
    return cell
}
~~~
테이블 뷰 구성은 검색으로 필터링 처리가 된 리스트와 그렇지 않은 리스트로 나눠서 작업을 했다.
섹션 처리가 잘 안 돼서 어떻게 해야될지 계속 고민하다가 filter 함수를 사용했다. 정말 유용한 듯 하다.
### filter 함수
~~~swift
extension HomeVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredList = animalList.filter({ (animal:Animal) -> Bool in
            return animal.name.lowercased().contains(searchController.searchBar.text!.lowercased())
        })
        
        self.animalsTableView.reloadData()
    }
}
~~~
검색 기능을 구현하기 위해 UISearchResultsUpdating을 상속받아 사용했다.
리스트에서 animal의 이름과 검색어가 일치할 경우, 일치하는 애들만 모아 새로운 리스트로 반환하는 형식이다.
필터 함수를 평소에 잘 써보지 않아서 이런 게 있구나 정도로만 알고 있었는데 이번 기회에 제대로 알게 된 것 같다.
</br>

참고한 사이트 
*  <https://jusung.github.io/Filter-함수-구현해-보기/>
*  <https://codershigh.dscloud.biz/techblogs/tb_009_UISearchController/tb009_script.html>
*  <https://zeddios.tistory.com/1196>
