class ApplicationController < ActionController::Base
  private def current_member
    Member.find_by(id: session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  class Forbidden < StandardError; end

  private def login_required
    raise Forbidden unless current_member
  end
end
