//
//  utilFunc.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/30/24.
//

import UIKit

internal func isOnlyWhitespace(text: String) -> Bool {
      return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }

internal func changeSpecificTextColor (searchText : String?, uiLabel : UILabel) {
    guard let searchText else {return }
    
    if let labelText = uiLabel.text {
        let text = NSMutableAttributedString(string: labelText)
        var searchRange = labelText.startIndex..<labelText.endIndex
        while let range = labelText.range(of: searchText, options: NSString.CompareOptions.caseInsensitive, range: searchRange) {
            text.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(range, in: labelText))
            searchRange = range.upperBound..<searchRange.upperBound
        }
        
        uiLabel.attributedText = text
    }
    
}
