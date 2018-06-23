Pod::Spec.new do |s|
  s.name         = "CountryCodeNSTextField"
  s.version      = "0.0.1"
  s.summary      = "CountryCodeNSTextField subclasses NSTextfield for International Phone Calling Code Input With Flags"
  s.homepage     = "https://github.com/rallets-network/CountryCodeNSTextField"
  s.license      = { :type => "MIT", :file => "LICENSE"   }
  s.author             = { "Rallet" => "info@rallets.com"   }
  s.source       = { :git => "https://github.com/rallets-network/CountryCodeNSTextField.git", :tag => "#{s.version}"   }
  s.source_files  = "CountryCodeNSTextField/CountryCodeNSTextField.{swift}"
  s.resource     = "CountryCodeNSTextField/CountryCallingCodes.{json}"
  s.requires_arc = true
  s.platform     = :osx, '10.9'
  s.swift_version= '4.1'
end
