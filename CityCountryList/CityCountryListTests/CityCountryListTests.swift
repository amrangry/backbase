//
//  CityCountryListTests.swift
//  CityCountryListTests
//
//  Created by Amr ELghadban on 2/13/18.
//  Copyright © 2018 Amr ELghadban. All rights reserved.
//

import XCTest
@testable import CityCountryList

class CityCountryListTests: XCTestCase {
    
    var cityListControllerUnderTest: CityListViewController!
    
    override func setUp() {
        super.setUp()
        
        cityListControllerUnderTest =  CityListViewController()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cityListControllerUnderTest = nil
        super.tearDown()
    }
    
    
    func testReadingDataFromFile()  {
        
        // 1. given
         let fileName = "cities"
        
        // 2. when
        let array = cityListControllerUnderTest.readDataFromJsonFile(fileName: fileName)
        
        // 3. then
        XCTAssertEqual(array.count, 209557, "count is wrong reading file")
    }
    
    
    func testSearchResultForSydney()  {
        
        // 1. given
        let fileName = "sameleTestFile"
        
        // 2. when
        let array = cityListControllerUnderTest.readDataFromJsonFile(fileName: fileName)
        
        cityListControllerUnderTest.dataSource = array
        
        let filteredArray = cityListControllerUnderTest.filterList(withSearchkey: "s")
        
        // 3. then
        XCTAssertEqual(filteredArray?.count,1, "filter is working wrong result must be 1")
    }
    
    
    func testSearchResultForWrongInputs()  {
        // 1. given
        let fileName = "sameleTestFile"
        
        // 2. when
        let array = cityListControllerUnderTest.readDataFromJsonFile(fileName: fileName)
        
        cityListControllerUnderTest.dataSource = array
        
        let filteredArray = cityListControllerUnderTest.filterList(withSearchkey: "test Wrong")
        
        // 3. then
        XCTAssertEqual(filteredArray?.count,0, "filter is working wrong result must be 0")
    }
    
    
    func testSearchResultForACities()  {
        
        // 1. given
        let fileName = "sameleTestFile"
        
        // 2. when
        let array = cityListControllerUnderTest.readDataFromJsonFile(fileName: fileName)
        
        cityListControllerUnderTest.dataSource = array
        
        let filteredArray = cityListControllerUnderTest.filterList(withSearchkey: "a")
        
        // 3. then
        XCTAssertEqual(filteredArray?.count,4, "filter is working wrong result must be 4")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
