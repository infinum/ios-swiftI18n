#
# Be sure to run `pod lib lint SwiftI18n.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftI18n'
  s.version          = '1.0.1'
  s.summary          = 'I18n library for swift'
  s.homepage         = 'https://bitbucket.org/Vlaho/swifti18n'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vlaho Poluta' => 'vlaho.poluta@infinum.hr' }
  s.source           = { :git => 'https://Vlaho@bitbucket.org/Vlaho/swifti18n.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'
  s.default_subspec = 'I18n'

  s.description      = <<-DESC
                        If you are not using Apple's i18n and need to provide language picking in settings in your application, this is the place for you.
                       DESC

  s.subspec "I18n" do  |spec|
    source_files = ['SwiftI18n/Classes/Main/**/*', 'SwiftI18n/Classes/Views/{BaseViews,PlainViews}/**/*']
    spec.source_files = source_files
  end

  s.subspec "I18n+Case" do  |spec|
    source_files = ['SwiftI18n/Classes/{Main,Case}/**/*', 'SwiftI18n/Classes/Views/{BaseViews,CaseViews}/**/*']
    spec.source_files = source_files
  end

end
