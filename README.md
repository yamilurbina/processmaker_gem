[![Stories in Ready](https://badge.waffle.io/yamilurbina/processmaker_gem.png?label=ready&title=Ready)](https://waffle.io/yamilurbina/processmaker_gem)
# Processmaker
A Ruby library to connect to a ProcessMaker instance via web services.

## Installation
ProcessMaker is available on [RubyGems](https://rubygems.org/gems/processmaker):

```
gem install processmaker
```

## Usage
Use the login method to authenticate into a Processmaker instance. This will allow you to execute the rest of the methods.


``` ruby
require 'processmaker'

# ProcessMaker instance
url = 'http://demo.processmaker.com:80/sysdemo/en/classic/services/wsdl2'

# Login first
Processmaker.login(wsdl: url, user_id: 'admin', password: 'sample')

```

### Examples


``` ruby

# Get all users
users = Processmaker.user_list
users.each do |u|
	u[:name]
end

# Create a new user
Processmaker.create_user(
	user_id: 'heisenberg',
	first_name: 'Walter',
	last_name: 'White',
	email: 'heisenberg@lospolloshermanos.com',
	role: 'PROCESSMAKER_ADMIN',
	password: 'blue'
)

# Start a new case
Processmaker.new_case(
	 process_id: '2044050315115018adbb832067491026',
	 task_id: '1427825205129698c3315a7018321977'
)

# Sending emails
Processmaker.send_message(
	case_id: '1427825205129698c3315a7018321977',
	from: 'heisenberg@lospolloshermanos.com',
	to: 'jesse@lospolloshermanos.com',
	subject: 'Come to the lab',
	template: 'crystal.html'
)

# Route the case to the next task
Processmaker.route_case(
	case_id: '1427825205129698c3315a7018321977',
	del_index: '2044050315115018adbb832067491026'
)


```
	
## Documentation
Available at [rdoc.info/github/yamilurbina/processmaker_gem/Processmaker](http://rdoc.info/github/yamilurbina/processmaker_gem/Processmaker)


