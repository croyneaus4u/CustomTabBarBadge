#
# Be sure to run `pod lib lint CustomTabBarBadge.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CustomTabBarBadge'
  s.version          = '0.1.0'
  s.summary          = 'This library provides a way to add custom Badge with Animation to TabBar.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    * This library adds an extension to UITabBarItem to add customised Badge to UITabBar
    * It provides Animation protocol for the developer to provide their own Animations
    * It provides a configuration protocol for the developer to provide their own configurations, such as font, backgroundColor etc.
                       DESC

  s.homepage         = 'https://github.com/croyneaus4u/CustomTabBarBadge'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'croyneaus4u' => 'croyneaus4u@gmail.com' }
  s.source           = { :git => 'https://github.com/croyneaus4u/CustomTabBarBadge.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CustomTabBarBadge/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CustomTabBarBadge' => ['CustomTabBarBadge/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
