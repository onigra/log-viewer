class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_tag_list

  def set_tag_list
    @tags = SlowLog.group("server").count
  end
end
