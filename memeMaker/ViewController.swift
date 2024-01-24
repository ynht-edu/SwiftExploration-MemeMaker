//
//  ViewController.swift
//  memeMaker
//
//  Created by Yayat Nurhidayat on 22/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topSegmentedControl.removeAllSegments()
        
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.captionOpt, at: topChoices.count, animated: false)
        }
        
        topSegmentedControl.selectedSegmentIndex = 0
        
        
        bottomSegmentedControl.removeAllSegments()
        
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.captionOpt, at: topChoices.count, animated: false)
        }
        
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        
        linkSegmentToCaption()
    }
    
    var topChoices: [CaptionOption] = [CaptionOption(captionOpt: "❶", captionText: "upper text 1"), CaptionOption(captionOpt: "❷", captionText: "upper text 2"), CaptionOption(captionOpt: "❸", captionText: "upper text 3")]
    var bottomChoices: [CaptionOption] = [CaptionOption(captionOpt: "❶", captionText: "bot text 1"), CaptionOption(captionOpt: "❷", captionText: "bot text 2"), CaptionOption(captionOpt: "❸", captionText: "bot text 3")]

    

    @IBAction func topSegmentedControlChange(_ sender: UISegmentedControl) {
        linkSegmentToCaption()
    }
    
    @IBAction func bottomSegmentedControlChange(_ sender: UISegmentedControl) {
        linkSegmentToCaption()
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
        
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
    
    func linkSegmentToCaption() {
        topCaptionLabel.text = topChoices[topSegmentedControl.selectedSegmentIndex].captionText
        bottomCaptionLabel.text = bottomChoices[bottomSegmentedControl.selectedSegmentIndex].captionText
    }
}

