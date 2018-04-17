class DrinkRecommendation
	attr_reader :attributes
	KEY_HANDLER = {
		":name" => "name ILIKE ",
		":descripiton" => "descripiton ILIKE ",
		":alcohol_level" => "alcohol_level = ",
		":distilled" => "distilled is ",
		":temperature" => "temperature = ",
		":base_ingredient" => "base_ingredient like ",
		":origin" => "origin like ",
		":drinkware" => "drinkware like ",
		":ibu" => "ibu BETWEEN ",
		":rating_avg" => "rating_avg = "
	}

	VALUE_HANDLER = {
		":name" => "name ILIKE ",
		":descripiton" => "descripiton ILIKE ",
		":alcohol_level" => "alcohol_level = ",
		":distilled" => "distilled is ",
		":temperature" => "temperature = ",
		":base_ingredient" => "base_ingredient like ",
		":origin" => "origin like ",
		":drinkware" => "drinkware like ",
		":ibu" => "ibu BETWEEN ",
		":rating_avg" => "rating_avg = "
	}

	def initialize(att)
		@attributes = att
	end

	def drinks_found
		conditions = []
		@attributes.each do |key, value|
			conditions << RECOMMENDATION_HANDLER[key] + "'%#{value.to_s}%'"
		end

		Drink.where(conditions.join(" and ")).order('name')
	end

end