class PersonsController < ApplicationController

  def profile
    @campaign = Campaign.all
  end
  
end
