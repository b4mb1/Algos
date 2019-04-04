//
// Given an unsorted array of size N of non-negative integers,
// find a continuous sub-array which adds to a given number.
//

func subsequenceWithGivenSum(sum: Int, array:[Int]) -> (Int, Int)? {
    
    if array.isEmpty {
        return nil
    }
    
    if array.count == 1 {
        if sum == array[0] {
            return (0,0)
        } else {
            return nil
        }
    }
    
    var left: Int = 0
    var right: Int = 1
    var currSum: Int = array[0] + array[1]
    
    while right <= array.count {
        
        guard array[left] != sum else {
           return (left, left)
        }
        
        guard array[right] != sum else {
            return (right, right)
        }
        
        if array[left] > sum || array[right] > sum {
            left = right
            right = right + 1
            
            guard right < array.count else {
                return nil
            }
            
            currSum = array[left] + array[right]
            continue
        }

        if currSum < sum {
            right += 1
            
            guard right < array.count else {
                return nil
            }
            
            currSum += array[right]
            continue
        }
        
        if currSum > sum && left < right {
            currSum -= array[left]
            left += 1
            continue
        }
        
        if currSum == sum {
            return (left, right)
        }
    }
    
    return nil
}

if let output = subsequenceWithGivenSum(sum: 10, array: [7,8,3,3,2,6,1,5]) {
    print(" \(output.0) , \(output.1)")
} else {
    print("No such subarray exists")
}



//print(subsequenceWithGivenSum(sum: 12, array: [7,8,4,3,2,6,1,5]))
//print(subsequenceWithGivenSum(sum: 19, array: [7,8,4,3,2,6,1,5]))
