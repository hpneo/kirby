class HomeController < ApplicationController

  def welcome
    @publishers = Publisher.all
  end

end