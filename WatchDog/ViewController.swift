//
//  ViewController.swift
//  WatchDog
//
//  Created by admin on 10/17/22.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func kill(_ sender: Any) {
        let runningApplications = NSWorkspace.shared.runningApplications
        for runningApp in runningApplications {
            let name = runningApp.bundleIdentifier ?? ""
            if name == "com.apple.Safari" || name == "com.west2online.ClashXPro" {
                _ = runningApp.terminate()
                _ = runningApp.forceTerminate()
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    NSWorkspace.shared.launchApplication(withBundleIdentifier: name, options: .default, additionalEventParamDescriptor: nil, launchIdentifier: nil)
                })
            }
        }
    }
}

