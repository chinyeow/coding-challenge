//
//  TopicFormViewController.swift
//  coding-challenge
//
//  Created by Law Chin Yeow on 24/07/2019.
//  Copyright © 2019 Law Chin yeow. All rights reserved.
//

import UIKit

class TopicFormViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var txtTopic: UITextView!
    @IBOutlet weak var txtCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtTopic.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        txtTopic.becomeFirstResponder()
        setPlaceHolder()
        updateTextCount()
    }
    
    /// Set placeholder for TextView
    func setPlaceHolder() {
        txtTopic.text = "Fill in your topic here"
        txtTopic.textColor = UIColor.lightGray
        txtTopic.selectedTextRange = txtTopic.textRange(from: txtTopic.beginningOfDocument, to: txtTopic.beginningOfDocument)
    }
    
    /// Update text count
    func updateTextCount() {
        if txtTopic.textColor == UIColor.lightGray {
            txtCount.text = "0/255"
        } else {
            txtCount.text = "\(txtTopic.text.count)/255"
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if txtTopic.text.isEmpty {
            setPlaceHolder()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Combine the textView text and the replacement text to
        // create the updated text string
        let currentText:String = txtTopic.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        // If updated text view will be empty, add the placeholder
        // and set the cursor to the beginning of the text view
        if updatedText.isEmpty {
            
            setPlaceHolder()
        }
            
            // Else if the text view's placeholder is showing and the
            // length of the replacement string is greater than 0, set
            // the text color to black then set its text to the
            // replacement string
        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.textColor = UIColor.black
            textView.text = text
        }
            // For every other case, the text should change with the usual
            // behavior...
        else {
            let newLength = textView.text.count + text.count - range.length
            return newLength <= 255
        }
        
        // ...otherwise return false since the updates have already
        // been made
        return false
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if textView.textColor == UIColor.lightGray {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
        updateTextCount()
    }
    
    @IBAction func save(_ sender: Any) {
        AppData.createTopic(txtTopic.text)
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
