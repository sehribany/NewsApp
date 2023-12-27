//
//  String+Extensions.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 26.12.2023.
//

extension String{
    public func dateFormatter() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let userSelectedLanguage = UserDefaults.standard.string(forKey: "AppSelectedLanguage") ?? "en"
        
        if userSelectedLanguage == "en" {
            dateFormatter.locale = Locale(identifier: "en_US")
        } else if userSelectedLanguage == "tr" {
            dateFormatter.locale = Locale(identifier: "tr_TR")
        }
        
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "dd MMM, yyyy"
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        }
        return nil
    }
    
    public func authorControl() -> String {
        guard !self.isEmpty else {
            return "Anonymous"
        }
        return self
    }
    
    public func removeExtraText() -> String {
        var modifiedString = self
        
        if let range = modifiedString.range(of: "\\[\\+\\d+ chars\\]", options: .regularExpression) {
            modifiedString.removeSubrange(range)
        }
        return modifiedString
    }
}
