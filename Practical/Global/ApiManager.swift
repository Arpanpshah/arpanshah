//
//  ApiManager.swift
//  Practical
//
//  Created by Arpan Shah on 19/07/21.
//

import Foundation
import Alamofire
import Reachability

class ApiManager : NSObject,URLSessionDelegate{
    
    static let sharedInstance = ApiManager()
    var reachability = try! Reachability()
    
    
    func GetResponseFrom(strUrl:String , completionHandler:@escaping (_ result:Any, _ responseInData:Data, _ status:Bool, _ statusCode:CLong)->Void ) -> ()
    {
        if reachability.connection == .unavailable
        {
            print("No Internet")
            return
        }
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.main)
        
        let postUrl = URL(string: strUrl)
        
        let Request = NSMutableURLRequest(url: postUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        Request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        Request.addValue("application/json", forHTTPHeaderField: "Accept")
        Request.addValue("a5ce5401e0e5845798437d182f9a86f4", forHTTPHeaderField: "key")
        Request.httpMethod="GET"
        
        let task:URLSessionDataTask = session.dataTask(with: Request as URLRequest){
            data,response,error in
            
            if error != nil
            {
                print(error?.localizedDescription as Any)
                let httpResponse : HTTPURLResponse = response as! HTTPURLResponse
                completionHandler(error?.localizedDescription as Any,data!,false,httpResponse.statusCode)
                return
            }
            do
               {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if let parseJSON = json
                {
                    print(parseJSON)
                    let httpResponse : HTTPURLResponse = response as! HTTPURLResponse
                    completionHandler(parseJSON,data!,(error ==  nil),httpResponse.statusCode)
                }
               }
            catch let error as NSError
            {
                let httpResponse : HTTPURLResponse = response as! HTTPURLResponse
                completionHandler(error.localizedDescription as Any,data!,false,httpResponse.statusCode)
                print(error)
            }
        }
        task.resume()
    }
    
}
