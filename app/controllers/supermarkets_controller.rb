class SupermarketsController < ApplicationController
  def index
    @markets = Supermarket.all
  end
end