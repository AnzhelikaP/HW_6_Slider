//
//  StartViewController.swift
//  HomeWork_2_2_1_Slider
//
//  Created by 1 on 07.06.2020.
//  Copyright © 2020 Anzhelika. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet var startColorView: UIView!
    
    @IBOutlet var redLabelStart: UILabel!
    
    @IBOutlet var greenLabelStart: UILabel!
    
    @IBOutlet var blueLabelStart: UILabel!
    
    var valueRed = 1.0
    var valueGreen = 1.0
    var valueBlue = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorViewStart(red: valueRed, green: valueGreen, blue: valueBlue)
    }
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let newColorVC = segue.destination as! SetupViewController
        
        newColorVC.delegate = self
        
        newColorVC.redStart = valueRed
        newColorVC.greenStart = valueGreen
        newColorVC.blueStart = valueBlue
        print("\(newColorVC.redStart)")
    }
} */

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "mySegue"{
        let newColorVC = segue.destination as! SetupViewController
        newColorVC.delegate = self
        
        //newColorVC.newColorView = self.startColorView!
        
        newColorVC.redStart = Double(self.redLabelStart.text ?? "") ?? 0.0
        newColorVC.greenStart = Double(self.greenLabelStart.text ?? "") ?? 0.0
        newColorVC.blueStart = Double(self.blueLabelStart.text ?? "") ?? 0.0
        
    }
}
}
extension StartViewController: SetupViewControllerDelegate {
   
    
    func colorViewStart(red: Double, green: Double, blue: Double) {
        redLabelStart.text = String(red)
        greenLabelStart.text = String(green)
        blueLabelStart.text = String(blue)
        
        startColorView.backgroundColor = UIColor(red: CGFloat(red),
                                                 green: CGFloat(green),
                                                 blue:CGFloat(blue),
                                                 alpha: 1)
    }
    
   
}
