class AccountController < ApplicationController
  def new
    @identity = Identity.new 
  end

  def create
  end
end
