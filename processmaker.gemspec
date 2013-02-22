Gem::Specification.new do |s|
	s.name        = 'processmaker'
	s.version     = '0.0.3'
	s.date        = '2013-02-21'
	s.summary     = "Web services wrapper for ProcessMaker"
	s.description = "A Ruby library to connect to a ProcessMaker instance via web services."
	s.homepage    = 'http://yamilurbina.com'
	s.authors     = ["Yamil Urbina"]
	s.email       = 'hello@yamilurbina.com'
	s.files       = ["lib/processmaker.rb"]
	s.homepage    = 'http://rubygems.org/gems/processmaker'
	
	s.add_dependency 'savon'
	s.add_dependency 'awesome_print'
end