Pod::Spec.new do |s|
s.name = 'QMJoyStick'
s.version = '1.0.0'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'UIView based joystick for iOS.'
s.homepage = 'https://github.com/mxdhqm/QMJoyStick'
s.authors = { 'mxdhqm' => 'mxdhqm@gmail.com' }
s.social_media_url = 'http://mxdhqm.com'
s.source = { :git => 'https://github.com/mxdhqm/QMJoyStick.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '2.0'
s.source_files = 'QMJoyStick/*.{h,m}'
s.resources = 'QMJoyStick/*.{png}'
end
