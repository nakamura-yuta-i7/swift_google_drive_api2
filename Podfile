# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'google_drive_upload' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for google_drive_upload
  pod 'GoogleAPIClient/Drive'
  pod 'GTMOAuth2'
  pod 'Realm', :git => 'https://github.com/realm/realm-cocoa.git', :submodules => true
  pod 'RealmSwift', :git => 'https://github.com/realm/realm-cocoa.git', :submodules => true

  target 'google_drive_uploadTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'google_drive_uploadUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = "3.0"
        end
    end
end
