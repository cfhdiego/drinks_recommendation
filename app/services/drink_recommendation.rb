class DrinkRecommendation
	attr_reader :attributes
	RECOMMENDATION_HANDLER = {
		":name" => "name ILIKE '%value%'",
		":adv_name" => "name ILIKE '%value%'",
		":description" => "description ILIKE '%value%'",
		":alcohol_level" => "alcohol_level = value",
		":distilled" => "distilled is value",
		":temperature" => "temperature = value",
		":base_ingredient" => "base_ingredient ILIKE '%value%'",
		":origin" => "origin ILIKE '%value%'",
		":drinkware" => "drinkware ILIKE '%value%'",
		":ibu" => "ibu = value",
		":rating_avg" => "rating_avg = value"
	}

	def initialize(att)
		@attributes = att
	end

	def drinks_found
		conditions = []
		@attributes.each do |key, value|
			conditions << (RECOMMENDATION_HANDLER[key]).gsub('value', value)
		end

		Drink.where(conditions.join(" and ")).order('name')
	end

end