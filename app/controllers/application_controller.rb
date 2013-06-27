class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_tag_list, :request_from

  def set_tag_list
    @tags = SlowLog.group("server").count
  end

  def request_from
    session[:return_to] ||= request.referer
  end
end
