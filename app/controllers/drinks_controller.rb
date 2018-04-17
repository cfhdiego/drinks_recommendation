class DrinksController < ApplicationController
  def index
  	
  	if params[:drink].present? and params[:drink].keep_if{|key, value| value != ""}.present?
  		service = DrinkRecommendation.new(params[:drink])
  		@drinks = service.drinks_found
  	else
    	@drinks = Drink.all.order(:created_at)
    end
    respond_to do |format|
    	format.js
    	format.html
  	end
  end


end
