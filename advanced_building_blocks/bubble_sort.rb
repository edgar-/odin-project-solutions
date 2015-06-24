def bubble_sort(arr)
    arr_size = arr.length
    if arr_size < 2 ; return arr end
    
    while true
        i = 1
        sorted = false
        
        while i < arr.length
            if arr[i] < arr[i-1]
                temp = arr[i]
                arr[i] = arr[i-1]
                arr[i-1] = temp
                sorted = true
            end
            i += 1
        end
        
        return arr if !sorted 
    end
    
end

def bubble_sort_by(arr)
    arr_size = arr.length
    if arr_size < 2 ; return arr end
    
    while true
        i = 1
        sorted = false
        
        while i < arr.length
            if yield(arr[i-1], arr[i]) < 0
                temp = arr[i]
                arr[i] = arr[i-1]
                arr[i-1] = temp
                sorted = true
            end
            i += 1
        end
        
        return arr if !sorted 
    end
    
end

bubble_sort([4,3,78,2,0,2]) # => [0, 2, 2, 3, 4, 78]

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  right.length - left.length
end #    => ["hi", "hey", "hello"]
