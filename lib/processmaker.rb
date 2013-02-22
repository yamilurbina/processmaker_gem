require 'ap'
require 'savon'

class Processmaker

	attr_accessor :client

	# login()
	# returns a hash with the status_code, message, version and timestamp
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#login.28.29_Web_Service
	def self.login(options = {})
		@client = Savon.client(wsdl: options[:wsdl])
		response = @client.call( :login, message: { userid: options[:user_id], password: options[:password] })
		# check response status
		response.body[:login_response]
	end

	# userList()
	# returns a list of the users
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#userList.28.29
	def self.user_list(options = {})
		response = @client.call( :user_list, message: { sessionId: options[:session_id]} )
		response.body[:user_list_response][:users]
	end

	# departmentList()
	# returns a list of the departments
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#departmentList.28.29
	def self.department_list(options = {})
		response = @client.call( :department_list, message: { sessionId: options[:session_id]} )
		response.body[:department_list_response][:departments]
	end

	# roleList()
	# returns a list of the roles
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#roleList.28.29
	def self.role_list(options = {})
		response = @client.call( :role_list, message: { sessionId: options[:session_id]} )
		response.body[:role_list_response][:roles]
	end

	# createUser()
	# creates a new user
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#createUser.28.29
	def self.create_user(options = {})
		response = @client.call( :create_user, message: { 
			sessionId: options[:session_id],
			userId: options[:user_id],
			firstname: options[:first_name],
			lastname: options[:last_name],
			email: options[:email],
			role: options[:role] || 'PROCESSMAKER_OPERATOR',
			password: options[:password]
		})
		response.body[:create_user_response]
	end

	# createGroup()
	# creates a new group
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#createGroup.28.29
	def self.create_group(options = {})
		response = @client.call( :create_group, message: { sessionId: options[:session_id], name: options[:name]} )
		response.body[:create_group_response]
	end

	# createDepartment()
	# creates a new department
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#createDepartment.28.29
	def self.create_department(options = {})
		response = @client.call( :create_department, message: { 
			sessionId: options[:session_id], 
			name: options[:name],
			parentUID: options[:parent_uid] || ''
		})
		response.body[:create_department_response]
	end

	# assignUserToGroup()
	# assigns a user to a group
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#assignUserToGroup.28.29
	def self.assign_user_to_group(options = {})
		response = @client.call( :assign_user_to_group, message: { 
			sessionId: options[:session_id],
			userId: options[:user_id],
			groupId: options[:group_id]
		})
		response.body[:pm_response]
	end

	# assignUserToDepartment()
	# assigns a user to a department
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#assignUserToDepartment.28.29
	def self.assign_user_to_department(options = {})
		response = @client.call( :assign_user_to_department, message: { 
			sessionId: options[:session_id],
			userId: options[:user_id],
			departmentId: options[:department_id],
			manager: options[:manager_id],
		})
		response.body[:pm_response]
	end

	# PauseCase()
	# pauses an specified case
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#PauseCase.28.29
	def self.pause_case(options = {})
		response = @client.call( :pause_case, message: { 
			caseUid: options[:case_uid],
			delIndex: options[:del_index],
			userUid: options[:user_uid],
			unpauseDate: options[:unpause_date],
		})
		response.body[:pm_response]
	end

	# UnpauseCase()
	# pauses a specified case
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#UnpauseCase.28.29
	def self.unpause_case(options = {})
		response = @client.call( :unpause_case, message: { 
			caseUid: options[:case_uid],
			delIndex: options[:del_index],
			userUid: options[:user_uid],
			unpauseDate: options[:unpause_date],
		})
		response.body[:pm_response]
	end

end