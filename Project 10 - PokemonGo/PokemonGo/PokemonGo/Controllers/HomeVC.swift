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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "PokemonGo"
        
        setCollectionView()
    }
    
    func setCollectionView() {
        
        _ = pokemonCollectionView.then {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.sectionInset = UIEdgeInsets.zero
            flowLayout.minimumInteritemSpacing = 10
            flowLayout.minimumLineSpacing = 10
            
            let halfWidth = UIScreen.main.bounds.width / 3
            flowLayout.itemSize = CGSize(width: halfWidth * 0.9 , height: halfWidth * 0.9)
            $0.collectionViewLayout = flowLayout
            
            $0.dataSource = self
            $0.delegate = self
            
            $0.register(PokemonCVCell.self, forCellWithReuseIdentifier: "PokemonCVCell")
            
            view.addSubview($0)
            
            $0.snp.makeConstraints {
                $0.top.equalTo(view.snp.top)
                $0.left.equalTo(view.snp.left)
                $0.right.equalTo(view.snp.right)
                $0.bottom.equalTo(view.snp.bottom)
            }
        }
    }

}


extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCVCell", for: indexPath) as! PokemonCVCell
        
        return cell
    }
    
    
}
