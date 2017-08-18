lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'rubocop-schema'
  s.version     = '0.2.3'
  s.date        = '2017-08-18'
  s.summary     = "Code style checking for db schema file"
  s.description = "Code style checking for db schema file"
  s.authors     = ["ceclinux"]
  s.files = Dir[
    'lib/**/*.rb',
    'config/*'
  ]
  s.require_paths = ['lib']
  s.email       = 'src655@gmail.com'
  s.license     = 'MIT'
  s.homepage    =
    'http://rubygems.org/gems/rubocop-schema'
  s.add_runtime_dependency 'rubocop'
end
