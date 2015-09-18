Pod::Spec.new do |s|
  s.name             = "Faker"
  s.version          = "1.0.0"
  s.summary          = "Swift fake data generator"
  s.homepage         = "https://github.com/vadymmarkov/Faker"
  s.license          = {
    :type => 'MIT',
    :file => 'LICENSE.md'
  }
  s.author           = {
    "Vadym Markov" => "impressionwave@gmail.com"
  }
  s.source           = {
    :git => "https://github.com/markvaldy/Faker.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/vadymmarkov'

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.requires_arc = true

  s.resource_bundles = {
    'Faker' => ['Resources/Locales/*.{json}']
  }
  s.source_files = 'Source/**/*'
  s.dependency 'SwiftyJSON', '~> 2.3.0'
  s.frameworks = 'Foundation'
end
