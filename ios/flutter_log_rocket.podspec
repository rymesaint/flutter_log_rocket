#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_log_rocket.podspec` to validate before publishing.
#
require "yaml"
require "ostruct"
project = OpenStruct.new YAML.load_file("../pubspec.yaml")

Pod::Spec.new do |s|
  s.name             = project.name
  s.version          = project.version
  s.summary          = 'A new Flutter plugin project.'
  s.description      = project.description
  s.homepage         = 'https://logrocket.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Ridwan Fauzan' => 'rymetutor@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.ios.dependency 'LogRocket', '1.4.6'
  s.platform = :ios, '12.0'
  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
