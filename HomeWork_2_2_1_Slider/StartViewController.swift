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
    var valueRed = 1.0
    var valueGreen = 1.0
    var valueBlue = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorViewStart(red: valueRed, green: valueGreen, blue: valueBlue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newColorVC = segue.destination as! SetupViewController
        newColorVC.delegate = self
    }
}

extension StartViewController: SetupViewControllerDelegate {
    func colorViewStart(red: Double, green: Double, blue: Double) {
       
        startColorView.backgroundColor = UIColor(red: CGFloat(red),
                                                 green: CGFloat(green),
                                                 blue:CGFloat(blue),
                                                 alpha: 1)
    }
    
}
