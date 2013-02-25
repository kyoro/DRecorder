
class StampsController < ApplicationController
  def index
    @stamps = Stamp.where(1).order("id DESC");
  end

  def new
  end
  
  def checkin
    idm = params[:idm]
    if idm.blank?
      return render :json => { :error => 'true' }
    end 
    user = User.find_by_idm(idm)
    if user.nil?
      return render :json => { :error => 'true' }
    end
    stamp = Stamp.new
    stamp.user = user
    stamp.save
    return render :json => { 
      :error => 'false',
      :name => user.username,
    }
  end
end
