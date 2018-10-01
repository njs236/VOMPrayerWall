class UsersController < ApplicationController
  before_action :ensure_login, only: [:show, :index, :new, :create]
  def show
  end
  
  def index
    @name = @current_user.name
    
    @invitations = Invitation.where("`from`=? OR `to`=?", @current_user.email, @current_user.email)
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @from = @current_user.email
    @to = params[:invitation]
    @token = @current_user.token
    @invitation = @current_user.invitations.new
    @invitation.from = @from
    @invitation.to = @to
    @invitation.token = @token
    
    if @invitation.save
      flash[:notice] = 'Invitation sent'
      redirect_to users_path
    else
      redirect_to users_path
    end
    #must listen for invitations on users. 
  end
  

end
