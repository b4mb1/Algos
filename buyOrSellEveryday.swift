//
//  
//  
//
//

func buySell()

func buyOrSellEveryday(array: [Int] ) -> Int {
    
    var total: Int = 0
    var buyPosition: Int = 0
    var sellPostition: Int = 0 {
        didSet {
            total = total + (sellPostition - buyPosition)
        }
    }
    
    if array[0] < array[1] {
        buyPosition = array[0]
    }
    
    for i in 0...array.count - 2 {
        let bool = buySell(first: array[i], second: array[i+1], third: array[i+2])
        if bool == true {
            buyPosition = array[i]
        } else if bool == false {
            sellPostition = array[i+1]
        }
    }
    
    guard let last = array.last else {
        return 0
    }
    
    if last > array[array.endIndex - 2] {
        sellPostition = last
    }
    
    return total
}

print(buyOrSellEveryday(array: [2,23,4,52,2,6,7,9,0,2,4,2]))




