//
//  ViewController.swift
//  RGBColors
//
//  Created by Alex Novoseltsev on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redDynemicColorLabel: UILabel!
    @IBOutlet var greenDynemicColorLabel: UILabel!
    @IBOutlet var blueDynemicColorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        setColor()
        setValue()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setDynamicColorLabel()
    }
    
    //MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
        case greenLabel:
            greenLabel.text = string(from: sender)
        default:
            blueLabel.text = string(from: sender)
        }
    }
  
    //MARK: - Private Methods
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    private func setValue() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setDynamicColorLabel() {
        redDynemicColorLabel.textColor = UIColor(
            red: CGFloat(redSlider.value),
            green: 0,
            blue: 0,
            alpha: 1
        )
        greenDynemicColorLabel.textColor = UIColor(
            red: 0,
            green: CGFloat(greenSlider.value),
            blue: 0,
            alpha: 1
        )
        blueDynemicColorLabel.textColor = UIColor(
            red: 0,
            green: 0,
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

