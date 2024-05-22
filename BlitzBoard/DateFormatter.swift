//  DateFormatter.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/20.
//

import Foundation

    // MARK: Extensions

extension DateFormatter {
    
    func customDateFormatter(date: String) -> DateComponents {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        let date = dateFormatter.date(from: date) ?? Date()
        return Calendar.current.dateComponents([.year, .month, .day], from: date)
    }
}
