class CoffeescriptsController < ApplicationController
  respond_to :json
  
  def index
    @coffeescripts = Coffeescript.all
    respond_with @coffeescripts.to_json
  end
end