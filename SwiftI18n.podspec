#
# Be sure to run `pod lib lint SwiftI18n.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftI18n'
  s.version          = '1.3.0'
  s.summary          = 'I18n library for Swift'
  s.homepage         = 'https://github.com/infinum/ios-swiftI18n'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vlaho Poluta' => 'vlaho.poluta@infinum.hr' }
  s.source           = { :git => 'https://github.com/infinum/ios-swiftI18n.git', :tag => s.version.to_s }
  
  s.description      = <<-DESC
                        If you are not using Apple's i18n and need to provide language picking in settings in your application, this is the place for you.
                       DESC
  
  s.requires_arc = true
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  
  s.default_subspec = 'I18n'
  s.subspec "I18n" do  |spec|
    source_files = ['SwiftI18n/Classes/Main/**/*', 'SwiftI18n/Classes/Views/{BaseViews,PlainView,SwiftUI}/**/*']
    spec.source_files = source_files
  end

  s.subspec "I18n+Case" do  |spec|
    source_files = ['SwiftI18n/Classes/{Main,Case}/**/*', 'SwiftI18n/Classes/Views/{BaseViews,CaseViews,SwiftUI}/**/*']
    spec.source_files = source_files
  end

end
