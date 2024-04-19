//
//  ViewController.swift
//  changeColor
//
//  Created by YaHan on 2024/4/16.
//

import UIKit

class ViewController: UIViewController {
    // 各項IBOutlet的配對
    @IBOutlet weak var BackgroundImageView: UIImageView!
    @IBOutlet weak var clothesView: UIView!
    @IBOutlet weak var changeSegmented: UISegmentedControl!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var borderSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    //設定基本變數
    var clothesRed: Float = 198/255
    var clothesGreen: Float = 216/255
    var clothesBlue: Float = 226/255
    var clothesAlpha: Float = 1
    var bgRedValue: Float = 238/255
    var bgGreenValue: Float = 172/255
    var bgBlueValue: Float = 228/255
    var bgAlphaValue: Float = 1
    var borderRedValue: Float = 0
    var borderGreenValue: Float = 0
    var borderBlueValue: Float = 0
    var borderAlphaValue: Float = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //設置初始畫面
        let image = UIImage(named: "clothes")
        let clothesImageView = UIImageView(image: image)
        clothesImageView.frame = clothesView.bounds
        clothesImageView.contentMode = .scaleAspectFit
        clothesView.mask = clothesImageView
        
        //設定 Slider 按鈕圖片
        redSlider.setThumbImage(UIImage(named: "button"), for: .normal)
        greenSlider.setThumbImage(UIImage(named: "button"), for: .normal)
        blueSlider.setThumbImage(UIImage(named: "button"), for: .normal)
        alphaSlider.setThumbImage(UIImage(named: "button"), for: .normal)
        radiusSlider.setThumbImage(UIImage(named: "button2"), for: .normal)
        borderSlider.setThumbImage(UIImage(named: "button2"), for: .normal)
        
    }
    
    //設定function
    
    // 顏色RGB數值範圍為0~255故透過以下方式設定 Alpha為0~1
       // 並且將Sliders的"數值"傳至Label中
    func colorValueLabel() {
        redLabel.text = String(format: "%.0f", redSlider.value * 255)
        greenLabel.text = String(format: "%.0f", greenSlider.value * 255)
        blueLabel.text = String(format: "%.0f", blueSlider.value * 255)
        alphaLabel.text = String(format: "%.1f", alphaSlider.value)
    }
    
    func clothesColorSave() {
        clothesRed = redSlider.value
        clothesGreen = greenSlider.value
        clothesBlue = blueSlider.value
        clothesAlpha = alphaSlider.value
    }
    
    func bgColorValueSave() {
        bgRedValue = redSlider.value
        bgGreenValue = greenSlider.value
        bgBlueValue = blueSlider.value
        bgAlphaValue = alphaSlider.value
    }
    
    func borderColorValueSave() {
        borderRedValue = redSlider.value
        borderGreenValue = greenSlider.value
        borderBlueValue = blueSlider.value
        borderAlphaValue = alphaSlider.value
    }
    
    //呈現顏色邊框背景變數
    func clothesColorSliderSet() {
        redSlider.setValue(clothesRed, animated: true)
        greenSlider.setValue(clothesGreen, animated: true)
        blueSlider.setValue(clothesBlue, animated: true)
        alphaSlider.setValue(clothesAlpha, animated: true)
    }
    
    func bgColorSliderSet() {
        redSlider.setValue(bgRedValue, animated: true)
        greenSlider.setValue(bgGreenValue, animated: true)
        blueSlider.setValue(bgBlueValue, animated: true)
        alphaSlider.setValue(bgAlphaValue, animated: true)
    }
    
    func borderColorSliderSet() {
        redSlider.setValue(borderRedValue, animated: true)
        greenSlider.setValue(borderGreenValue, animated: true)
        blueSlider.setValue(borderBlueValue, animated: true)
        alphaSlider.setValue(borderAlphaValue, animated: true)
    }
    
    //Segmented Control & Slider 調整顏色
    @IBAction func segmentControlChanged(_ sender: Any) {
        if changeSegmented.selectedSegmentIndex == 0{
            clothesView.backgroundColor = UIColor(red: CGFloat(clothesRed), green: CGFloat(clothesGreen), blue: CGFloat(clothesBlue), alpha: CGFloat(clothesAlpha))
            clothesColorSliderSet()
        }
        else if changeSegmented.selectedSegmentIndex == 1{
            BackgroundImageView.backgroundColor = UIColor(red: CGFloat(bgRedValue), green: CGFloat(bgGreenValue), blue: CGFloat(bgBlueValue), alpha: CGFloat(bgAlphaValue))
            bgColorSliderSet()
        }
        colorValueLabel()
    }
    
    @IBAction func colorSliderChange(_ sender: Any) {
        if changeSegmented.selectedSegmentIndex == 0{
            clothesView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            clothesColorSave()
        }
        else if changeSegmented.selectedSegmentIndex == 1{
            BackgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            bgColorValueSave()
        }
        else if changeSegmented.selectedSegmentIndex == 2 {
            BackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            borderColorValueSave()
            
        }
        colorValueLabel()
    }
    
    //加入顏色隨機按鈕（random）及重置調色按鈕
    @IBAction func allRandomButtn(_ sender: Any) {
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0.1...1)
        if changeSegmented.selectedSegmentIndex == 0{
            clothesView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.1...1))
            clothesColorSave()
        }
        else if changeSegmented.selectedSegmentIndex == 1{
            BackgroundImageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.1...1))
            bgColorValueSave()
        }
        colorValueLabel()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        if changeSegmented.selectedSegmentIndex == 0{
            clothesRed = 255/255
            clothesGreen = 255/255
            clothesBlue = 255/255
            clothesAlpha = 1
            clothesColorSliderSet()
            clothesView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            clothesColorSave()
        }
        else if changeSegmented.selectedSegmentIndex == 1{
            bgRedValue = 255/255
            bgGreenValue = 255/255
            bgBlueValue = 255/255
            bgAlphaValue = 1
            bgColorSliderSet()
            BackgroundImageView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            bgColorValueSave()
        }
        colorValueLabel()
    }
    
    //利用 Slider 調整圖片的圓角、邊框
    @IBAction func radiusSliderChange(_ sender: Any) {        BackgroundImageView.layer.cornerRadius = CGFloat(radiusSlider.value)
        clothesView.layer.cornerRadius = CGFloat(radiusSlider.value)
    }
    
    @IBAction func borderSliderChange(_ sender: Any) {
        BackgroundImageView.clipsToBounds = true
        BackgroundImageView.layer.borderWidth = CGFloat(borderSlider.value)
    }
    
}
