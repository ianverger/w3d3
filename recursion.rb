def range(start, finish)
    return [] if finish <= start
    return [start] if finish == start + 1
    [start] + range(start + 1, finish)
end

def exponentiation