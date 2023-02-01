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
        
        web.load(URLRequest(url: URL(string: "http://oo64-2.palmmob.com/palmmob3_web/doceditorv3.php?type=mobile&fileUrl=https%3A%2F%2Fpalmmob3.oss-cn-shenzhen.aliyuncs.com%2Ftestres%2Ftest1.docx&user=1490838&channel=5&action=edit")!))
    }

}

