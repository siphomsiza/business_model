class HomeController < ApplicationController
  skip_before_filter :authenticate_employee!
  layout 'landing_page'
  def index
  end
end
