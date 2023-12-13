# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

# Comment the next line if you don't want to use dynamic frameworks

use_frameworks!

workspace 'NewsApp'

target 'NewsApp' do

 project 'NewsApp.xcodeproj'

  # Pods for NewsApp
  # Network
  pod 'Alamofire'
  # Helper
  pod 'SKPhotoBrowser'
  pod 'MobilliumUserDefaults'
  pod 'KeychainSwift'
  pod 'Kingfisher'
  pod 'TinyConstraints'
  pod 'SwiftEntryKit'
  pod 'Segmentio'
  
end

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  # Pods for DataProvider
  # Network
  pod 'Alamofire'
 
end

target 'UIComponents' do

  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for UIComponents
  
  # Helper
  pod 'SwiftGen'
  pod 'Kingfisher'
  pod 'TinyConstraints'
  pod 'Segmentio'
  pod 'SwiftEntryKit'
    
end

target 'Utilities' do
  
  project 'Utilities/Utilities.xcodeproj'
  
  # Pods for Utilities
  
  # Helper
  pod 'MobilliumUserDefaults'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end
