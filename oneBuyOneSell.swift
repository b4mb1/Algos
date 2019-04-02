
/* 

Given an array representing share prices over time calculate 
max possible profit to gain while following strategy that:
- allows to buy only once 
- allows to sell only once
during time under consideration

*/

max possible profit 
func oneBuyOneSell(array: [Float]) -> Float {
    var totalSum: Float = 0
    let count = array.count
    
    guard let last = array.last, count > 1 else {
        return totalSum
    }
    
    var currLocalMax = last
    var surplus = last
    
    for index in stride(from: count - 1, to: 0, by: -1) {
        if currLocalMax < array[index - 1] {
            currLocalMax = array[index - 1]
        } else {
            surplus = array[index - 1]
            let diff = currLocalMax - surplus
            if totalSum < diff {
                totalSum = diff
            }
        }
    }
    return totalSum
}

// Example

print(oneBuyOneSell(array: [1,23,4,3,34,5,2,67,5,3,2,1]))
