class PagesController < ApplicationController

  def dashboard
   @user = current_user
   @kitchen = Kitchen.where(user: @user)
  end
end
