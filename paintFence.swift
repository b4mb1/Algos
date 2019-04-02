// Given number of colors - k and number of boards in a fence - n
// write function to return number of different ways one can
// paint a fence so that no more than two adjacent boards are the same color

func paintFence(colors k: Int, boards n: Int) -> Int {
    guard n > 0 && k > 0 else {
        return 0
    }
    
    if n == 1 {
       return k
    }
    
    if n == 2 {
        return k*k
    }
    
    var last_same = 0
    var last_diff = k
    
    for _ in 0...n-2 {
        let new_last_diff = (last_diff * (k-1)) + (last_same * (k-1))
        let new_last_same =  last_diff
        
        last_diff = new_last_diff
        last_same = new_last_same
    }
    return last_diff + last_same
}

print(paintFence(colors: 5, boards: 6))
