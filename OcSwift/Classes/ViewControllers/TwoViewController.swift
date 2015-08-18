//
//  TwoViewController.swift
//  OcSwift
//
//  Created by 李文龙 on 15/8/5.
//  Copyright © 2015年 李文龙. All rights reserved.
//

import UIKit

class TwoViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var laraCroftView: UIImageView!
    //MARK: - Private Method
    func initData()
    {
        laraCroftView.contentMode = UIViewContentMode.ScaleAspectFit;
        laraCroftView.backgroundColor = UIColor.clearColor();
    }
    
    func initViews()
    {
        print(tableView.width);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.contentInset = UIEdgeInsetsMake(240, 0, 0, 0);
        laraCroftView.frame = CGRectMake(
            0, -240, tableView.width, 240);
        tableView.addSubview(laraCroftView);
        self.tableView.reloadDataAnimateWithWave(WaveAnimation.RightToLeftWaveAnimation);
    }
    
    override func linkRef() {
        self.tableViewRef = self.tableView;
    }
    
    //MARK: - Lifecycle Method
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        self.title = "优惠券";
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews(){
         super.viewDidLayoutSubviews()
        print(tableView.width);
        laraCroftView.frame = CGRectMake(
            0, -240, tableView.width, 240);
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
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
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
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset  = scrollView.contentOffset.y;
        if (yOffset < -240) {
            var f = self.laraCroftView.frame;
            f.origin.y = yOffset;
            f.size.height =  -yOffset;
            self.laraCroftView.frame = f;
        }
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
