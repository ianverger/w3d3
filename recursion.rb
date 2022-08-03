def range(start, finish)
    return [] if finish <= start
    return [start] if finish == start + 1
    [start] + range(start + 1, finish)
end

def exp1(b, n)
    return 1 if n == 0
    return b * exp1(b, n - 1)
end

# p exp1(2, 0)
# p exp1(2, 1)
# p exp1(2, 2)
# p exp1(4, 3)
# p exp1(4, 8)
# puts 

def exp2(b, n)
    return 1 if n == 0
    if n.even?
        return exp2(b, n/2) ** 2
    else
        return b * (exp2(b, (n-1)/2) ** 2)
    end
end


# p exp2(2, 0)
# p exp2(2, 1)
# p exp2(2, 2)
# p exp2(4, 3)
# p exp2(4, 8)

class Array

    def deep_dup
        if self.none?{|ele| ele.is_a?(Array)}
            duo_inner_arr = []
            self.each { |ele| new_arr << ele }
            return dup_inner_arr
        end

        dup_arr = []

        self.each do |ele|
            if ele.is_a?(Array)
                dup_arr << ele.deep_dup
            else
                dup_arr << ele
            end
        end
        return dup_arr
    end

end

# arr = [1,2,3]
# arr_dup = arr.deep_dup

# p arr2 = [[1, 2, 3],4, [5],[[6,[7]]]]
# p arr2_dup = arr2.deep_dup

# p arr2_dup.object_id == arr2.object_id
