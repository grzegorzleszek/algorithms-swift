//
//  GraphTravelingSalesmanTests.swift
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

class GraphTravelingSalesmanTests: XCTestCase {
    
    var graph: Graph!
    
    override func setUp() {
        super.setUp()
        graph = Graph()
    }
    
    // MARK: - Traveling Salesman
    
    func test_tsp_shouldReturnA_whenGivenVertexA() {
        let a = Vertex(id: 1)
        graph._vertices = [a]
        let result = graph.tsp(start: a, graph: graph).vertices
        XCTAssert(result[0] == a)
    }

    func test_tsp_shouldReturnAB_whenGivenTwoVertices() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let ab = Edge(id: 1, left: a, right: b)
        graph._edges = [ab]
        graph._vertices = [a, b]
        let result = graph.tsp(start: a, graph: graph).vertices
        XCTAssert(result[0] == a)
        XCTAssert(result[1] == b)
    }

    func test_tsp_shouldReturnABC_whenGivenThreeVertices() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        let ab = Edge(id: 1, left: a, right: b)
        let ac = Edge(id: 2, left: a, right: c)
        let bc = Edge(id: 3, left: b, right: c)
        graph._edges = [ab, ac, bc]
        graph._vertices = [a, b, c]
        let result = graph.tsp(start: a, graph: graph).vertices
        XCTAssert(result[0] == a)
        XCTAssert(result[1] == c)
        XCTAssert(result[2] == b)
    }

    func test_tsp_shouldReturnACB_whenGivenThreeVerticesWithExpensivePathAB() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        let ab = Edge(id: 1, left: a, right: b)
        let ac = Edge(id: 2, left: a, right: c, weight: 1)
        let bc = Edge(id: 3, left: b, right: c)
        graph._edges = [ab, ac, bc]
        graph._vertices = [a, b, c]
        let result = graph.tsp(start: a, graph: graph).vertices
        XCTAssert(result[0] == a)
        XCTAssert(result[1] == b)
        XCTAssert(result[2] == c)
    }

    func test_tsp_shouldReturnABCD_whenGivenFourVertices() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        let d = Vertex(id: 4)
        let ab = Edge(id: 1, left: a, right: b, weight: 10)
        let ac = Edge(id: 2, left: a, right: c, weight: 50)
        let ad = Edge(id: 3, left: a, right: d, weight: 45)
        let bc = Edge(id: 4, left: b, right: c, weight: 25)
        let bd = Edge(id: 5, left: b, right: d, weight: 25)
        let cd = Edge(id: 6, left: c, right: d, weight: 40)
        graph._edges = [ab, ac, ad, bc, bd, cd]
        graph._vertices = [a, b, c, d]
        let result = graph.tsp(start: b, graph: graph).vertices
        XCTAssert(result[0] == a)
        XCTAssert(result[1] == b)
        XCTAssert(result[2] == d)
        XCTAssert(result[3] == c)
    }

    func test_tsp_shouldReturnADEBC_whenGivenFiveVerticesWithWeights() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        let d = Vertex(id: 4)
        let e = Vertex(id: 5)
        let ab = Edge(id: 1, left: a, right: b, weight: 16)
        let ad = Edge(id: 2, left: a, right: d, weight: 14)
        let ae = Edge(id: 3, left: a, right: e, weight: 22)
        let eb = Edge(id: 4, left: e, right: b, weight: 4)
        let ed = Edge(id: 5, left: e, right: d, weight: 7)
        let cb = Edge(id: 6, left: c, right: b, weight: 18)
        let ce = Edge(id: 7, left: c, right: e, weight: 23)
        let cd = Edge(id: 8, left: c, right: d, weight: 19)
        graph._edges = [ab, ad, ae, eb, ed, cb, ce, cd]
        graph._vertices = [a, b, c, d, e]
        let result = graph.tsp(start: a, graph: graph).vertices
        XCTAssert(result[0] == a)
        XCTAssert(result[1] == d)
        XCTAssert(result[2] == e)
        XCTAssert(result[3] == b)
        XCTAssert(result[4] == c)
    }
}
