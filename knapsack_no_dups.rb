class KnapsackItem
  attr_reader :weight, :value

  def initialize(weight, value)
    @weight = weight
    @value = value
  end
end


def opt_knapsack_no_dups(items, max_weight)
  max_values = []

  (0..items.length-1).each do |i|
    max_values[i] = [0]
  end

  (1..max_weight).each do |weight|
    opt_value = 0

    items.each_with_index do |item, i|
      remaining_weight = weight - item.weight

      if i > 0
        value_without_item = max_values[i - 1][weight]
        value_with_item = remaining_weight >= 0 ? max_values[i - 1][remaining_weight] + item.value : 0
        max_values[i][weight] = [value_with_item, value_without_item].max
      else
        max_values[i][weight] = item.weight <= weight ? item.value : 0
      end
    end
  end

  opt_value = 0
  (0..items.length-1).each do |i|
    if max_values[i][max_weight] > opt_value
      opt_value = max_values[i][max_weight]
    end
  end

  opt_value
end

item1 = KnapsackItem.new(1, 30)
item2 = KnapsackItem.new(3, 14)
item3 = KnapsackItem.new(6, 16)
item4 = KnapsackItem.new(6, 40)

items = [item1, item2, item3, item4]

puts opt_knapsack(items, 7)
