//
//  Datafile.swift
//  multipleJson
//
//  Created by harishreddy kora on 12/03/20.
//  Copyright © 2020 harishreddy kora. All rights reserved.
//

import Foundation
class ToStoreData: NSObject {
    
    var name = [String]()
    var id = [Int]()
    
    var imageurl = [String]()
    var number_of_lessons = [Int]()
    var link = [String]()
    
    static var instanceOfToStoreData = ToStoreData()
}
