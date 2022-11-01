//
//  ViewController.swift
//  WatchDog
//
//  Created by admin on 10/17/22.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var label: NSTextField!
    var times = 0
    
    @IBOutlet weak var ffffflabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        run()
    }
        
    func run() {
        ffffflabel.stringValue = "超时次数：\(times)"
        let url = "https://x.xuanyuanhuangdi.org/setXModelInfoseqx/key/res1/1/k"
        NetwokingManager.request(method: .get, URLString: url, parameters: nil) { [weak self] res in
            guard let self = self else { return }
//            debugPrint("ss=\(res)")
        } failure: { error in
            self.kill(NSButton())
            debugPrint("e=\(error)")
            self.times += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+20, execute: {
            self.run()
        })
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
//            if name == "com.apple.Safari" || name == "com.west2online.ClashXPro" {
            if name == "com.west2online.ClashXPro" {
                _ = runningApp.terminate()
                _ = runningApp.forceTerminate()
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    NSWorkspace.shared.launchApplication(withBundleIdentifier: name, options: .default, additionalEventParamDescriptor: nil, launchIdentifier: nil)
                })
            }
        }
    }
}

