//
//  EntryDetailViewController.swift
//  journal
//
//  Created by Jon Corn on 12/15/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - Properties
    var entryLanding: Entry? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let entry = entryLanding {
            guard let title = titleTextField.text, let bodyText = bodyTextView.text else { return }
            EntryController.shared.updateEntry(entry: entry, title: title, bodyText: bodyText)
        } else {
            guard let title = titleTextField.text, let bodyText = bodyTextView.text else { return }
            EntryController.shared.addEntry(title: title, bodyText: bodyText)
        }
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    // MARK: - Functions
    func updateViews() {
        loadViewIfNeeded()
        if let entry = entryLanding {
            titleTextField.text = entry.title
            bodyTextView.text = entry.bodyText
        }
    }
}
