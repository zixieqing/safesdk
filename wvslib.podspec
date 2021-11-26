#
# Be sure to run `pod lib lint wvlib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'wvslib'
  s.version          = '2020.08.19'
  s.summary          = 'A short description of wvlib.'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/pfzq303/wvslib'
  # s.screenshots     = 'www.example/Users/hqq/Documents/admin/code/wvslibSwift/wvlibSwift.podspec.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pfzq303' => 'pfzq303' }
  s.source           = { :git => 'https://github.com/pfzq303/wvslib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.source_files = 'wvs/*.h','wvslib/Classes/**/*'
  s.vendored_libraries = 'wvs/*.a'

  s.public_header_files = 'wvs/**/*.h'
  s.preserve_paths = 'script/xcodeproj.rb'
  s.requires_arc = false
  s.static_framework = true
#  s.prepare_command = "ruby script/xcodeproj.rb"
  #s.frameworks = 'MediaPlayer', 'GameController'
  s.prefix_header_file = 'prefix.pch'
  $c_script = <<-EOF
  day=$(date -v -2d +%Y.%m.%d)
  if [ "$day" \\> "#{s.version}" ]; then
    echo "please upgrade sdk. current version: #{s.version}"
    exit 1
  fi
  EOF
  s.script_phase = { :name => 'check_version', :script => $c_script, :execution_position => :before_compile }
  # s.dependency "GCDWebServer", "~> 3.0"
end