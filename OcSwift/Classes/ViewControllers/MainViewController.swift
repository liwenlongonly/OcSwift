//
//  MainViewController.swift
//  OcSwift
//
//  Created by 李文龙 on 15/7/29.
//  Copyright (c) 2015年 李文龙. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,ITTPullTableViewDelegate{
    @IBOutlet weak var tableView: ITTPullTableView!
    private var newsArray = NSMutableArray();
    private var isLoadMore = false;
    
    //MARK: - Private Method
    func initData(){
        self.getNewsData();
    }
    
    func getNewsData(){
        var params:Dictionary = Dictionary<String,String>();
        params["name"] = "liwenlong";
        GetNewsRequest.requestWithParameters(params, withIndicatorView: self.view) { [unowned self](request) -> Void in
            if request.isSuccess() {
                if !self.isLoadMore {
                    self.newsArray.removeAllObjects();
                }
                var insertIndexPaths = Array<NSIndexPath>();
                var index = self.newsArray.count;
                for model in request.handleredResult as! [AnyObject] {
                    self.newsArray .addObject(model);
                    insertIndexPaths.append(NSIndexPath(forRow: index, inSection: 0));
                    index++;
                }
                self.stopTablePull();
                if self.isLoadMore {
                   self.tableView.insertRowsAtIndexPaths(insertIndexPaths, withRowAnimation: UITableViewRowAnimation.None);
                }else{
                    self.tableView.reloadData();
                }
            }
        }
    }
    
    func stopTablePull(){
        tableView.pullTableIsLoadingMore = false;
        tableView.pullTableIsRefreshing = false;
    }
    
    func initViews(){
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.pullDelegate = self;
    }
    
    //MARK: - Lifecycle Method
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        self.title = "首页";
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func linkRef() {
        self.tableViewRef = self.tableView;
        self.isAnimationCell = true;
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
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let newModel = self.newsArray[indexPath.row] as! NewsModel;
        let descStr: NSString = NSString(CString: newModel.desc!.cStringUsingEncoding(NSUTF8StringEncoding)!,
            encoding: NSUTF8StringEncoding)!
        let descHeight = descStr.heightWithFont(UIFont.systemFontOfSize(13), withLineWidth: 290);
    
        return descHeight+30;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = "CellID"
        var cell :UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier);
        if cell == nil{
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: identifier);
            cell?.detailTextLabel?.numberOfLines = 0;
        }
        let newModel = self.newsArray[indexPath.row] as! NewsModel;
        cell!.textLabel!.text = newModel.title;
        cell!.detailTextLabel!.text = newModel.desc;
        
        return cell!
    }
    
    //MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true);
        let vc = WebViewController(nibName: "WebViewController", bundle: nil);
        vc.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(vc, animated: true);
    }

    //MARK: - ITTPullTableViewDelegate
    func pullTableViewDidTriggerRefresh(pullTableView: ITTPullTableView!) {
        if !tableView.pullTableIsLoadingMore {
            isLoadMore = false;
            self.getNewsData();
        }
    }
    
    func pullTableViewDidTriggerLoadMore(pullTableView: ITTPullTableView!) {
        if !tableView.pullTableIsRefreshing{
            isLoadMore = true;
            self.getNewsData();
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
