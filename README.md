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
wsdl = 'http://demo.processmaker.com:80/sysdemo/en/classic/services/wsdl2'
username = 'admin'
password = 'sample'

# Login
login = Processmaker.login(wsdl: wsdl, user_id: username, password: password)
# Get session_id
session_id = login[:message]

# example: get all the users
users = Processmaker.user_list(session_id: session_id)
users.each do |u|
	u[:name]
end
```
	
## Documentation
Coming really soon.


