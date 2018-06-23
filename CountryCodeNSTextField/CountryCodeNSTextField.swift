//
//  CountryCodeTextField.swift
//  CountryCodeTextField
//
//  Created by Jiawei Li on 2018/6/23.
//  Copyright © 2018 Jiawei Li. All rights reserved.
//

import Foundation
import Cocoa

open class CountryCodeNSTextField: NSTextField {
    
    @IBInspectable open var countryCode: String = "+86"
    open var countryCodes: [String: Array<String>] = [:]
    
    override open func textDidChange(_ notification: Notification) {
        super.textDidChange(notification)
        let values = self.stringValue.split(separator: "+")
        let code = values.count > 1 ? String(values[1]) : ""
        countryCode = "+" + code
        self.stringValue = getFlagFromCountryCode() + " " + countryCode
    }
    
    override open func viewWillDraw() {
        super.viewWillDraw()
        self.stringValue = getFlagFromCountryCode() + " " + countryCode
    }
    
    override open func awakeFromNib() {
        if countryCodes == [:] {
            do {
                if let file = Bundle.main.url(forResource: "CountryCallingCodes", withExtension: "json") {
                    let data = try Data(contentsOf: file)
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let object = json as? [String: Array<String>] {
                        countryCodes = object
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        self.alignment = NSTextAlignment.center
    }
    
    func getFlagFromCountryCode() -> String {
        if let item = countryCodes[countryCode] {
            var imageString = ""
            for flag in item {
                imageString += flag + " "
            }
            return imageString
        }
        return ""
    }
}
