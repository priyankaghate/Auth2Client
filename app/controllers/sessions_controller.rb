class SessionsController < ApplicationController
  def create
  	p "#{params.inspect}"
  	p "................................................"
  	p"#{params['client_id']}"
  	p"#{params['client_secret']}"
  	p "#{params[:code]}"
  	p "................................................"
    req_params = "client_id=#{params['client_id']}&client_secret=#{params['client_secret']}&code=#{params[:code]}&grant_type=authorization_code&redirect_uri=#{ENV['oauth_redirect_uri']}"
    response = JSON.parse RestClient.post("http://localhost:3000/oauth/token", req_params)
    session[:access_token] = response['access_token']
    #oauth_token_path="#{ENV['server_base_url']}/oauth/token?client_id=#{ENV['oauth_token']}&client_secret=#{ENV['oauth_secret']}&code=#{params[:code]}&grant_type=authorization_code&redirect_uri=#{ENV['oauth_redirect_uri']}"

    redirect_to pages_path
  end

  def put_oauth_token
  	  p "====== inside put"
  	  p params
  end
end