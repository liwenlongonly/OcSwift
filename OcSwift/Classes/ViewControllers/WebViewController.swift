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
    private var _bridge:WebViewJavascriptBridge?;
    var count:Float = 10.0;
    //MARK: - Btn Event
    func rightBtnClick(btn:UIButton){
        _bridge?.callHandler("testJavascriptHandler", data:["key":"value"],responseCallback: { (response) -> Void in
            NSLog("sendMessage got response: \(response)");
        });
    }
    
    @IBAction func sendMsgBtnClick(sender: AnyObject) {
        _bridge?.send("sendMessage to web", responseCallback: { (response) -> Void in
            NSLog("sendMessage got response: \(response)");
        })
    }
    
    override func onGoBack(sender: AnyObject!) {
        if self.webView.canGoBack{
            self.webView.goBack();
        }else{
            self.navigationController?.popViewControllerAnimated(true);
        }
    }
    
    //MARK: - Private Method
    func initData(){

    }
    
    func initViews(){
    
        let rightBtn = self.createRightItemAction(Selector("rightBtnClick:"));
        rightBtn.bounds = CGRectMake(0, 0, 60, 40);
        rightBtn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal);
        rightBtn.setTitle("callJS", forState: UIControlState.Normal);
        
        self.webView.delegate = self;
        let htmlPath = ITTPathForBundleResource("www/index.html");
        NSLog("htmlPath:\(htmlPath)");
        let htmlStr = String(NSString(fileInMainBundle:"www/index.html"));
        webView.loadHTMLString(htmlStr, baseURL: NSURL(string: htmlPath));
        if _bridge == nil{
            WebViewJavascriptBridge.enableLogging();
            _bridge = WebViewJavascriptBridge(forWebView: webView, webViewDelegate: self, handler: { (data, responseCallback) -> Void in
                NSLog("ObjC received message from JS: \(data)");
                responseCallback("Response for message from ObjC");
            });
        }
        
        _bridge?.registerHandler("testObjcCallback", handler: { (data, responseCallback) -> Void in
            NSLog("\(data)");
            responseCallback(["name":"liwenlong"]);
        });
        
    }
    
    //MARK: - Lifecycle Method
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
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
