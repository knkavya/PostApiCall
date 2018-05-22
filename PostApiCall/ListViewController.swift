//
//  ListViewController.swift
//  PostApiCall
//
//  Created by Kavya on 22/05/18.
//  Copyright © 2018 Kavya. All rights reserved.
//

import UIKit
import Alamofire

enum ListTextFieldPosition: Int {
    case Name = 0
    case Age
    case Height
    case Weight
    case City
    case Country
}

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
//    func textFieldShouldEndEditing(_ textField: UITextField) {
//
//    }
    
    @IBOutlet weak var listTableView: UITableView!
    
    var name : String?
    var age : String?
    var height : String?
    var weight : String?
    var city : String?
    var country : String?
    
    var titleArray = ["Name","Age","Height","Weight","City","Country"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerCell() {
        self.listTableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        
        cell = loadCell(tableView: tableView, forindexPath: indexPath as NSIndexPath)
        
        return cell!
    }
    
    func loadCell(tableView : UITableView ,forindexPath indexPath: NSIndexPath) -> TextFieldCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier:"TextFieldCell", for: indexPath as IndexPath) as! TextFieldCell
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.dataTextField.tag = indexPath.row
//        cell.delegate = self
        
        switch (indexPath.row) {
        case ListTextFieldPosition.Name.rawValue:
            cell.textFieldCallBack =  {(sender: UITextField) -> Void in
                print("Cell : Name CallBack Called")
                self.name = sender.text
            }
            break
            
        case ListTextFieldPosition.Age.rawValue:
            cell.textFieldCallBack =  {(sender: UITextField) -> Void in
                print("Cell : Age CallBack Called")
                self.age = sender.text
            }
            break
        case ListTextFieldPosition.Height.rawValue:
            cell.textFieldCallBack =  {(sender: UITextField) -> Void in
                print("Cell : Height CallBack Called")
                self.height = sender.text
            }
            break
        case ListTextFieldPosition.Weight.rawValue:
            cell.textFieldCallBack =  {(sender: UITextField) -> Void in
                print("Cell : Weight CallBack Called")
                self.weight = sender.text
            }
            break
        case ListTextFieldPosition.City.rawValue:
            cell.textFieldCallBack =  {(sender: UITextField) -> Void in
                print("Cell : City CallBack Called")
                self.city = sender.text
            }
            break
        case ListTextFieldPosition.Country.rawValue:
            cell.textFieldCallBack =  {(sender: UITextField) -> Void in
                print("Cell : Country CallBack Called")
                self.country = sender.text
            }
            break
            
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func hideKeypad(){
        let t1 = self.view.viewWithTag(ListTextFieldPosition.Name.rawValue);
        t1?.resignFirstResponder()
        let t2 = self.view.viewWithTag(ListTextFieldPosition.Age.rawValue);
        t2?.resignFirstResponder()
        let t3 = self.view.viewWithTag(ListTextFieldPosition.Height.rawValue);
        t3?.resignFirstResponder()
        let t4 = self.view.viewWithTag(ListTextFieldPosition.Weight.rawValue);
        t4?.resignFirstResponder()
        let t5 = self.view.viewWithTag(ListTextFieldPosition.City.rawValue);
        t5?.resignFirstResponder()
        let t6 = self.view.viewWithTag(ListTextFieldPosition.Country.rawValue);
        t6?.resignFirstResponder()
  }

    @IBAction func doneButtonClicked(_ sender: Any) {
        self.hideKeypad()
        self.makePostApiCall()
    }
    
    func makePostApiCall() {
        let parameters: [String: Any] = [
            "name" : self.name ?? -1,
            "age" : self.age ?? -1,
            "height" : self.height ?? -1,
            "weight" : self.weight ?? -1,
            "city" : self.city ?? -1,
            "country" : self.country ?? -1
        ]
        
        Alamofire.request("http://www.mocky.io/", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    print(response.result.value ?? -1)
                }
                break
                
            case .failure(_):
                print(response.result.error ?? -1)
                break
                
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
