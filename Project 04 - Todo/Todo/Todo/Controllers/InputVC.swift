//
//  InputVC.swift
//  Todo
//
//  Created by eunwoo on 2021/03/23.
//

import UIKit
import SnapKit
import Then

class InputVC: UIViewController {
    
    let textFieldContainerView = UIView()
    
    let todoTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 15)
        $0.borderStyle = .roundedRect
    }
    let locationTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 15)
        $0.borderStyle = .roundedRect
    }
    let dateTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 15)
        $0.borderStyle = .roundedRect
        $0.isEnabled = false
    }
    let dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.text = "date"
    }
        
    let datePicker = UIDatePicker().then {
        $0.preferredDatePickerStyle = .wheels
        $0.datePickerMode = .date
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 5.0
    }
    
    let buttonContainerView = UIView()
    
    let cancelButton = HighlightedButton().then {
        $0.setTitle("cancel", for: .normal)
        $0.setTitleColor(.red, for: .normal)
    }
    let saveButton = HighlightedButton().then {
        $0.isUserInteractionEnabled = true
        $0.setTitle("save", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
    }
    
    var todoListVC: TodoListVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeConstraints()
    }
    
    func makeConstraints() {
        datePicker.addTarget(self, action: #selector(didChangeDate(sender:)), for: .valueChanged)
        
        cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        
        view.backgroundColor = .white
        
        view.addSubview(textFieldContainerView)
        textFieldContainerView.addSubview(todoTextField)
        textFieldContainerView.addSubview(locationTextField)
        textFieldContainerView.addSubview(dateTextField)
        textFieldContainerView.addSubview(dateLabel)
        
        view.addSubview(datePicker)
        
        view.addSubview(buttonContainerView)
        buttonContainerView.addSubview(cancelButton)
        buttonContainerView.addSubview(saveButton)
        
        textFieldContainerView.snp.makeConstraints {
            $0.height.equalTo(150)
            
            $0.top.equalTo(view.snp.top).offset(150)
            $0.left.equalTo(view.snp.left).inset(50)
            $0.right.equalTo(view.snp.right).inset(50)
        }
        
        todoTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.greaterThanOrEqualTo(200)
            $0.width.lessThanOrEqualTo(230)
            
            $0.top.equalTo(textFieldContainerView.snp.top).offset(10)
            $0.centerX.equalTo(textFieldContainerView)
        }
        locationTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            
            $0.top.equalTo(todoTextField.snp.bottom).offset(10)
            $0.left.equalTo(todoTextField.snp.left)
            $0.right.equalTo(todoTextField.snp.right)
        }
        dateTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            
            $0.top.equalTo(locationTextField.snp.bottom).offset(10)
            $0.left.equalTo(locationTextField.snp.left)
            $0.right.equalTo(locationTextField.snp.right)
        }        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(dateTextField.snp.bottom).offset(10)
            $0.centerX.equalTo(textFieldContainerView)
        }
        
        datePicker.snp.makeConstraints {
            $0.top.equalTo(textFieldContainerView.snp.bottom)
            $0.left.equalTo(view.snp.left)
            $0.right.equalTo(view.snp.right)
        }
        
        buttonContainerView.snp.makeConstraints {
            $0.height.equalTo(100)
            
            $0.top.equalTo(datePicker.snp.bottom)
            $0.left.equalTo(datePicker.snp.left)
            $0.right.equalTo(datePicker.snp.right)
        }
        cancelButton.snp.makeConstraints {
            $0.width.equalTo(view.bounds.width / 2)
            
            $0.top.equalTo(buttonContainerView.snp.top)
            $0.left.equalTo(buttonContainerView.snp.left)
            $0.bottom.equalTo(buttonContainerView.snp.bottom)
        }
        saveButton.snp.makeConstraints {
            
            $0.top.equalTo(buttonContainerView.snp.top)
            $0.left.equalTo(cancelButton.snp.right)
            $0.right.equalTo(buttonContainerView.snp.right)
            $0.bottom.equalTo(buttonContainerView.snp.bottom)
        }
    }
    
    @objc func didChangeDate(sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let selectedDate: String = dateFormatter.string(from: sender.date)
        self.dateTextField.text = selectedDate
    }
    
    @objc func didTapSaveButton() {
        if self.todoTextField.text ?? "" != "" && self.locationTextField.text ?? "" != "" && self.dateTextField.text ?? "" != "" {
            let plan = Plan(self.todoTextField.text ?? "", self.locationTextField.text ?? "", self.dateTextField.text ?? "")
            
            todoListVC?.list.append(plan)
            todoListVC?.todoListTableView.reloadData()
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func didTapCancelButton() {
        self.todoTextField.text = ""
        self.locationTextField.text = ""
        self.dateTextField.text = ""
    }

}
