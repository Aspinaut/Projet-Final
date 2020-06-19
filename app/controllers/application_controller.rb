class ApplicationController < ActionController::Base
  add_flash_types :warning, :danger, :success, :info, :primary, :secondary, :light
end
