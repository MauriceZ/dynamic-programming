class KnapsackItem
	attr_reader :weight, :value

	def initialize(weight, value)
		@weight = weight
		@value = value
	end
end


def opt_knapsack(items, max_weight)
	max_values = [0]

	(1..max_weight).each do |weight|
		opt_value = 0

		items.each_with_index do |item, i|
			remaining_weight = weight - item.weight
			if remaining_weight >= 0 && max_values[remaining_weight] + item.value > opt_value
				opt_value = max_values[remaining_weight] + item.value
			end
		end

		max_values[weight] = [opt_value , max_values[weight - 1]].max
	end

	max_values[max_weight]
end

item1 = KnapsackItem.new(20, 9)
item2 = KnapsackItem.new(15, 7)
item3 = KnapsackItem.new(11, 5)
item4 = KnapsackItem.new(8, 1)

items = [item1, item2, item3, item4]

puts opt_knapsack(items, 41)
