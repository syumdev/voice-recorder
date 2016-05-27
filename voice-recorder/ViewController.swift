//
//  ViewController.swift
//  voice-recorder
//
//  Created by Seungheon Yum on 5/26/16.
//  Copyright © 2016 syumdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var _btnRecord: UIButton!
    @IBOutlet weak var _lblTapToRecord: UILabel!
    @IBOutlet weak var _btnStopRecording: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        _btnStopRecording.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBtnRecordClicked(sender: AnyObject) {
        _btnRecord.enabled=false
        _lblTapToRecord.text = "Recording in Progress..."
        _btnStopRecording.enabled=true
    }

    @IBAction func onBtnStopRecordingClicked(sender: AnyObject) {
        _btnRecord.enabled=true
        _lblTapToRecord.text="Tap To Record..."
        _btnStopRecording.enabled=false
    }
    
}

