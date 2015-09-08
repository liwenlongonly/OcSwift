//
//  ThreeViewController.swift
//  OcSwift
//
//  Created by 李文龙 on 15/8/5.
//  Copyright © 2015年 李文龙. All rights reserved.
//

import UIKit

class ThreeViewController: BaseViewController,UIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate{
    //MARK: - Private Method
    func initViews()
    {
        let rightBtn = self.createRightItemAction(Selector("rightBtnClick:"));
        rightBtn.setTitle("Alert", forState: UIControlState.Normal);
    }
    
   //MARK: - UIButton Event
   func rightBtnClick(btn:UIButton){
        
        let alertView = UIAlertView(title: "输入", message:"", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定");
        alertView.message = nil;
        alertView.alertViewStyle = UIAlertViewStyle.PlainTextInput;
        let textField = alertView.textFieldAtIndex(0);
        textField?.tintColor = UIColor.redColor();
        alertView.show();
    
    }
    
    //MARK: - Lifecycle Method
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        self.title = "我的";
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initViews();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIAlertViewDelegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1{
            let textField = alertView.textFieldAtIndex(0);
            print("textField :\(textField?.text)");
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = "CellID"
        var cell :UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier);
        if cell == nil{
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: identifier);
            cell?.detailTextLabel?.numberOfLines = 0;
        }
        cell?.textLabel?.text = String("第\(indexPath.row)行");
        return cell!
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
