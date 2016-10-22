class SessionsController < ApplicationController
  def create
  	
       if(!params[:code].present?)
         p "-----------#{params['client_id']}------------------------------"
         session[:client_id]=params['client_id']
         p "-----------#{session['client_id']}------------------------------"
         session[:client_secret]=params['client_secret']
         redirect_to pages_path(params)
       else
         p "............Else..................."
         p"#{session[:client_id]}--------#{session[:client_secret]}"
         p "#{params[:code]}"
         p "................................................"
         req_params = "client_id=#{session[:client_id]}&client_secret=#{session[:client_secret]}&code=#{params[:code]}&grant_type=authorization_code&redirect_uri=#{ENV['oauth_redirect_uri']}"
         response = JSON.parse RestClient.post("http://localhost:3000/oauth/token", req_params)
         params[:access_token] = response['access_token']
         redirect_to pages_path(params)
      end
  end

  def put_oauth_token
  	  
  end
end