require 'ap'
require 'savon'

class Processmaker

	attr_accessor :client, :session_id_token

	# login()
	# returns a hash with the status_code, message, version and timestamp
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#login.28.29_Web_Service
	def self.login(options = {})
		@client = Savon.client(wsdl: options[:wsdl])
		response = @client.call( :login, message: { userid: options[:user_id], password: options[:password] })	
		@session_id_token = response.body[:login_response][:message]
		return response.body[:login_response]
	end

	# userList()
	# returns a list of the users
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#userList.28.29
	def self.user_list(options = {})
		response = @client.call( :user_list, message: { 
			sessionId: options[:session_id] || @session_id_token
		})
		return response.body[:user_list_response][:users]
	end

	# departmentList()
	# returns a list of the departments
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#departmentList.28.29
	def self.department_list(options = {})
		response = @client.call( :department_list, message: {
			sessionId: options[:session_id] || @session_id_token
		})
		return response.body[:department_list_response][:departments]
	end

	# roleList()
	# returns a list of the roles
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#roleList.28.29
	def self.role_list(options = {})
		response = @client.call( :role_list, message: {
			sessionId: options[:session_id] || @session_id_token
		})
		return response.body[:role_list_response][:roles]
	end

	# createUser()
	# creates a new user
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#createUser.28.29
	def self.create_user(options = {})
		response = @client.call( :create_user, message: { 
			sessionId: options[:session_id] || @session_id_token,
			userId: options[:user_id],
			firstname: options[:first_name],
			lastname: options[:last_name],
			email: options[:email],
			role: options[:role] || 'PROCESSMAKER_OPERATOR',
			password: options[:password]
		})
		return response.body[:create_user_response]
	end

	# createGroup()
	# creates a new group
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#createGroup.28.29
	def self.create_group(options = {})
		response = @client.call( :create_group, message: {
			sessionId: options[:session_id] || @session_id_token, 
			name: options[:name]
		})
		return response.body[:create_group_response]
	end

	# createDepartment()
	# creates a new department
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#createDepartment.28.29
	def self.create_department(options = {})
		response = @client.call( :create_department, message: { 
			sessionId: options[:session_id] || @session_id_token, 
			name: options[:name],
			parentUID: options[:parent_uid] || ''
		})
		return response.body[:create_department_response]
	end

	# assignUserToGroup()
	# assigns a user to a group
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#assignUserToGroup.28.29
	def self.assign_user_to_group(options = {})
		response = @client.call( :assign_user_to_group, message: { 
			sessionId: options[:session_id] || @session_id_token,
			userId: options[:user_id],
			groupId: options[:group_id]
		})
		return response.body[:pm_response]
	end

	# assignUserToDepartment()
	# assigns a user to a department
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#assignUserToDepartment.28.29
	def self.assign_user_to_department(options = {})
		response = @client.call( :assign_user_to_department, message: { 
			sessionId: options[:session_id] || @session_id_token,
			userId: options[:user_id],
			departmentId: options[:department_id],
			manager: options[:manager_id],
		})
		return response.body[:pm_response]
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
		return response.body[:pm_response]
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
		return response.body[:pm_response]
	end

	# processList()
	# returns a list of the processes in the current workspace
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#processList.28.29
	def self.process_list(options = {})
		response = @client.call( :process_list, message: {
			sessionId: options[:session_id] || @session_id_token
		})
		return response.body[:process_list_response][:processes]
	end

	# taskList()
	# returns a list of the tasks to which the logged-in user is assigned
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#taskList.28.29
	def self.task_list(options = {})
		response = @client.call( :task_list, message: {
			sessionId: options[:session_id] || @session_id_token,
		})
		return response.body[:task_list_response][:tasks]
	end

	# taskCase()
	# returns the current task for a given case
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#taskCase.28.29
	def self.task_case(options = {})
		response = @client.call( :task_case, message: {
			sessionId: options[:session_id] || @session_id_token,
			caseId: options[:case_id]
		})
		return response.body[:task_case_response][:task_cases]
	end

	# caseList()
	# returns a list of the cases for the logged-in user
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#caseList.28.29
	def self.case_list(options = {})
		response = @client.call( :case_list, message: {
			sessionId: options[:session_id] || @session_id_token,
		})
		return response.body[:case_list_response][:cases]
	end

	# unassignedCaseList()
	# returns a list of the unassigned cases which the logged-in user has rights to be assigned to
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#unassignedCaseList.28.29
	def self.unassigned_case_list(options = {})
		response = @client.call( :unassigned_case_list, message: {
			sessionId: options[:session_id] || @session_id_token,
		})
		return response.body[:unassigned_case_list_response][:cases]
	end

	# getCaseInfo()
	# returns information about a given case
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#getCaseInfo.28.29
	def self.get_case_info(options = {})
		response = @client.call( :get_case_info, message: {
			sessionId: options[:session_id] || @session_id_token,
			caseId: options[:case_id],
			delIndex: options[:del_index] || "1"
		})
		return response.body[:get_case_info_response]
	end

	# newCase()
	# begins a new case under the name of the logged-in user
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#newCase.28.29
	def self.new_case(options = {})
		response = @client.call( :new_case, message: {
			sessionId: options[:session_id] || @session_id_token,
			processId: options[:process_id],
			taskId: options[:task_id],
			# TODO: Send variables when starting a case
			variables: options[:variables]
		})
		return response.body[:new_case_response]
	end

	# newCaseImpersonate()
	# creates a new case impersonating a user who has the proper privileges to create new cases
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#newCaseImpersonate.28.29
	def self.new_case_impersonate(options = {})
		response = @client.call( :new_case_impersonate, message: {
			sessionId: options[:session_id] || @session_id_token,
			processId: options[:process_id],
			taskId: options[:task_id],
			# TODO: Send variables when starting a case
			variables: options[:variables]
		})
		return response.body[:pm_response]
	end

	# reassignCase()
	# reassigns a case to a different user
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#newCaseImpersonate.28.29
	def self.reassign_case(options = {})
		response = @client.call( :reassign_case, message: {
			sessionId: options[:session_id] || @session_id_token,
			caseId: options[:case_id],
			delIndex: options[:del_index],
			userIdSource: options[:user_id_source],
			userIdTarget: options[:user_id_target]
		})
		return response.body[:pm_response]
	end

	# routeCase()
	# routes a case
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#routeCase.28.29
	def self.route_case(options = {})
		response = @client.call( :route_case, message: {
			sessionId: options[:session_id] || @session_id_token,
			caseId: options[:case_id],
			delIndex: options[:del_index]
		})
		return response.body[:route_case_response]
	end


