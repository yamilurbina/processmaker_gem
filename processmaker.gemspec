Gem::Specification.new do |s|
	s.name        = 'processmaker'
	s.version     = '0.1.1'
	s.date        = '2013-02-23'
	s.summary     = "Web services wrapper for ProcessMaker"
	s.description = "A Ruby library to connect to a ProcessMaker instance via web services."
	s.homepage    = 'http://yamilurbina.com'
	s.author      = "Yamil Urbina"
	s.email       = 'hello@yamilurbina.com'
	s.files       = ["lib/processmaker.rb"]
	s.homepage    = 'https://github.com/yamilurbina/processmaker_gem'
	s.license	  = 'MIT'
	s.post_install_message = "Thanks for installing the Processmaker gem. For usage examples, check the wiki https://github.com/yamilurbina/processmaker_gem/wiki"
	
	s.add_dependency 'savon', '~> 2.1.0'
	s.add_dependency 'awesome_print', '~> 1.1.0'
end