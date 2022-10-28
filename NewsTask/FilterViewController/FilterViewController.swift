//
//  FilterViewController.swift
//  NewsTask
//
//  Created by Клоун on 25.10.2022.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var fromDataTextField: UITextField!
    @IBOutlet weak var toDataTextField: UITextField!
    
    private let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields(fromDataTextField, toDataTextField)
        createDatePicker()
        setupNavigationBar()
    }
    
    private func setupTextFields(_ textfields: UITextField...) {
        for textField in textfields {
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width - 20, height: 2)
            bottomLine.backgroundColor = UIColor.orange.cgColor
            textField.layer.addSublayer(bottomLine)
        }
    }
    
    private func setupToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonPressed))
        toolbar.setItems([.flexibleSpace(), doneButton], animated: true)
        
        return toolbar
    }
    
    private func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        fromDataTextField.inputView = datePicker
        fromDataTextField.inputAccessoryView = setupToolbar()
        
        toDataTextField.inputView = datePicker
        toDataTextField.inputAccessoryView = setupToolbar()
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "BackButton"), style: .plain, target: self, action: #selector(backButtonPressed))
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Logo"))
    }
    
    @objc private func doneButtonPressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: datePicker.date)
        
        fromDataTextField.text = dateString
        view.endEditing(true)
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }
}
