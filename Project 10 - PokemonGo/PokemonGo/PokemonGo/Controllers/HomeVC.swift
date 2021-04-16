//
//  HomeVC.swift
//  PokemonGo
//
//  Created by eunwoo on 2021/04/13.
//

import UIKit
import SnapKit
import Then

class HomeVC: UIViewController {
    
    let pokemonCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
    
    var monsters: [Monster] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "PokemonGo"
        
        setCollectionView()
        
        setData()
    }
    
    func setCollectionView() {
        _ = pokemonCollectionView.then {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.sectionInset = UIEdgeInsets.zero
            flowLayout.minimumInteritemSpacing = 10
            flowLayout.minimumLineSpacing = 10
            
            let halfWidth = UIScreen.main.bounds.width / 3
            flowLayout.itemSize = CGSize(width: halfWidth * 0.9 , height: UIScreen.main.bounds.width / 2)
            $0.collectionViewLayout = flowLayout
            
            $0.dataSource = self
            $0.delegate = self
            
            $0.register(PokemonCVCell.self, forCellWithReuseIdentifier: "PokemonCVCell")
            
            $0.backgroundColor = .white
            
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
        monsters.append(Monster(name: "이상해씨", oneType: "풀", twoType: "독"))
        monsters.append(Monster(name: "고라파덕", oneType: "물", twoType: ""))
        monsters.append(Monster(name: "꼬렛", oneType: "노말", twoType: ""))
        monsters.append(Monster(name: "꼬부기", oneType: "물", twoType: ""))
        monsters.append(Monster(name: "나옹", oneType: "노말", twoType: ""))
        monsters.append(Monster(name: "닥트리오", oneType: "땅", twoType: ""))
        monsters.append(Monster(name: "독침붕", oneType: "벌레", twoType: "독"))
        monsters.append(Monster(name: "디그다", oneType: "땅", twoType: "강철"))
        monsters.append(Monster(name: "뚜벅쵸", oneType: "풀", twoType: "독"))
        monsters.append(Monster(name: "라플레시아", oneType: "풀", twoType: "독"))
        monsters.append(Monster(name: "모래두지", oneType: "땅", twoType: ""))
        monsters.append(Monster(name: "버터플", oneType: "벌레", twoType: "비행"))
        monsters.append(Monster(name: "삐삐", oneType: "페어리", twoType: ""))
        monsters.append(Monster(name: "식스테일", oneType: "불꽃", twoType: ""))
        monsters.append(Monster(name: "파라스", oneType: "벌레", twoType: "풀"))
        monsters.append(Monster(name: "파이리", oneType: "불꽃", twoType: ""))
        monsters.append(Monster(name: "푸린", oneType: "노말", twoType: "페어리"))
        monsters.append(Monster(name: "피죤", oneType: "노말", twoType: "비행"))
        monsters.append(Monster(name: "피카츄", oneType: "전기", twoType: ""))
        monsters.append(Monster(name: "픽시", oneType: "페어리", twoType: ""))
    }
}


extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return monsters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCVCell", for: indexPath) as! PokemonCVCell
        
        cell.monster = monsters[indexPath.row]
        cell.fillDataToView()
        
        return cell
    }
    
    
}
