//
//  NewsDetailsViewController.swift
//  OcSwift
//
//  Created by 李文龙 on 15/7/30.
//  Copyright © 2015年 李文龙. All rights reserved.
//

import UIKit

class NewsDetailsViewController: BaseViewController {
     @IBOutlet weak var textView: UITextView!
     var newModel:NewsModel?
    
    //MARK: - Private Method
    func initData(){
        self.title = newModel?.title;
    }
    
    func initViews(){
        textView.text = newModel?.desc;
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
