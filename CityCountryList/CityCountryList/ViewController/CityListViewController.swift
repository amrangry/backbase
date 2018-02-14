//
//  CityListViewController.swift
//  CityCountryList
//
//  Created by Amr ELghadban on 2/14/18.
//  Copyright © 2018 Amr ELghadban. All rights reserved.
//

import UIKit


typealias JSONDictionary = [String: AnyObject]

class CityListViewController: BaseViewController {
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        readDataFromJsonFile()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


extension CityListViewController {
    // MARK: - Helper Methods
    
    func readDataFromJsonFile() -> [CityModel] {
        let filePath = Bundle.main.path(forResource: "cities", ofType: "json")
        let contentData = FileManager.default.contents(atPath: filePath!)
        let jsonArray = try! JSONSerialization.jsonObject(with: contentData!) as! [JSONDictionary]
        var cityList = [CityModel]()
        jsonArray.forEach{ cityList.append(CityModel(json: $0)!) }
        debugPrint(cityList.count) // 209557
        
        return cityList
    }
    
}
