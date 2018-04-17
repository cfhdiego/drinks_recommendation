require 'rails_helper'

describe DrinkRecommendation do

	recommendation = DrinkRecommendation.new(name: 'test')
	context 'Recommend drinks' do
		it 'Receive at least one parameter' do
			expect(recommendation.attributes.size).to be > 0
		end

		it 'Return array or nil' do
			expect(recommendation.drinks_found).to be_an_instance_of(Array).or be_an_instance_of(Nil)	
		end

	end

end	