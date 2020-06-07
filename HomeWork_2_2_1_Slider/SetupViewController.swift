
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
    
    @IBOutlet var textFieldRed: UITextField!
    @IBOutlet var textFieldGreen: UITextField!
    @IBOutlet var textFieldBlue: UITextField!
    
    var delegate: SetupViewControllerDelegate!
    
    // инициализируем переменные, которые отвечают за цвет картинки при начале работы и впоследствии при переходе между экранами
    var redStart: Double = 0.0
    var greenStart: Double = 0.0
    var blueStart: Double = 0.0
    var newColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // важно для работы с протоколом текстовых полей!
        textFieldRed.delegate = self
        textFieldGreen.delegate = self
        textFieldBlue.delegate = self
        
        colorView.layer.cornerRadius = 20
        
        colorValue()
        colorShift()
        colorValueStart()
    }
    
    // Одно действие для 3 слайдеров
    
    @IBAction func SliderColor(_ sender: Any) {
        colorShift()
        colorValueStart()
        
    }
    
    @IBAction func doneButtonPressed() {
        let valueRed = sliderRed.value
        let valueGreen = sliderGreen.value
        let valueBlue = sliderBlue.value
        // передаем значения цветов нашей картинки на 1 экран
        delegate.colorViewStart(red: Double(valueRed), green: Double(valueGreen), blue: Double(valueBlue))
        dismiss(animated: true)
    }
}

extension SetupViewController {
    
    // MARK: - картинка 2 экрана принимает цвет, установленный слайдерами
    func colorShift() {
        colorView.backgroundColor = UIColor(red: CGFloat(sliderRed.value),
                                            green: CGFloat(sliderGreen.value),
                                            blue:CGFloat(sliderBlue.value),
                                            alpha: 1)
    }
    
    // MARK: - функция для фиксации параметров цветов, пришедших с 1 экрана
    func colorValue() {
        redValue.text = String(format: "%.2f", sliderRed.value)
        greenValue.text = String(format: "%.2f", sliderGreen.value)
        blueValue.text = String(format: "%.2f", sliderBlue.value)
        sliderRed.value = Float(redStart)
        sliderGreen.value = Float(greenStart)
        sliderBlue.value = Float(blueStart)
    }
    
    // MARK: - функция для фиксации параметров цветов в полях и лейблах, полученных в результате движения слайдеров
    func colorValueStart() {
        redValue.text = String(format: "%.2f", sliderRed.value)
        greenValue.text = String(format: "%.2f", sliderGreen.value)
        blueValue.text = String(format: "%.2f", sliderBlue.value)
        textFieldRed.text = String(format: "%.2f", sliderRed.value)
        textFieldGreen.text = String(format: "%.2f", sliderGreen.value)
        textFieldBlue.text = String(format: "%.2f", sliderBlue.value)
        sliderRed.value = Float(sliderRed.value)
        sliderGreen.value = Float(sliderGreen.value)
        sliderBlue.value = Float(sliderBlue.value)
    }
}

extension SetupViewController: UITextFieldDelegate {
    
    // MARK: - скрытие клавиатуры по тапу в любом месте экрана после работы с полями
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - скрытие клавиатуры и переход на другой экран по кнопке: return (done)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let redSlider = sliderRed.value
        let greenSlider = sliderGreen.value
        let blueSlider = sliderBlue.value
        sliderRed.value = Float(textFieldRed.text ?? "") ?? redSlider
        sliderGreen.value = Float(textFieldGreen.text ?? "") ?? greenSlider
        sliderBlue.value = Float(textFieldBlue.text ?? "") ?? blueSlider
        textField.resignFirstResponder()
        //doneButtonPressed()
        return true
    }
    
    // MARK: - редактирование полейб перемещая курсор мышкойб и изменение всех параметров, которые есть на экране
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let redSlider = sliderRed.value
        let greenSlider = sliderGreen.value
        let blueSlider = sliderBlue.value
        
        if textField == textFieldRed {
            sliderRed.value = Float(textFieldRed.text ?? "") ?? redSlider
            redValue.text = String(format: "%.2f", sliderRed.value)
            colorShift()
            //textFieldGreen.becomeFirstResponder()
            
            
        } else if textField == textFieldGreen {
            sliderGreen.value = Float(textFieldGreen.text ?? "") ?? greenSlider
            greenValue.text = String(format: "%.2f", sliderGreen.value)
            colorShift()
            //textFieldBlue.becomeFirstResponder()
            
            
        } else if textField == textFieldBlue {
            sliderBlue.value = Float(textFieldBlue.text ?? "") ?? blueSlider
            blueValue.text = String(format: "%.2f", sliderBlue.value)
            colorShift()
            //textFieldRed.becomeFirstResponder()
            
        }
        textField.resignFirstResponder()
    }
}
