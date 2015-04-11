class BillboardSite
	attr_accessor :distance, :revenue

	def initialize(distance, revenue)
		@distance = distance
		@revenue = revenue
	end

	def next_compatible(sorted_sites, cur_i)
		return 0 if cur_i == 1

		(cur_i-1).downto(1) do |i|
			if @distance - sorted_sites[i].distance > 5
				return i
			end
		end

		0
	end
end

def max_revenue(sites)
	max_revenues = [0]

	sites.each_with_index do |cur_site, i|
		next if i == 0

		opt_with = cur_site.revenue + max_revenues[cur_site.next_compatible(sites, i)]
		opt_without = max_revenues[i - 1]
		max_revenues[i] = [opt_with, opt_without].max
	end

	max_revenues.last
end

site1 = BillboardSite.new(6, 5)
site2 = BillboardSite.new(7, 6)
site3 = BillboardSite.new(12, 5)
site4 = BillboardSite.new(14, 1)

sites = [nil, site1, site2, site3, site4]

puts max_revenue(sites)
