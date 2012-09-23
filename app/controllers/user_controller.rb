class UserController < ApplicationController
	
  before_filter :get_user, :only => [:index,:new,:edit]
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create]
  load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]
  
  def index
    @users = User.accessible_by(current_ability, :index)
    respond_to do |format|
      format.html
    end
  end

  def new
     @user = User.new
    respond_to do |format|
       format.html
    end
  end

  def show
    respond_to do |format|
      format.json { render :json => @user }
      format.xml  { render :xml => @user }
      format.html      
    end
   end
 
 def edit
    respond_to do |format|
      format.json { render :json => @user }   
      format.xml  { render :xml => @user }
      format.html
    end
  end
 
  def destroy
    @user.destroy
 
    respond_to do |format|
      format.html { redirect_to user_users_path }      
    end
 
  end
 
  def create
    @user = User.new(params[:user])
 
    if @user.save
      respond_to do |format|
        format.html { redirect_to user_users_path }
      end
    else
      respond_to do |format|
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end

   def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end

  def get_user
    @current_user = current_user
  end
 
end

