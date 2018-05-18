//
//  ViewController.swift
//  MarsV1
//
//  Created by Release on 2018. 5. 16..
//  Copyright © 2018년 fredhur. All rights reserved.
//

import UIKit
enum Feature : Int {
    case solarPanels = 0, greenhouses, size
    
}
class ViewController: UIViewController, UIPickerViewDelegate {
    let pickerDataSource = PickerDataSource()
    @IBOutlet weak var pickerView: UIPickerView! {
    didSet {
        pickerView.delegate = self
        pickerView.dataSource = pickerDataSource
        let features : [Feature] = [.solarPanels, .greenhouses, .size]
        
        for feature in features {
            pickerView.selectRow(2, inComponent : feature.rawValue, animated : false)
            print("feature.rawValue=",feature.rawValue)
        }
    }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let feature = Feature(rawValue : component) else {
            fatalError("Invalid component \(component)")
        }
        return pickerDataSource.title(for: row, feature: feature)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

