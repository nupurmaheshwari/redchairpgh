class HomeController < ApplicationController
  authorize_resource :class => false

  def index
  end

  def about
  end

  def contact
  end

  def privacy
  end

  # def search
  # end
end