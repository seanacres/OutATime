//
//  TimePickerViewController.swift
//  OutATime
//
//  Created by Sean Acres on 6/12/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
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
