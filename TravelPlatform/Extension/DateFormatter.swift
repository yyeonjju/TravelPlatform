//
//  DateFormatter.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/26/24.
//

import Foundation

extension DateFormatter {
    static var YearMonthDayInKorean : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일"
        return formatter
    }
    
    static var YearMonthDayOnlyNumberString : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
//        formatter.locale
        return formatter
    }
    
    static var yearMonthDaySeparatedByHyphen : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    static var yearMonthDaySeparatedBySlash : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd"
        return formatter
    }
    
    
    
}
