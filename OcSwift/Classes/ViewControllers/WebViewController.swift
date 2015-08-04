//
//  WebViewController.swift
//  OcSwift
//
//  Created by 李文龙 on 15/8/3.
//  Copyright © 2015年 李文龙. All rights reserved.
//

import UIKit

class WebViewController: BaseViewController,UIWebViewDelegate{
    @IBOutlet weak var webView: UIWebView!

    //MARK: - Private Method
    func initData(){
        
    }
    
    func initViews(){
        
        self.webView.delegate = self;
        let htmlPath = ITTPathForBundleResource("www/index.html");
        NSLog("htmlPath:\(htmlPath)");
        let htmlStr = String(NSString(fileInMainBundle:"www/index.html"));
        NSLog("htmlStr:\(htmlStr)");
        webView.loadHTMLString(htmlStr, baseURL: NSURL(string: htmlPath));
    }
    
    //MARK: - Lifecycle Method
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initData();
        self.initViews();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        
    }
    
    //MARK: - UIWebViewDelegate
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true;
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        let title = self.webView.stringByEvaluatingJavaScriptFromString("document.title");
        self.title = title;
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
