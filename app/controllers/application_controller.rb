class ApplicationController < ActionController::Base
  class MyLogger < Logger
      include LoggerSilence
      include ActiveSupport::LoggerThreadSafeLevel
    end

    before_action :mylogger_test

    private

    def mylogger_test
      mylogger = MyLogger.new(STDOUT)
      mylogger.silence do
        mylogger.debug("controller = #{controller_name}")
        mylogger.info("action = #{action_name}")
        mylogger.error("controller#action = #{controller_name}##{action_name}")
      end
    end


  protect_from_forgery with: :exception

helper_method :current_user, :logged_in?

  def  current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
  def require_user
    if !logged_in?
      flash[:danger] = "you must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
