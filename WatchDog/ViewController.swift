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
    var tt = 0
    var ss = 0
    var ff = 0
    
    @IBOutlet weak var ffffflabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        run()
    }
    
    func send() {
        let url = "https://x.xuanyuanhuangdi.org/setXModelInfoseqxx/key/res1/1/k"
        NetwokingManager.request(method: .get, URLString: url, parameters: nil) { [weak self] res in
            guard let self = self else { return }
//            debugPrint("ss=\(res)")
            self.checking(true)
        } failure: { error in
            debugPrint("e=\(error)")
//            self.times += 1
            self.checking(false)
        }
        
        let url1 = "https://us4.xuanyuanhuangdi.org/setXModelInfoseqxx/key/res1/1/k"
        NetwokingManager.request(method: .get, URLString: url, parameters: nil) { [weak self] res in
            guard let self = self else { return }
//            debugPrint("ss=\(res)")
            self.checking(true)
        } failure: { error in
            debugPrint("e=\(error)")
//            self.times += 1
            self.checking(false)
        }
        
        let url2 = "https://uscn.xuanyuanhuangdi.org/setXModelInfoseqxx/key/res1/1/k"
        NetwokingManager.request(method: .get, URLString: url, parameters: nil) { [weak self] res in
            guard let self = self else { return }
//            debugPrint("ss=\(res)")
            self.checking(true)
        } failure: { error in
            debugPrint("e=\(error)")
//            self.times += 1
            self.checking(false)
        }
        
        let url3 = "https://ustxz.xuanyuanhuangdi.org/setXModelInfoseqxx/key/res1/1/k"
        NetwokingManager.request(method: .get, URLString: url, parameters: nil) { [weak self] res in
            guard let self = self else { return }
//            debugPrint("ss=\(res)")
            self.checking(true)
        } failure: { error in
            debugPrint("e=\(error)")
//            self.times += 1
            self.checking(false)
        }
        
        let url4 = "https://usrn.xuanyuanhuangdi.org/setXModelInfoseqxx/key/res1/1/k"
        NetwokingManager.request(method: .get, URLString: url, parameters: nil) { [weak self] res in
            guard let self = self else { return }
//            debugPrint("ss=\(res)")
            self.checking(true)
        } failure: { error in
            debugPrint("e=\(error)")
//            self.times += 1
            self.checking(false)
        }
    }
    
    func checking(_ isOk: Bool) {
        tt += 1
        if isOk {
            ss += 1
        }else{
            ff += 1
        }
        if tt == 5 {
            if ss < 5 {
                self.kill(NSButton())
//                debugPrint("ff")
                times += 1
            }else{
//                debugPrint("ss")
            }
            ss = 0
            ff = 0
            tt = 0
        }
//        debugPrint("tt=\(tt),ss=\(ss),ff=\(ff)")
    }
        
    func run() {
        ffffflabel.stringValue = "超时次数：\(times)"
        send()
        
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

