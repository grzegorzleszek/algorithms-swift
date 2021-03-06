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

import XCTest
@testable import algorithms
class SortTest: XCTestCase {

    func test_singleElement() {
        let input = [1]
        let expectations = [1]
        XCTAssertEqual(mergeSortOutput(input: input), expectations)
        XCTAssertEqual(quickSortOutput(input: input), expectations)
        XCTAssertEqual(bucketSortOutput(input: input), expectations)
    }

    func test_twoElementsSorted() {
        let input = [1, 2]
        let expectations = [1, 2]
        XCTAssertEqual(mergeSortOutput(input: input), expectations)
        XCTAssertEqual(quickSortOutput(input: input), expectations)
        XCTAssertEqual(bucketSortOutput(input: input), expectations)
    }

    func test_twoElementsReverted() {
        let input = [2, 1]
        let expectations = [1, 2]
        XCTAssertEqual(mergeSortOutput(input: input), expectations)
        XCTAssertEqual(quickSortOutput(input: input), expectations)
        XCTAssertEqual(bucketSortOutput(input: input), expectations)
    }

    func test_threeElements123() {
        let input = [1, 2, 3]
        let expectations = [1, 2, 3]
        XCTAssertEqual(mergeSortOutput(input: input), expectations)
        XCTAssertEqual(quickSortOutput(input: input), expectations)
        XCTAssertEqual(bucketSortOutput(input: input), expectations)
    }

    func test_threeElements132() {
        let input = [1, 3, 2]
        let expectations = [1, 2, 3]
        XCTAssertEqual(mergeSortOutput(input: input), expectations)
        XCTAssertEqual(quickSortOutput(input: input), expectations)
        XCTAssertEqual(bucketSortOutput(input: input), expectations)
    }

    func test_threeElements213() {
        let input = [2, 1, 3]
        let expectations = [1, 2, 3]
        XCTAssertEqual(mergeSortOutput(input: input), expectations)
        XCTAssertEqual(quickSortOutput(input: input), expectations)
        XCTAssertEqual(bucketSortOutput(input: input), expectations)
    }

    func test_threeElements231() {
        let input = [2, 3, 1]
        let expectations = [1, 2, 3]
        XCTAssertEqual(mergeSortOutput(input: input), expectations)
        XCTAssertEqual(quickSortOutput(input: input), expectations)
        XCTAssertEqual(bucketSortOutput(input: input), expectations)
    }

    func test_threeElements312() {
        let input = [3, 1, 2]
        let expectations = [1, 2, 3]
        XCTAssertEqual(mergeSortOutput(input: input), expectations)
        XCTAssertEqual(quickSortOutput(input: input), expectations)
        XCTAssertEqual(bucketSortOutput(input: input), expectations)
    }

    func test_threeElements321() {
        let input = [3, 2, 1]
        let expectations = [1, 2, 3]
        XCTAssertEqual(mergeSortOutput(input: input), expectations)
        XCTAssertEqual(quickSortOutput(input: input), expectations)
        XCTAssertEqual(bucketSortOutput(input: input), expectations)
    }

    func test_tenElements() {
        let input = [1, 6, 3, 4, 2, 7, 5, 0, 8, 9]
        let expectations = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        XCTAssertEqual(mergeSortOutput(input: input), expectations)
        XCTAssertEqual(quickSortOutput(input: input), expectations)
        XCTAssertEqual(bucketSortOutput(input: input), expectations)
    }
    
    private func mergeSortOutput(input: [Int]) -> [Int] {
        return mergeSort(elements: input)
    }
    
    private func quickSortOutput(input: [Int]) -> [Int] {
        var arr = input
        quickSort(&arr, 0, arr.count - 1)
        return arr
    }
    
    private func bucketSortOutput(input: [Int]) -> [Int] {
        var arr = input
        bucketSort(&arr, arr.count)
        return arr
    }
}
