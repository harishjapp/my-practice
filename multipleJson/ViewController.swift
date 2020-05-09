//
//  ViewController.swift
//  multipleJson
//
//  Created by harishreddy kora on 12/03/20.
//  Copyright © 2020 harishreddy kora. All rights reserved.
//

import UIKit


var URLReq : URLRequest!
var dataTask:URLSessionTask!


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToStoreData.instanceOfToStoreData.number_of_lessons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath) as! contentTableViewCell
        cell.idLable.text = String(ToStoreData.instanceOfToStoreData.id[indexPath.row])
        
        cell.nameLable.text = ToStoreData.instanceOfToStoreData.name[indexPath.row]
        cell.linkLable.text = ToStoreData.instanceOfToStoreData.link[indexPath.row]
        cell.sessionsLable.text = String( ToStoreData.instanceOfToStoreData.number_of_lessons[indexPath.row])
        do
        {
            
            // image display 
            try cell.imageDisplay.image =  UIImage(data: NSData(contentsOf: NSURL(string: ToStoreData.instanceOfToStoreData.imageurl[indexPath.row])! as URL) as Data)
        }
        catch
        {
            print("unable to load image")
        }
        return cell
        
    
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? dataViewController {
            
        }
    }
    
    @IBOutlet weak var tableDisplay: UITableView!
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }

    
    
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
     jsonDataa()
        
        
        // Do any additional setup after loading the view.
    }
  
    func jsonDataa()
    {
        //Required URL
        URLReq = URLRequest(url: URL(string:"https://api.letsbuildthatapp.com/jsondecodable/courses")!)
        
        //specifying Method
        URLReq.httpMethod = "GET"
        
        dataTask = URLSession.shared.dataTask(with: URLReq, completionHandler: {(data,studentDetails, Err)
            in
            //print(data!)
            //print("Get Response")
            
            do
            {
                //Converting to JSON format
                let convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]]
                
//                print(convertedData)
                
//                let names = convertedData[0]["name"]
//                print(names ?? "000")
                
                
                print(convertedData.count)
                
                for i in 0..<convertedData.count
                {
                    let names = convertedData[i]["name"]
                    print(names!)
                    ToStoreData.instanceOfToStoreData.name.append(names as! String)
                   // print(ToStoreData.instanceOfToStoreData.name.count)
                    let ids = convertedData[i]["id"]
                    ToStoreData.instanceOfToStoreData.id.append(ids as! Int)
                    let links = convertedData[i]["link"]
                    ToStoreData.instanceOfToStoreData.link.append(links as! String)
                    let sessions = convertedData[i]["number_of_lessons"]
                    ToStoreData.instanceOfToStoreData.number_of_lessons.append(sessions as! Int)
                    
                    // for image from json
                    
                    let image = convertedData[i]["imageUrl"]
                   ToStoreData.instanceOfToStoreData.imageurl.append(image as! String)
                }
                
                
//               let ids  = convertedData["id"] ?? "000"
//                let imagelink  = convertedData["imageUrl"] ?? "000"
//                let lessons = convertedData["number_of_lessons"] ?? "000"
//                let links = convertedData["link"] ?? "000"
                
//                ToStoreData.instanceOfToStoreData.name = names as? String
//                ToStoreData.instanceOfToStoreData.id = ids as? Int
//                ToStoreData.instanceOfToStoreData.imageurl = imagelink as? String
//                ToStoreData.instanceOfToStoreData.link = links as? String
//                ToStoreData.instanceOfToStoreData.number_of_lessons = lessons as? Int
//                print(names)
//                print(ids)
//                print(imagelink)
//                print(lessons)
//                print(links)
                DispatchQueue.main.async {
                    
                    self.tableDisplay.reloadData()
//                    self.nameLabel.text = ToStoreData.instanceOfToStoreData.name
//                    //self.idLabel.text = ToStoreData.instanceOfToStoreData.id
//                    self.classLabel.text = String( ToStoreData.instanceOfToStoreData.number_of_lessons)
//                    //self.link.text = ToStoreData.instanceOfToStoreData.link
//                    self.idLabel.text = String(ToStoreData.instanceOfToStoreData.id)
//                    do
//                    {
//                        try self.imagedisplay.image =  UIImage(data: NSData(contentsOf: NSURL(string: ToStoreData.instanceOfToStoreData.imageurl)! as URL) as Data)
//                    }
//                    catch
//                    {
//                        print("unable to load image")
//                    }
                    
                    print(ToStoreData.instanceOfToStoreData.number_of_lessons ?? "000")
                    
                }
                
                
            }
            catch
            {
                print("Something Went Wrong")
            }
        })
        //To run the function
        dataTask.resume()
        
        
        //        print(self.name
        
    }
    
    
    

}

