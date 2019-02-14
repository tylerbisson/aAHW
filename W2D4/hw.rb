
def sluggish_fish
    fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    longest = fishes.first 
    fishes.length.times do 
        fishes.each_with_index do |fish|
            longest = fish if fish.length > longest.length
        end
    end
    longest 
end

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def dominant_octopus(fishes)
    return fishes if fishes.length <= 1 

    mid = fishes.length / 2 
    left = fishes.take(mid)
    left = dominant_octopus(left)
    right = fishes.drop(mid)
    right = dominant_octopus(right)    
    puts "left: #{left.length}"    
    puts "right: #{right.length}"
    merge(left, right)
end

def merge(left, right)
    merged = []
    until left.empty? || right.empty? 
        case left.first.length <=> right.first.length 
        when -1 
            merged << left.shift
        when 0 
            merged << left.shift 
        when 1 
            merged << right.shift
        end
    end
    puts "merged: #{merged}"
    merged.concat(left) 
    merged.concat(right)
end