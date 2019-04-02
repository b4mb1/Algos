//
//
// Given an array representing share prices over time calculate 
// max possible profit to gain while following strategy that:
// - allows to buy or sell only once a day 
//
// during time under consideration

func oneSellOneBuyADay(array:[Float]) -> Float {
    var totalSum: Float = 0
    
    let count = array.count
    
    guard let last = array.last, count > 1 else {
        return totalSum
    }
    
    var currLocalMax: Float = last
    
    for index in stride(from: count - 1, to: 0, by: -1) {
        if currLocalMax < array[index - 1] {
            currLocalMax = array[index - 1]
        } else {
            let income = currLocalMax - array[index - 1]
            totalSum += income
        }
    }
    return totalSum
}

print(oneSellOneBuyADay(array: [ 1,2,33,4,5,3,2,1,4,5,6,3,2,1,3,34,2]))
