//
//  ViewController.swift
//  WKWebView_test
//
//  Created by wei dong on 2022/11/4.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUrl()
    }

    func loadUrl() {
        let cfg = WKWebViewConfiguration()
        
        let dropSharedWorkersScript = WKUserScript(source: "delete window.SharedWorker;", injectionTime: WKUserScriptInjectionTime.atDocumentStart, forMainFrameOnly: false)
        cfg.userContentController.addUserScript(dropSharedWorkersScript)

        let web = WKWebView(frame: view.bounds, configuration: cfg)
        web.uiDelegate = self
        web.navigationDelegate = self
        web.scrollView.alwaysBounceVertical = false
        view.addSubview(web)
        
        web.load(URLRequest(url: URL(string: "https://ddstar.palmmob.com/palmmob3_13/office/GoEditor?l=zh-Hans&a=13&o=16.1&d=F9168800-A598-4880-8153-83031505D897&v=166&t=1667532552&action=edit&fileurl=http%3A%2F%2F3.palmmob.com%2Fpalmmob3%2Foffice_templates%2F172.docx&n=CN&x=c475472b09e569f8fb132b25809badc3&c=apple&u=964821&usetesteditor=1")!))
    }

}

