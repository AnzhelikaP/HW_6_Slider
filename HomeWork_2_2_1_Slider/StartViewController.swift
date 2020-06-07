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
    @IBOutlet var StartStackView: UIStackView!
    
    var valueRed = 1.0
    var valueGreen = 1.0
    var valueBlue = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorViewStart(red: valueRed, green: valueGreen, blue: valueBlue)
        StartStackView.isHidden = true
    }
    
     // MARK: - Передаем параметры цветов на 2 экран по сегвею
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue"{
            let newColorVC = segue.destination as! SetupViewController
            
            newColorVC.delegate = self // обязательно
            newColorVC.redStart = Double(self.redLabelStart.text ?? "") ?? 0.0
            newColorVC.greenStart = Double(self.greenLabelStart.text ?? "") ?? 0.0
            newColorVC.blueStart = Double(self.blueLabelStart.text ?? "") ?? 0.0
            
        }
    }
}
extension StartViewController: SetupViewControllerDelegate {
    
    // MARK: - функция передачи параметров цветов из протокола
    func colorViewStart(red: Double, green: Double, blue: Double) {
        // фиксируем значения параметров цветов в текстовых полях
        redLabelStart.text = String(red)
        greenLabelStart.text = String(green)
        blueLabelStart.text = String(blue)
        // задаем цвет 1 экрана
        startColorView.backgroundColor = UIColor(red: CGFloat(red),
                                                 green: CGFloat(green),
                                                 blue:CGFloat(blue),
                                                 alpha: 1)
    }
}
