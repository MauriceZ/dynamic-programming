def longest_sequence(arr)
    lengths = [1]

    arr.each_with_index do |num, i|
        next if i == 0

        max = 0
        (0..i-1).each do |j|
            if num > arr[j] && lengths[j] > max
                max = lengths[j]
            end
        end

        lengths[i] = max + 1
    end

    return lengths.max
end


puts longest_sequence([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15])
