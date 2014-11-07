platform :ios, '6.0'

# Main Dependencies

target :mbraceapp,:exclusive => true do

pod 'CocoaLumberjack'
pod 'SVProgressHUD'
pod 'uidevice-extension'
pod 'MagicalRecord/Shorthand'
pod 'TTTAttributedLabel'

end

# Test Dependencies

target :mbraceappTests do

pod 'OCMockito'
pod 'OCHamcrest'

end

post_install do |installer|
  installer.project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = 'YES'
    end
  end
end

