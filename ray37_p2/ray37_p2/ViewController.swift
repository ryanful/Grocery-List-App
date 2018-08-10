//
//  ViewController.swift
//  ray37_p2
//
//  Created by Raheel Yanful on 3/8/18.
//  Copyright © 2018 Raheel Yanful. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var pageLabel: UILabel!
    
    var toggle: UISwitch!
    
    var instruction: UILabel!
    var howtodelete: UILabel!
    
    var itemLabel: UILabel!
    var itemTextField: UITextField!
    
    var amountLabel: UILabel!
    var amountTextField: UITextField!
    
    var warning: UILabel!
    
    var addButton: UIButton!
    var delete: UIButton!
    
    var gLabel: UILabel!
    var gList: UITextView!
    
    var groc: [String:String] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        //groc = [:]
        //page label
        pageLabel = UILabel()
        pageLabel.text = "Groceries"
        pageLabel.font = .systemFont(ofSize: 18)
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //toggle switch
        toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        
        //instruction label
        instruction = UILabel()
        instruction.text = "Please enter the item and the amount you need. Then press 'Add'"
        instruction.font = .systemFont(ofSize: 12)
        instruction.translatesAutoresizingMaskIntoConstraints = false
        
        //DELETE label
        howtodelete = UILabel()
        howtodelete.text = "If you want to delete an item enter the item, then press delete."
        howtodelete.font = .systemFont(ofSize: 12)
        howtodelete.translatesAutoresizingMaskIntoConstraints = false
        
        //item label
        itemLabel = UILabel()
        itemLabel.text = "Item: "
        itemLabel.font = .boldSystemFont(ofSize: 18)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //item text field
        itemTextField = UITextField()
        itemTextField.textColor = .white
        itemTextField.layer.cornerRadius = 10
        itemTextField.backgroundColor = UIColor(red: 144/255, green: 19/255, blue: 254/255, alpha: 1.0)
        itemTextField.delegate = self
        itemTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //amount Label
        amountLabel = UILabel()
        amountLabel.text = "Amount: "
        amountLabel.font = UIFont.boldSystemFont(ofSize: 18)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //amount text field
        amountTextField = UITextField()
        amountTextField.textColor = .white
        amountTextField.layer.cornerRadius = 10
        amountTextField.backgroundColor = UIColor(red: 144/255, green: 19/255, blue: 254/255, alpha: 1.0)
        amountTextField.delegate = self
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //warning label
        warning = UILabel()
        warning.font = .systemFont(ofSize: 14)
        warning.textColor = .black
        warning.translatesAutoresizingMaskIntoConstraints = false
        
        //add button
        addButton = UIButton()
        addButton.backgroundColor = .red
        addButton.layer.cornerRadius = 10
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.addTarget(self, action: #selector(addPress), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        //delete button
        delete = UIButton()
        delete.backgroundColor = .red
        delete.layer.cornerRadius = 10
        delete.setTitle("Delete", for: .normal)
        delete.setTitleColor(.white, for: .normal)
        delete.addTarget(self, action: #selector(deletePress), for: .touchUpInside)
        delete.translatesAutoresizingMaskIntoConstraints = false
        
        // glist label
        gLabel = UILabel()
        gLabel.text = "Grocery List"
        gLabel.font = UIFont.boldSystemFont(ofSize: 21)
        gLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //glist textView
        gList = UITextView()
        gList.textColor = .white
        gList.layer.cornerRadius = 10
        gList.backgroundColor = .red
        gList.font = UIFont.systemFont(ofSize: 18)
        gList.isEditable = false
        gList.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(pageLabel)
        view.addSubview(toggle)
        view.addSubview(instruction)
        view.addSubview(howtodelete)
        view.addSubview(itemLabel)
        view.addSubview(itemTextField)
        view.addSubview(amountLabel)
        view.addSubview(amountTextField)
        view.addSubview(warning)
        view.addSubview(addButton)
        view.addSubview(delete)
        view.addSubview(gLabel)
        view.addSubview(gList)
        setupContraints()
    }
    
    @objc func addPress(){
        if toggle.isOn == false{
            if let item = itemTextField.text, let amount = amountTextField.text, item != "", amount != "" {
                if(groc[item] == nil) {
                    groc[item] = amount
                    //for (_,_) in groc{
                        warning.text = "Success!"
                        gList.text = gList.text + item + ": " + amount + "\n"
                    //}
                }
                else {
                    warning.text = "Error! Item is already in list."
                }
            }else {
                warning.text = "Error! Please Try Again. Make sure you followed the instructions."
            }
            
            itemTextField.text = ""
            amountTextField.text = ""
        }
        else{
            warning.text = "Your List is Locked"
        }
    }
    
    @objc func deletePress(){
        if toggle.isOn == false{
            if let item = itemTextField.text, item != "" {
                
                groc.removeValue(forKey:item)
              
    
            }
            
            itemTextField.text = ""
            amountTextField.text = ""
        }
        else{
            warning.text = "Your List is Locked"
        }
        
        gList.text = ""
        for(key,value) in groc{
            gList.text = gList.text + key + ": " + value + "\n"
        }
    }
    
    func setupContraints(){
        
        //page label
        NSLayoutConstraint.activate([
            pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
            ])
        
        //toggle switch
        NSLayoutConstraint.activate([
            toggle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            toggle.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 16)
            ])
        
        //instruction label
        NSLayoutConstraint.activate([
            instruction.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            instruction.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 64)
            ])
        
        //delete label
        NSLayoutConstraint.activate([
            howtodelete.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            howtodelete.topAnchor.constraint(equalTo: instruction.bottomAnchor, constant: 16)
            ])
        
        //item label
        NSLayoutConstraint.activate([
            itemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            itemLabel.topAnchor.constraint(equalTo: howtodelete.bottomAnchor, constant: 16),
            itemLabel.widthAnchor.constraint(equalToConstant: itemLabel.intrinsicContentSize.width)
            ])
        
        if toggle.isOn == false {
             //item text field
            NSLayoutConstraint.activate([
                itemTextField.leadingAnchor.constraint(equalTo: amountTextField.leadingAnchor),
                itemTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                itemTextField.centerYAnchor.constraint(equalTo: itemLabel.centerYAnchor),
                itemTextField.heightAnchor.constraint(equalToConstant: 44)
                ])
            
            //amount text field
            NSLayoutConstraint.activate([
                amountTextField.leadingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: 16),
                amountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                amountTextField.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor),
                amountTextField.heightAnchor.constraint(equalToConstant: 44)
                ])
        }
        
        //amount label
        NSLayoutConstraint.activate([
            amountLabel.leadingAnchor.constraint(equalTo: itemLabel.leadingAnchor),
            amountLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 32),
            amountLabel.widthAnchor.constraint(equalToConstant: amountLabel.intrinsicContentSize.width)
            ])
        
        //warning label
        NSLayoutConstraint.activate([
            warning.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            warning.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            warning.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 32)
            ])
        
        //add button
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: warning.bottomAnchor, constant: 32),
            addButton.heightAnchor.constraint(equalToConstant: 44),
            addButton.widthAnchor.constraint(equalToConstant: 72)
            ])
        
        //delete button
        NSLayoutConstraint.activate([
            delete.leadingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 16),
            delete.topAnchor.constraint(equalTo: warning.bottomAnchor, constant: 32),
            delete.heightAnchor.constraint(equalToConstant: 44),
            delete.widthAnchor.constraint(equalToConstant: 72)
            ])
        
        //gList label
        NSLayoutConstraint.activate([
            gLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 32)
            ])
        
        //glist text view
        NSLayoutConstraint.activate([
            gList.leadingAnchor.constraint(equalTo: amountLabel.leadingAnchor),
            gList.trailingAnchor.constraint(equalTo: itemTextField.trailingAnchor),
            gList.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 64),
            gList.heightAnchor.constraint(equalToConstant: 200)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        itemTextField.endEditing(true)
        amountTextField.endEditing(true)
        return true
    }
}

