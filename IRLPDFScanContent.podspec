##
## Before you commit to the Podscpec repro, it is good practice to verify your settings via lint
## > pod spec lint IRLPDFScanContent.podspec --sources='https://github.com/CocoaPods/Specs'
##
## When done modifying that file simply run:
## > pod trunk push IRLPDFScanContent.podspec
##
Pod::Spec.new do |s|
  s.name = 'IRLPDFScanContent'
  s.version = '1.1.0'
  
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  
  s.summary = 'SwiftUI & UKKit - Images or PDF scanner. Big brother and replacement of IRLDocumentScanner'
  s.description  = 'A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result'
  s.homepage = 'https://github.com/charlymr/IRLPDFScanContent'
  s.documentation_url = 'https://irlpdfscancontent.irlmobile.com/documentation/'

  s.authors = { 'charlymr', 'Denis Martin' => 'support@irlmobile.com' }
  
  s.source = { :git => 'https://github.com/charlymr/IRLPDFScanContent.git', :tag => s.version }

  s.module_name = 'IRLPDFScanContent'
  s.ios.deployment_target = '13.0'
  s.swift_versions = ['5.5']
  s.source_files = 'Sources/IRLPDFScanContent/*.{swift}', 'Sources/IRLPDFScanContent/Internal/*.{swift}', 'Sources/IRLPDFScanContent/Legacy/*.{swift}',
  s.ios.frameworks = 'UIKit', 'PDFKit', 'VisionKit', 'SwiftUI'

end