=begin
	This method is not working due to a bug in Processmaker
	# getVariables()
	# returns variables from a given case
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#getVariables.28.29
	def self.get_variables(options = {})
		response = @client.call( :get_variables, message: {
			sessionId: options[:session_id] || @session_id_token,
			caseId: options[:case_id],
			variables: 'variables'
		})
		ap response.body
		#return response.body[:route_case_response]
	end

	# sendVariables()
	# sends variables to a case
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#sendVariables.28.29
	def self.send_variables(options = {})
		response = @client.call( :send_variables, message: {
			sessionId: options[:session_id] || @session_id_token,
			caseId: options[:case_id],
			variables: 'variables'
		})
		ap response.body
		#return response.body[:route_case_response]
	end
=end

	# triggerList()
	# triggerList() returns a list of all the available triggers in a workspace
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#triggerList.28.29
	def self.trigger_list(options = {})
		response = @client.call(:trigger_list, message: {
			sessionId: options[:session_id] || @session_id_token
		})
		return response.body[:trigger_list_response][:triggers]
	end

	# executeTrigger()
	# executes a ProcessMaker trigger
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#executeTrigger.28.29
	def self.execute_trigger(options = {})
		response = @client.call(:execute_trigger, message: {
			sessionId: options[:session_id] || @session_id_token,
			caseId: options[:case_id],
			triggerIndex: options[:trigger_index],
			delIndex: options[:del_index]
		})
		return response.body[:pm_response]
	end

	# sendMessage()
	# sends an email with the provided data
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#sendMessage.28.29
	def self.send_message(options = {})
		response = @client.call(:send_message, message: {
			sessionId: options[:session_id] || @session_id_token,
			caseId: options[:case_id],
			from: options[:from],
			to: options[:to],
			cc: options[:cc] || "", 
			bcc: options[:bcc] || "",
			subject: options[:subject],
			template: options[:template]
		})
		return response.body[:pm_response]
	end

	# systemInformation()
	# returns information about the WAMP/LAMP stack, the workspace database, the IP number
	# and version of ProcessMaker, and the IP number and version of web browser of the user
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#systemInformation.28.29
	def self.system_information(options = {})
		response = @client.call(:system_information, message: {
			sessionId: options[:session_id] || @session_id_token
		})
		return response.body[:system_information_response]
	end

	# inputDocumentList()
	# returns a list of the uploaded documents for a given case
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#systemInformation.28.29
	def self.input_document_list(options = {})
		response = @client.call(:input_document_list, message: {
			sessionId: options[:session_id] || @session_id_token,
			caseId: options[:case_id]
		})
		return response.body[:input_document_list_response][:documents]
	end

	# inputDocumentProcessList()
	# returns a list of the Input Document definitions for a given process
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#inputDocumentProcessList.28.29
	def self.input_document_process_list(options = {})
		response = @client.call(:input_document_process_list, message: {
			sessionId: options[:session_id] || @session_id_token,
			processId: options[:process_id]
		})
		return response.body[:input_document_process_list_response][:documents]
	end

	# outputDocumentList()
	# returns a list of the output documents for a given case
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#outputDocumentList.28.29
	def self.output_document_list(options = {})
		response = @client.call(:output_document_list, message: {
			sessionId: options[:session_id] || @session_id_token,
			caseId: options[:case_id]
		})
		return response.body[:output_document_list_response][:documents]
	end

	# removeDocument()
	# removes an uploaded or generated document from a case
	# http://wiki.processmaker.com/index.php/2.0/ProcessMaker_WSDL_Web_Services#removeDocument.28.29
	def self.remove_document(options = {})
		response = @client.call(:remove_document, message: {
			sessionId: options[:session_id] || @session_id_token,
			appDocUid: options[:app_doc_uid]
		})
		return response.body[:pm_response]
	end
	
end