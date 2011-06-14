class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  cattr_accessor :current_user
  include AuthenticatedSystem
   
  before_filter :login_required
  
  
  def index
     @users = User.find(:all)
   end

   def show
     @user = User.find(params[:id])s
   end

   def destroy
     @user = User.find(params[:id])
     @user.destroy

     respond_to do |format|
           format.html { redirect_to(:users, :notice => 'Goodbye!') }
           format.xml  { head :ok }
     end
   end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find(params[:id])

     if @user.update_attributes(params[:user])
       flash[:notice] = 'User was successfully updated.'
       redirect_to(user_path(@user))
     else
       render :action => 'edit'
     end
   end
  

  # render new.rhtml
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end
 
  def create
    @user = User.new(params[:user])

        respond_to do |format|
          if @user.save
            format.html { redirect_to(:users, :notice => 'Registration successfull.') }
            format.xml  { render :xml => @user, :status => :created, :location => @user }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
          end
        end
        
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
