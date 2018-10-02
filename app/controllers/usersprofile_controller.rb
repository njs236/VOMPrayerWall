class UsersprofileController < ApplicationController
  before_action :ensure_login, only: [:show, :index, :new, :create]
  
  def show
  end
  
  def index
    @name = @current_user.name
    
    @invitations = Invitation.where("`from`=? OR `to`=?", @current_user.email, @current_user.email)
    @usergroup = @current_user.usergroup
  end

  def new
   
  end
  
  def create
    @invitation = @current_user.invitations.new
    @invitation.from = @current_user.id
    #@invitation.to = @to
    @invitation.email = params[:invitation]
    @invitation.user_group = params[:user_group_id]
    
    if @invitation.save
      flash[:notice] = 'Invitation sent'
      redirect_to users_path
    else
      redirect_to users_path
    end
    #must listen for invitations on users. 
  end
  

end
