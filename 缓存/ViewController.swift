//
//  ViewController.swift
//  缓存
//
//  Created by idea_liujl on 17/7/17.
//  Copyright © 2017年 idea_liujl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Cachelable: UILabel!
    @IBAction func readC(sender: AnyObject) {
        self.Cachelable.text = XCache.returnCacheSize()+"MB"
    }
    @IBAction func cleanC(sender: AnyObject) {
        XCache.cleanCache{
            self.Cachelable.text = XCache.returnCacheSize()+"MB"
        }
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

