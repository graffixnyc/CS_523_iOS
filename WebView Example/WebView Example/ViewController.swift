//
//  ViewController.swift
//  WebView Example
//
//  Created by Patrick Hill on 2/5/18.
//  Copyright © 2018 Patrick Hill. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,UITextFieldDelegate,WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        super.viewWillAppear(animated)
        let urlString:String = "http://www.apple.com"
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        urlTextField.text = urlString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Challenge Solution remove the whitespace from the URL
        let urlString:String = urlTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //Challenge Solution - Check if the url is valid
        //if  !urlString.hasPrefix("http://"){
          //  urlString = "http://" + urlString
       // }
        //if isValid(urlString: urlString){
            let url:URL = URL(string: urlString)!
            let urlRequest:URLRequest = URLRequest(url: url)
            webView.load(urlRequest)
            urlTextField.text = urlString
            textField.resignFirstResponder()
//        }else{
//            let controller: UIAlertController = UIAlertController(title: "Invalid URL", message: "Please try again.", preferredStyle: .alert)
//            controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(controller, animated: true, completion: nil)
//        }
        return true
        
    }
//    func isValid(urlString: String) -> Bool
//    {
//        if let urlComponents = URLComponents.init(string: urlString), urlComponents.host != nil, urlComponents.url != nil
//        {
//            return true
//        }
//        return false
//    }

    @IBAction func backButtonTapped(_ sender: Any) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    
    @IBAction func forwardButtonTapped(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        urlTextField.text = webView.url?.absoluteString
    }
}

