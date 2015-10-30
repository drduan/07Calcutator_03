//
//  ViewController.swift
//  07Calcutator_03
//
//  Created by duanxudong on 15/10/22.
//  Copyright © 2015年 duanxudong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var logic = CalcuLogic()
    @IBOutlet weak var mainLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func operandPressed(sender: AnyObject) {
        mainLabel.text = logic.calculateByTag(sender.tag,withMainLabelString:mainLabel.text!)
        
        
        
    }
    @IBAction func numberButtonPressed(sender: AnyObject) {
        
        mainLabel.text = self.logic.updateMainLabelStringByNumberTag(sender.tag, withMainLabelString: mainLabel.text!)

        print(sender.tag!)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func decimalPressed(sender: AnyObject) {
        
        if logic.doesStringContainDecimal(mainLabel.text!){
            let string = mainLabel.text! + "."
            mainLabel.text = string
            
        }
    }
      @IBAction func clearPressed(sender: AnyObject) {
        
        mainLabel.text = "0"
        logic.clean()
    }

    @IBAction func equalsPressed(sender: AnyObject) {
     
        mainLabel.text = logic.calculateByTag(sender.tag,withMainLabelString:mainLabel.text!)
        
    }
}

