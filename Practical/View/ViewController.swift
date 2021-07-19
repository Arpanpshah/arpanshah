//
//  ViewController.swift
//  Practical
//
//  Created by Arpan Shah on 19/07/21.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tblData : UITableView!
    @IBOutlet var arrData : NSArray!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblData.delegate = self
        tblData.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    //MARK:- UITableview Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
        return cell
    }
    
    //MARK:- API Calling
    func getData()
    {
        
    }
}




