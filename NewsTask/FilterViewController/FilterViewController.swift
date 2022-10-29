//
//  FilterViewController.swift
//  NewsTask
//
//  Created by Клоун on 25.10.2022.
//
#warning("Date filter")
import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var fromDataTextField: UITextField!
    @IBOutlet weak var toDataTextField: UITextField!
    
    private let datePicker = UIDatePicker()
    private var filterItems = FiltersManager.shared.getFilterItems()
    private let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields(fromDataTextField, toDataTextField)
        createDatePicker()
        setupNavigationBar()
        
        let dateFilters = FiltersManager.shared.getFilterItems()
        toDataTextField.text = dateFilters.to
        fromDataTextField.text = dateFilters.from
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    @IBAction func applyButtonPressed() {
        let toDate = toDataTextField.text
        let fromDate = fromDataTextField.text
        
        let newFilters = FilterItemsModel(to: toDate, from: fromDate)
        print(newFilters)
        FiltersManager.shared.add(filterItems: newFilters)
    }
    
    private func setupTextFields(_ textfields: UITextField...) {
        textfields.forEach {
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: $0.frame.height - 2, width: $0.frame.width - 20, height: 2)
            bottomLine.backgroundColor = UIColor.orange.cgColor
            $0.layer.addSublayer(bottomLine)
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
        navigationController?.navigationBar.tintColor = .orange
        
        let clearButton = UIButton(type: .system)
        clearButton.setImage(UIImage(named: "Union"), for: .normal)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.sizeToFit()
        clearButton.addTarget(self, action: #selector(clearParameters), for: .touchUpInside)
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Logo"))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "BackButton"), style: .plain, target: self, action: #selector(backButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: clearButton)
    }
    
    @objc private func clearParameters() {
        fromDataTextField.text = ""
        toDataTextField.text = ""
    }
    
    @objc private func doneButtonPressed() {
        let dateString = dateFormatter.string(from: datePicker.date)
        
        if fromDataTextField.isFirstResponder {
            fromDataTextField.text = dateString
            datePicker.date = Date()
        } else {
            toDataTextField.text = dateString
            datePicker.date = Date()
        }
        view.endEditing(true)
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }
}
