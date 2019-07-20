class ComponentsController < ApplicationController

  before_action :authenticate_user!
  layout 'application'

  def index
  end

  def usage
  end
end
