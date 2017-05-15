//
//  DateTransform.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/15/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import ObjectMapper

class DateTransform: TransformType {
    typealias Object = Date
    typealias JSON = String
    
    let dateFormat: String
    
    func transformFromJSON(_ value: Any?) -> Date? {
        if let dateString = value as? String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            return dateFormatter.date(from: dateString)
        }
        return nil
    }
    func transformToJSON(_ value: Date?) -> String? {
        guard let date = value else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
    
    init(format: String) {
        dateFormat = format
    }
}