Gem::Specification.new do |s|
  s.name        = 'service_caller'
  s.version     = '0.1.5'
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Ruby Service Basic Class'
  s.description = 'basic implement of service object'
  s.authors     = ['JiaRou Lee']
  s.email       = 'laura34963@kdanmobile.com'
  s.homepage    = 'https://github.com/kdan-mobile-software-ltd/service_caller'
  s.license     = 'MIT'

  s.files            = `git ls-files -- lib/*`.split("\n")
  s.extra_rdoc_files = [ 'README.md' ]
  s.rdoc_options     = ['--charset=UTF-8']
  s.require_path     = "lib"

  s.required_ruby_version = '>= 2.5.1'
end