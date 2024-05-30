//
//  utilFunc.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/30/24.
//

import Foundation

internal func isOnlyWhitespace(text: String) -> Bool {
      return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
