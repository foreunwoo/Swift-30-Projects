//
//  MainVC.swift
//  ImagePicker
//
//  Created by eunwoo on 2021/04/25.
//

import UIKit
import SnapKit
import Then

class MainVC: UIViewController {
    
    let imageView = UIImageView().then {
        $0.image = UIImage(named: "cat.jpeg")
    }
    
    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        setNavigationBar()
        makeConstraints()
        
        self.picker.delegate = self
    }
    
    func setNavigationBar() {
        self.navigationItem.title = "ImagePicker"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonDidPress))
    }
    
    func makeConstraints() {
        view.addSubview(imageView)

        imageView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(UIScreen.main.bounds.height/3)
            $0.left.equalTo(view.snp.left)
            $0.right.equalTo(view.snp.right)
            $0.bottom.equalTo(view.snp.bottom).inset(UIScreen.main.bounds.height/3)
        }
    }
    
    @objc func addButtonDidPress() {
        let alert =  UIAlertController(title: "이미지 가져오기", message: "이미지를 가져올 경로를 선택해 주세요", preferredStyle: .actionSheet)
        
        let library =  UIAlertAction(title: "앨범에서 가져오기", style: .default) { (action) in self.openLibrary()
        }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }

        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            
            self.present(picker, animated: true, completion: nil)
        } else {
            print("Camera not available.")
        }
    }
    
}

extension MainVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
