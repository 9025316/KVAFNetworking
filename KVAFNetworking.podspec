#
# Be sure to run `pod lib lint KVAFNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KVAFNetworking'
  s.version          = '1.1.0'
  s.summary          = 'This is a based on network request.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
			This is a based on network request afnetworking 3.0 encapsulation.
                       DESC

  s.homepage         = 'https://github.com/9025316/KVAFNetworking'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '韩问' => '9025316@qq.com' }
  s.source           = { :git => 'https://github.com/9025316/KVAFNetworking.git', :tag => '1.0.1' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.requires_arc = true  
  
  s.source_files = "KVAFNetworking/*","KVAFNetworking/Cache/*","KVAFNetworking/RequestManager/*","KVAFNetworking/Vendor/*"

  s.frameworks = 'Foundation', 'UIKit'

  s.dependency 'AFNetworking', '~> 3.1.0'
  
  # s.resource_bundles = {
  #   'KVKit' => ['KVKit/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
