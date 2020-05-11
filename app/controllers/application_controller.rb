class ApplicationController < ActionController::Base
  before_action :load_registers
  def load_registers
    @categories = Category.all
  end
end
