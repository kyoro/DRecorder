require 'pp'
class MembersController < ApplicationController

def new
  @idm = params[:idm]
  if @idm.blank?
    return redirect_to root_path
  end
end

def create
  idm = params[:idm]
  pp params
  if params[:username].blank? || params[:email].blank? || params[:password].blank? || idm.blank?
    return redirect_to root_path
  end
  user = User.find_by_idm(idm) 
  
  unless user.nil?
    return redirect_to root_path
  end

  user = User.register(
      :username => params[:username],
      :idm => idm,
      :email => params[:email],
      :password => params[:password]
      );
  if user.nil?
    return redirect_to root_path
  end
  @user = user
end


end
