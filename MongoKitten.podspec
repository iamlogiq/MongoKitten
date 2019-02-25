#
# Be sure to run `pod lib lint Rockstar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.ios.deployment_target = '12.0'
  s.name             = 'MongoKitten'
  s.version          = '5.1.1'
  s.summary          = 'A pure swift, native MongoDB driver'

  s.description      = <<-DESC
High and low level APIs for interacting with MongoDB databases. Supports codable, transactions and all async.
                       DESC

  s.swift_version = '4.2'
  s.homepage         = 'https://github.com/OpenKitten/MongoKitten'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'joannis' => 'joannis@orlandos.nl' }
  s.source           = { :git => 'https://github.com/OpenKitten/MongoKitten.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/joannisorlandos'

  s.dependency 'BSON', '>= 6.0.2'

  s.subspec '_MongoKittenCrypto' do |sub|
    sub.source_files = 'Sources/_MongoKittenCrypto/*'
  end
  
  s.subspec 'GridFS' do |sub|
    sub.source_files = 'Sources/GridFS/**/*'
    sub.dependency     'SwiftNIOTransportServices', '~> 0.5'
    sub.dependency     'SwiftNIO', '~> 1.13.0'
    sub.dependency     'MongoKitten/Core'
  end
  
  s.subspec 'Core' do |sub|
    sub.source_files = 'Sources/MongoKitten/**/*'
    sub.dependency     'MongoKitten/_MongoKittenCrypto'
    sub.dependency     'mongo_embedded', '~> 4.0.4'
  end
end