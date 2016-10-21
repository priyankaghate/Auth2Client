module ApplicationHelper
	def new_oauth_token_path(params)
		p "#{ENV['server_base_url']}/oauth/authorize?client_id=#{params['client_id']}&redirect_uri=#{ENV['oauth_redirect_uri']}&response_type=code"
	  "#{ENV['server_base_url']}/oauth/authorize?client_id=#{params['client_id']}&redirect_uri=#{ENV['oauth_redirect_uri']}&response_type=code"
	end
	
end
