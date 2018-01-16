//
//  GraphTests.swift
//
//  Copyright © 2018 Grzegorz.Leszek. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

func mergeSort(elements: [Int]) -> [Int] {
    if (elements.count <= 1) {
        return elements
    }

    var left = [Int]()
    var right = [Int]()
    for (i, x) in elements.enumerated() {
        if i < elements.count / 2 {
            left.append(x)
        } else {
            right.append(x)
        }
    }

    left = mergeSort(elements: left)
    right = mergeSort(elements: right)

    return merge(left, right)
}

private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result = [Int]()
    var l = left
    var r = right

    while !l.isEmpty && !r.isEmpty {
        if l.first! <= r.first! {
            result.append(l.first!)
            l = [Int](l.dropFirst(1))
        } else {
            result.append(r.first!)
            r = [Int](r.dropFirst(1))
        }
    }

    while !l.isEmpty {
        result.append(l.first!)
        l = [Int](l.dropFirst(1))
    }
    while !r.isEmpty {
        result.append(r.first!)
        r = [Int](r.dropFirst(1))
    }
    return result
}

func quickSort(_ A: inout [Int], _ lo: Int, _ hi: Int) {
    if lo < hi {
        let p = partition(&A, lo, hi)
        quickSort(&A, lo, p - 1 )
        quickSort(&A, p + 1, hi)
    }
}

private func partition(_ A: inout [Int], _ lo: Int, _ hi: Int) -> Int {
    let pivot = A[hi]
    var i = lo - 1
    (lo...(hi - 1)).forEach {
        let j = $0
        if A[j] < pivot {
            i = i + 1
            A.swapAt(i, j)
        }
    }
    if A[hi] < A[i + 1] {
        A.swapAt(i + 1, hi)
    }
    return i + 1
}

func bucketSort(_ arr: inout [Int], _ n: Int) {
    var b = [[Int]](repeatElement([Int](), count: n))
    (0..<n).forEach { i in
        let bi = msbits(arr[i], n)
        b[bi].append(arr[i])
    }
    
    (0..<n).forEach { i in
        insertionSort(&b[i])
    }
    
    var index = 0
    (0..<n).forEach {
        let i = $0
        (0..<b[i].count).forEach { j in
            arr[index] = b[i][j];
            index += 1
        }
    }
}

private func msbits(_ x: Int, _ k: Int) -> Int {
    return min(abs(x), k - 1)
}

func insertionSort(_ A: inout [Int]) {
    var i = 1
    while i < A.count {
        var j = i
        while j > 0 && A[j-1] > A[j] {
            A.swapAt(j, j-1)
            j = j - 1
        }
        i = i + 1
    }
}
