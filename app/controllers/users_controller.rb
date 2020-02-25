class UsersController < ApplicationController
  def index
    @cooks = User.where(iscook: true)
  end
end
