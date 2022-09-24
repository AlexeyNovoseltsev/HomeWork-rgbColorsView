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
        
        setupLabel()
        
    }
    
    override func viewWillLayoutSubviews() {
        setDynamicColorLabel()
    }
    
    //MARK: - IBActions
    @IBAction func sliderAction() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    //MARK: - Private Methods
    private func setupLabel() {
        redLabel.text = redSlider.value.formatted()
        greenLabel.text = greenSlider.value.formatted()
        blueLabel.text = blueSlider.value.formatted()
    }
    
    private func setDynamicColorLabel() {
        redDynemicColorLabel.textColor = UIColor(
            red: CGFloat (redSlider.value), green: 0, blue: 0, alpha: 1
        )
        greenDynemicColorLabel.textColor = UIColor(
            red: 0, green: CGFloat (greenSlider.value), blue: 0, alpha: 1
        )
        blueDynemicColorLabel.textColor = UIColor(
            red: 0, green: 0, blue: CGFloat(blueSlider.value), alpha: 1
        )
    }
}

