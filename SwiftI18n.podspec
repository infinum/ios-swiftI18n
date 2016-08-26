#
# Be sure to run `pod lib lint SwiftI18n.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftI18n'
  s.version          = '0.0.2'
  s.summary          = 'TODO: A short description of SwiftI18n.'
  s.homepage         = 'https://bitbucket.org/Vlaho/swifti18n'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vlaho Poluta' => 'vlaho.poluta@infinum.hr' }
  s.source           = { :git => 'git@bitbucket.org:Vlaho/swifti18n.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '9.0'

  s.description      = <<-DESC
                        TODO: Add long description of the pod here.
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
