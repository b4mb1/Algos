//
// Write algo to build a binary heap with largest element at the start of the array
// Represent heap as a binary tree and print it with inorder traversal


func visit(curr: Int, array: [Int], level: Int){
    let left = 2*curr
    let right = 2*curr+1
    
    if left <= array.count - 1 {
        visit(curr: left, array: array, level: level+1)
    }
    
    print(String(repeating: " ", count: 4*level) + "\(array[curr-1])")
    
    if right <= array.count - 1 {
        visit(curr: right, array: array, level: level+1)
    }
}

func displayHeap(A:[Int]) {
    if A.count >= 2 {
        visit(curr:1, array: A, level:0)
    }
}

func transformIndex(_ i: Int) -> Int {
    if i > 0 {
        return i - 1
    } else {
        return 0
    }
}

func maxHeapify(A:inout [Int], i: Int) {
    
    let left = 2*i
    let right = 2*i + 1
    var largest: Int = i
    
    let size = A.count
    if (size >= left && A[transformIndex(i)] < A[transformIndex(left)]) {
        largest = left
    }
    
    if (size >= right && A[transformIndex(largest)] < A[transformIndex(right)]) {
        largest = right
    }
    
    if i != largest {
        
        let swap = A[transformIndex(i)]
        A[transformIndex(i)] = A[transformIndex(largest)]
        A[transformIndex(largest)] = swap
        maxHeapify(A: &A, i: largest)
    }
}

func buildHeap(A:inout [Int]) {
    let size = A.count
    var index: Int
    for i in stride(from: size/2, to: 0, by: -1) {
        index = i
        maxHeapify(A: &A, i: index)
    }
    displayHeap(A: A)
}

var a = [2,3,4,5,6,7,7,2,1,2,3,4,5]
buildHeap(A: &a)
