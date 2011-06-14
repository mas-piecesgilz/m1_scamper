# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  require File.join(Rails.root, 'lib', 'authenticated_system.rb')
  include AuthenticatedSystem
   before_filter :set_locale
   before_filter :get_pages_for_tabs
   before_filter :put_current_user_into_model
 #  before_filter { |c| Authorization.current_user = User.current_user}
  # before_filter :require_login
   helper_method :current_user
   
   def current_user 
        @current_user = User.find(1) 
        return @current_user if defined?(@current_user) 
   end
   
    def get_pages_for_tabs
      if logged_in?
        @tabs = Page.find_main
      else
        @tabs = Page.find_main_public
      end

    end
 
      
protected

      def set_locale
        session[:locale] = params[:locale] if params[:locale]
        I18n.locale = session[:locale] || I18n.default_locale

        locale_path = "#{LOCALES_DIRECTORY}#{I18n.locale}.yml"

        unless I18n.load_path.include? locale_path
          I18n.load_path << locale_path
          I18n.backend.send(:init_translations)
        end

      rescue Exception => err
        logger.error err
        flash.now[:notice] = "#{I18n.locale} translation not available"

        I18n.load_path -= [locale_path]
        I18n.locale = session[:locale] = I18n.default_locale
      end
      
      def put_current_user_into_model
        @user = User.find_by_id(session[:user_id])
        if @user
          User.current_user = @user
        end
      end
      
      def permission_denied
        flash[:error] = "Sorry, your user permissions do not allow you to access this information"
        redirect_to root_url
      end
      
      def late_to_be_approved
        Attendance.count(:all, :conditions => ["approve_id=? AND approvestatus IS ?", User.current_user.staff_id, nil])
      end
    
    
end