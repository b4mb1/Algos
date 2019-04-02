//
//  
// Find subsequence with the largest sum 
// - negative numbers are allowed
//  
// 

func maxSum(array: [Int]) -> Int {
    var partialSum = 0
    var maxSum = 0
    
    for item in array {
        if (partialSum + item) > 0 {
            partialSum += item
            
            if partialSum > maxSum {
                maxSum = partialSum
            }
        } else {
            partialSum = 0
        }
    }
    return  maxSum
}

print(maxSum(array:[2,3,4,-12,0,4,5,7,88,6,-11,-45,3,-1]))
