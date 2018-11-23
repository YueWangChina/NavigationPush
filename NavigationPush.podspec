#
# Be sure to run `pod lib lint NavigationPush.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NavigationPush'
  s.version          = '1.0.0'
  s.summary          = 'UIViewController+NavigationPush用于解耦跳转'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 用于解耦跳转.采用runtime方式进行跳转映射传值
                       DESC

  s.homepage         = 'https://github.com/YueWangChina/NavigationPush'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '454431208@qq.com' => 'wangyuexdy@163.com' }
  s.source           = { :git => 'https://github.com/YueWangChina/NavigationPush.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'NavigationPush/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NavigationPush' => ['NavigationPush/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
