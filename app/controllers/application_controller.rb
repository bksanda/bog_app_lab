class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def local_request?
  #   false
  # end

  # def rescue_action_in_public(exception)
  #   case exception
  #   when ActiveRecord::RecordNotFound
  #     render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
  #   else
  #     super
  #   end
  # end

  #code for throwing the error, this triggers the error and then catch it.
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end