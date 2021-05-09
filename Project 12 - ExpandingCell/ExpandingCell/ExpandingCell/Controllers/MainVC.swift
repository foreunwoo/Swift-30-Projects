//
//  MainVC.swift
//  ExpandingCell
//
//  Created by eunwoo on 2021/05/09.
//

import UIKit
import SnapKit
import Then

class MainVC: UIViewController {
    
    let countryTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "ExpandingCell"
        
        setTableView()
        setData()
    }
    
    func setTableView() {
        _ = countryTableView.then {
            $0.dataSource = self
            $0.delegate = self
            
            $0.register(ContryTVCell.self, forCellReuseIdentifier: "ContryTVCell")
            
            view.addSubview($0)
            
            $0.snp.makeConstraints {
                $0.top.equalTo(view.snp.top)
                $0.left.equalTo(view.snp.left)
                $0.right.equalTo(view.snp.right)
                $0.bottom.equalTo(view.snp.bottom)
            }
        }
    }
    
    func setData() {
        countries.append(Country(name: "대한민국", flag: "Korea.png", information: "대한민국(한국 한자: 大韓民國, 영어: Republic of Korea)은 동아시아의 한반도 남부에 위치한 민주공화국이다. 서쪽으로 황해를 사이에 두고 중화인민공화국이, 동쪽으로는 동해를 사이에 두고 일본이 위치하며, 북쪽으로는 한반도 군사 분계선을 사이에 두고 조선민주주의인민공화국 (북한)과 맞닿아 있다[3]. 수도는 사실상 서울특별시이고, 실질적 행정 수도는 세종특별자치시이다. 대한민국의 국기는 대한민국 국기법에 따라 태극기[4], 국가는 관습상 애국가[5], 국화는 관습상 무궁화이다. 공용어는 한국어와 한국 수어이다. 인구는 약 5,200만 명으로 전체 인구 중 절반 정도가 수도권에 살고 있다.", isExpanded: false))
        countries.append(Country(name: "인도", flag: "India.png", information: "인도 공화국(印度 共和國, 힌디어: भारत गणराज्य 바라트 가느라지야, 영어: Republic of India 리퍼블릭 오브 인디아[*]), 약칭 인도(힌디어: भारत 바라트, 영어: India 인디아[*])는 남아시아에 있는 나라로, 인도 아대륙의 거의 대부분을 차지하고 있는 국가이다. 국가 면적은 세계에서 일곱 번째로 넓으며, 인구는 약 13억 8천만명으로 중화인민공화국에 이어 세계에서 두 번째로 많다", isExpanded: false))
        countries.append(Country(name: "태국", flag: "Thailand.png", information: "타이 왕국(태국어: ราชอาณาจักรไทย 랏차 아나짝 타이[*]), 약칭 태국(태국어: ประเทศไทย 쁘라텟타이[*])은 동남아시아의 말레이 반도와 인도차이나 반도 사이에 걸쳐 있는 국가이다. 76개의 주로 구성되어 있으며, 전체 면적은 약 513,120km2,인구는 약 6,600만 명이다. 세계에서 50번째로 면적이 넓은 국가이며, 22번째로 인구가 많은 국가이기도 하다. 수도이자 최대 도시는 방콕이다.", isExpanded: false))
        
        countries.append(Country(name: "프랑스", flag: "France.png", information: "프랑스 공화국(프랑스어: République française, 영어: French Republic) 약칭 프랑스(프랑스어: France)는 서유럽의 본토와 남아메리카의 프랑스령 기아나를 비롯해 여러 대륙에 걸쳐 있는 해외 레지옹과 해외 영토로 이루어진 국가로서, 유럽 연합 소속 국가 중 영토가 가장 넓다. 수도는 파리이며, 프랑스 본토는 남북으로는 지중해에서 영국 해협과 북해까지, 동서로는 라인강에서 대서양에 이른다.", isExpanded: false))
        countries.append(Country(name: "이탈리아", flag: "Italia.png", information: "이탈리아 공화국(Repubblica Italiana 레푸블리카 이탈리아나[*]), 약칭 이탈리아(이탈리아어: Italia, 약자: IT, 문화어: 이딸리아, 음역어: 이태리)는 남유럽의 이탈리아반도와 지중해의 두 개의 섬으로 이루어진 시칠리아 및 사르데냐로 이루어진 단일 의회 공화국이다.", isExpanded: false))
        countries.append(Country(name: "영국", flag: "Uk.png", information: "그레이트브리튼 및 북아일랜드 연합왕국(영어: United Kingdom of Great Britain and Northern Ireland 유나이티드 킹덤 오브 그레이트 브리튼 앤드 노던 아일랜드[*]), 약칭 연합왕국(聯合王國,영어: United Kingdom 유나이티드 킹덤[*], UK, U.K.), 브리튼(영어: Britain) 또는 가장 일반적으로 영국(英國)은 유럽 본토 해안에서 북서쪽으로 떨어진 곳에 위치한 섬나라이자 입헌군주국이다. 북해, 영국 해협, 아일랜드해 및 대서양에 접하여 있으며 그레이트브리튼섬의 잉글랜드, 스코틀랜드, 웨일스 및 아일랜드섬 북부의 북아일랜드로 네 개의 구성국이 연합해 형성한 단일 국가이다.[1] 수도는 런던이고 스코틀랜드, 웨일스, 북아일랜드의 수도는 각각 에든버러, 카디프, 벨파스트이다.", isExpanded: false))
        
        countries.append(Country(name: "케냐", flag: "Kenya.png", information: "케냐 공화국(영어: Republic of Kenya 리퍼블릭 오브 케냐[*], 스와힐리어: Jamhuri Ya Kenya 잠후리 야 케냐) 또는 케냐(Kenya, 문화어: 케니아)는 동아프리카의 공화국이다. 인도양에 면해 있으며 북동쪽으로 소말리아, 북쪽으로 에티오피아와 남수단, 서쪽으로 우간다, 남쪽으로 탄자니아와 국경을 맞닿고 있다.", isExpanded: false))
        countries.append(Country(name: "가나", flag: "Ghana.png", information: "가나 공화국(영어: Republic of Ghana 리퍼블릭 오브 가나[*]), 약칭 가나(영어: Ghana)는 서아프리카 기니만과 대서양에 면한 나라다. 총 면적은 238,535 km2 (92,099 sq mi)로 동쪽으로는 토고, 서쪽으로는 코트디부아르, 북쪽으로는 부르키나파소와 맞닿아 있으며, 남쪽으로는 대서양과 기니만을 면하고 있다. 나라 이름은 소닝케어로 '전사 왕'이라는 뜻이다.", isExpanded: false))
    }

}

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countries[indexPath.row].isExpanded = !countries[indexPath.row].isExpanded
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContryTVCell", for: indexPath) as! ContryTVCell
        
        cell.selectionStyle = .none
        cell.country = countries[indexPath.row]
        cell.fetchData()
        
        return cell
    }
    
}
