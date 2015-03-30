Pod::Spec.new do |s|
  s.name             = "Mimiq"
  s.version          = "0.1.0"
  s.summary          = "Swift fake data generator"
  s.homepage         = "https://github.com/markvaldy/Mimiq"
  s.license          = {
    :type => 'MIT',
    :file => 'LICENSE.md'
  }
  s.author           = {
    "Vadym Markov" => "impressionwave@gmail.com"
  }
  s.source           = {
    :git => "https://github.com/markvaldy/Mimiq.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/markvaldy'

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.requires_arc = true

  s.source_files = 'Source/**/*'

  s.frameworks = 'Foundation'
end
