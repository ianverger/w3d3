

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

def fib_iter(n)
    seq = [0, 1, 1]
    return seq.take(n) if n <= 3
    (n - 3).times { seq << seq[-1] + seq[-2] }
    seq
end

def fib_rec(n)
    return [0, 1].take(n) if n <= 2
    fib_rec(n - 1) << fib_rec(n - 1)[-1] + fib_rec(n - 1)[-2] 
end

def bsearch(arr, target)
    return nil if arr.empty? 
    middle = arr.length / 2
    if target == arr[middle]
        return middle 
    elsif target > arr[middle] 
        second = arr[middle + 1...arr.length]
        second_cut = bsearch(second, target) 
        if second_cut == nil 
            return nil
        else
            return middle + 1 + second_cut
        end
        
    else
        first = arr[0...middle]
        return bsearch(first, target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    p arr
    return [arr] if arr.length <= 1
    middle = arr.length / 2

    first_half = arr[0...middle]
    second_half = arr[middle...arr.length]

    # if arr.length == 2
    #     first_half = [arr[0]]
    #     second_half = [arr[1]]
    # end

    merge_sort(first_half) + merge_sort(second_half)
end

arr = [38,27,43,3,9,82,10]

print merge_sort(arr)

# def merge(arr)
#     return arr if arr.flatten == arr
    
#     arr.each.with_index do |sub, i|
#         if i % 2 == 0
#             pair = [arr[i], arr[i + 1]]
#             merge(pair)
#         end
#     end


# end