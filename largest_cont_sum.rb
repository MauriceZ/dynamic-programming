def largest_contiguous_sum(arr)
	m = []
	arr.each_with_index do |num, i|
        if i == 0
            m[i] = num
        else
            m[i] = [num, num + m[i - 1]].max
        end
	end

    max = 0
    max_index = 0
    m.each_with_index do |num, i|
        if num > max
            max = num
            max_index = i
        end
    end

    sum = 0
    cur_index = max_index
    until sum == max
        sum += arr[cur_index]
        cur_index -= 1
    end

    arr[cur_index+1..max_index]
end

arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
p largest_contiguous_sum(arr)
