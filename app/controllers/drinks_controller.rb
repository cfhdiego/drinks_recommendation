class DrinksController < ApplicationController
  
  def index
  	
  	if params[:drink].present? and params[:drink].keep_if{|key, value| value != ""}.present?
  		service = DrinkRecommendation.new(params[:drink])
  		@drinks = service.drinks_found.page params['page']
  	else
    	@drinks = Drink.all.order(:created_at).page params['page']
    end
    respond_to do |format|
    	format.js
    	format.html
  	end
  end


end
