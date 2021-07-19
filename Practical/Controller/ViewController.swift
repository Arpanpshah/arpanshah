//
//  ViewController.swift
//  Practical
//
//  Created by Arpan Shah on 19/07/21.
//

import UIKit
import Alamofire
import SDWebImage
import SVProgressHUD

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tblData : UITableView!
    var arrData = NSArray()
    
    var strAPIURL = "http://sd2-hiring.herokuapp.com/api/users?offset=10&limit=10"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblData.delegate = self
        tblData.dataSource = self
        
        getData()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    //MARK:- UITableview Delegate & Datasource
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
        let dic = arrData[indexPath.row] as! NSDictionary
        cell.imgUser.sd_setImage(with: URL(string: dic["image"] as? String ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        cell.lblName.text = dic["name"] as? String ?? ""
        cell.arrImageData = dic["items"] as! NSArray
        cell.CollectionviewReaload()
        return cell
    }
    
    //MARK:- API Calling
    func getData()
    {
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(.red)
        SVProgressHUD.show()
        ApiManager.sharedInstance.GetResponseFrom(strUrl: strAPIURL) { (response, responseData, status, error) in
            print(response)
            print(responseData)
            if status{
                let dic : NSDictionary = response as! NSDictionary
                let ResponseDic = dic.value(forKey: "data") as! NSDictionary
                self.arrData = ResponseDic["users"] as! NSArray
                DispatchQueue.main.async {
                    self.tblData.reloadData()
                }
            }else{
                
            }
            SVProgressHUD.dismiss()
            self.view.isUserInteractionEnabled = true
        }
    }
}


class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}


