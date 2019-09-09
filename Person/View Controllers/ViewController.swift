//
//  ViewController.swift
//  CoreData
//
//  Created by Lewis Jones on 31/08/2018.
//  Copyright © 2018 Rodrigo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

   
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let name = textField.text else { return }
        
        
        if let entry =  self.entry
        {
            EntryController.shared.update(entry: entry, with: name)
        } else {
            let entry = Entry(name: name)
            EntryController.shared.add(entry: entry)
        }
        // After adding or updating entries dismisses the current view.
      //  let _ = self.navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        guard let entry = entry else { return }
        textField.text = entry.name
        
    }
    
    
    // MARK: UITextFiledDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Properties
    
    var entry: Entry? {
        didSet {
            if isViewLoaded { updateViews() }
        }
    }
}

