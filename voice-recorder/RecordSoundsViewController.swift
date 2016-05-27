//
//  ViewController.swift
//  voice-recorder
//
//  Created by Seungheon Yum on 5/26/16.
//  Copyright © 2016 syumdev. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var _btnRecord: UIButton!
    @IBOutlet weak var _lblTapToRecord: UILabel!
    @IBOutlet weak var _btnStopRecording: UIButton!
    
    
    var _audioRecorder:AVAudioRecorder!

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
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! _audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        _audioRecorder.meteringEnabled = true
        _audioRecorder.prepareToRecord()
        _audioRecorder.record()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }

    @IBAction func onBtnStopRecordingClicked(sender: AnyObject) {
        _btnRecord.enabled=true
        _lblTapToRecord.text="Tap To Record..."
        _btnStopRecording.enabled=false
        _audioRecorder.stop()
        
    }
    
}

