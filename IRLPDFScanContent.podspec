##
## Before you commit to the Podscpec repro, it is good practice to verify your settings via lint
## > pod spec lint IRLPDFScanContent.podspec --sources='https://github.com/CocoaPods/Specs'
##
## When done modifying that file simply run:
## > pod trunk push IRLPDFScanContent.podspec
##

Pod::Spec.new do |s|

s.name         = "IRLPDFScanContent"
s.version      = "1.0.1"
s.summary      = "SwiftUI & UKKit - Images or PDF scanner."
s.description  = "A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result"
s.license      = { :type => 'MIT', :file => 'LICENSE' }

s.homepage     = "https://github.com/charlymr/IRLPDFScanContent"
s.authors      = { 'Denis Martin' => 'support@irlmobile.com' }
s.source       = { :git => 'https://github.com/charlymr/IRLPDFScanContent.git', :branch => 'main', :tag => '1.0.1'}

s.platform     = :ios, '13.0'

s.module_name = 'IRLPDFScanContent'

s.source_files          = 'Sources/IRLPDFScanContent/*.{swift}', 'Sources/IRLPDFScanContent/Internal/*.{swift}',
s.swift_versions        = '5.5'

s.ios.frameworks = 'UIKit', 'PDFKit', 'VisionKit', 'SwiftUI'

end
