//
// Write a function that returns n-th fibonacci number
//

import Foundation

// a) recursive approach

func fiboRecursively(n: Int) -> Int {

    if n < 0 {
        assertionFailure("wrong value")
        exit(0)
    } else if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fiboRecursively(n: n - 1) + fiboRecursively(n: n - 2)
    }
}

// b) dynamic programming approach

func fiboDynamically(n: Int) -> Int {
    
    var fibo1 = 0
    var fibo2 = 1
    
    if n <= 0 {
        assertionFailure("wrong value")
    } else if n == 0 {
        return fibo1
    } else if n == 1 {
        return fibo2
    }
    
    for _ in 0...(n - 2) {
        fibo1 = fibo2
        fibo2 = fibo2 + fibo1
    }
    
    return fibo2
}

print(fiboDynamically(n: 14))
print(fiboRecursively(n: 14))






