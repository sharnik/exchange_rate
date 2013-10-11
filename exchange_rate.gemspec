Gem::Specification.new do |s|
  s.name        = 'exchange_rate'
  s.version     = '0.0.1'
  s.date        = '2013-10-10'
  s.summary     = "Simple currency exchange rate provider."
  s.description = "Simple currency exchange rate provider."
  s.authors     = ["Wojciech Ogrodowczyk"]
  s.email       = 'wojtek@7tonlnu.pl'
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(Rakefile Gemfile)
  s.homepage    =
    'http://github.com/sharnik/exchange_rate'
  s.license       = 'MIT'

  s.add_runtime_dependency 'nokogiri'

  s.add_development_dependency 'minitest', '~> 5.0.8'
  s.add_development_dependency 'rake'

end
