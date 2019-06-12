//
//  TimeTravelViewController.swift
//  OutATime
//
//  Created by Sean Acres on 6/12/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    private var timer: Timer?
    
    var dateFormmater: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        return formatter
    }
    
    var currentSpeed: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLabel.text = dateFormmater.string(from: Date())
    }
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in self.updateSpeed() })
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateSpeed() {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            speedLabel.text = "\(currentSpeed) MPH"
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
        datePickerVC.delegate = self
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormmater.string(from: date)
    }
}
