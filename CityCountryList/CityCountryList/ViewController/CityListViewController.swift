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
    
    // MARK: - IBOutlet
    @IBOutlet weak var cityTableView: UITableView!
    
    // MARK: - Varibles
    let searchController = UISearchController(searchResultsController: nil)
     var dataSource:[CityModel]? = []
    fileprivate var filtered:[CityModel]? = []
    
    
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showActivityIndicator(view: self.view, withOpaqueOverlay: true)
        DispatchQueue.main.async {
            self.dataSource = self.readDataFromJsonFile(fileName: "cities")
            self.filtered = self.dataSource
            self.cityTableView.reloadData()
            self.hideActivityIndicator(view: self.view)
        }
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        cityTableView.tableHeaderView = searchController.searchBar
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let mapVC = segue.destination as! MapViewController
            mapVC.cityInfo = sender as? CityModel
        }
    }
}

extension CityListViewController {
    // MARK: - Helper Methods
    
    func readDataFromJsonFile( fileName:String!) -> [CityModel] {
        
        let filePath = Bundle.main.path(forResource: fileName, ofType: "json")
        let contentData = FileManager.default.contents(atPath: filePath!)
        let jsonArray = try! JSONSerialization.jsonObject(with: contentData!) as! [JSONDictionary]
        var cityList = [CityModel]()
        jsonArray.forEach{ cityList.append(CityModel(json: $0)!) }
        debugPrint(cityList.count) // 209557
        cityList = cityList.sorted { $0.name < $1.name }
    
        return cityList
    }
    
    func filterList(withSearchkey searchKey:String!) -> [CityModel]? {
        
                filtered = dataSource?.filter({ (City) -> Bool in
                    let tmp: NSString = City.name as NSString
                    let range = tmp.range(of: searchKey, options: NSString.CompareOptions.caseInsensitive
                    )
                    return range.location != NSNotFound
                })
        
        // Filter the results
        filtered = dataSource?.filter { $0.name.lowercased().contains(searchKey.lowercased()) }
        
        return filtered
        
    }
}

extension CityListViewController : UISearchResultsUpdating {
    
    // Called when the search bar's text or scope has changed or when the search bar becomes first responder.
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.trimmingCharacters(in: CharacterSet.whitespaces), searchText.isEmpty == false else{
            filtered = dataSource
            self.cityTableView.reloadData()
            return
        }
        
        filtered =  filterList(withSearchkey: searchText)
        self.cityTableView.reloadData()
        
    }
}

extension CityListViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
         let cityInfo = filtered?[indexPath.row]
          self.performSegue(withIdentifier: "showMap", sender: cityInfo)
    }
}

extension CityListViewController :UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  filtered?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath ) as! CityTableViewCell
        let cityInfo = filtered?[indexPath.row]
        cell.cityLabel.text = cityInfo?.name
        guard let country = cityInfo?.country  else {
            return cell
        }
        cell.countryLabel.text = ", " + country
        
        return cell
    }
}





