# Processmaker
A Ruby library to connect to a ProcessMaker instance via web services.

## Installation
ProcessMaker is available on [RubyGems](https://rubygems.org/gems/processmaker):

```
gem install processmaker
```

## Usage

``` ruby
require 'processmaker'

# ProcessMaker instance
url = 'http://demo.processmaker.com:80/sysdemo/en/classic/services/wsdl2'

# Login first
Processmaker.login(wsdl: url, user_id: 'admin', password: 'sample')

# Now you can start getting data
# example: get all the users
users = Processmaker.user_list
users.each do |u|
	u[:name]
end
```
	
## Documentation
Coming really soon.


