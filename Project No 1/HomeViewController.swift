//
//  ViewController.swift
//  Project No 1
//
//  Created by Habibur Rahman on 4/13/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var allMessages = [String]()
    
    var message: [String: String] = [
        "Hellllllo": "Hello",
        "Wooooorld": "World"
    ]
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chat App"
        textField.delegate = self
        tableView.separatorStyle = .none
    }

    @IBAction func sendButtonTapped(_ sender: UIButton) {
        textField.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(allMessages[indexPath.row])"
        cell.textLabel?.textAlignment = .right
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        insertText()
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func insertText() {
       
        let text = textField.text ?? ""
        
        if let alteredText = message[text] {
            allMessages.append(alteredText)
        } else {
            allMessages.append(text)
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

