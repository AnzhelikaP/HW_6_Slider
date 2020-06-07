//
//  ViewController.swift
//  HomeWork_2_2_1_Slider
//
//  Created by 1 on 23.05.2020.
//  Copyright © 2020 Anzhelika. All rights reserved.
//

import UIKit

protocol SetupViewControllerDelegate {
    func colorViewStart(red: Double, green: Double, blue: Double)
}

class SetupViewController: UIViewController {
    
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    var delegate: SetupViewControllerDelegate!
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        colorShift()
        colorValue()
        
    }
    
    // Dyeing a View
    
    func colorShift() {
        colorView.backgroundColor = UIColor(red: CGFloat(sliderRed.value),
                                            green: CGFloat(sliderGreen.value),
                                            blue:CGFloat(sliderBlue.value),
                                            alpha: 1)
    }
    
    func colorValue() {
        redValue.text = String(format: "%.2f", sliderRed.value)
        greenValue.text = String(format: "%.2f", sliderGreen.value)
        blueValue.text = String(format: "%.2f", sliderBlue.value)
    }
    
    // One action for three sliders
    
    @IBAction func SliderColor(_ sender: Any) {
            colorShift()
            
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        let valueRed = sliderRed.value
        let valueGreen = sliderGreen.value
        let valueBlue = sliderBlue.value
        delegate.colorViewStart(red: Double(valueRed), green: Double(valueGreen), blue: Double(valueBlue))
        dismiss(animated: true)
    }
   
}

