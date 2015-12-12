//
//  GraphTraversingTestsTests.swift
//
//  Copyright © 2015 Grzegorz.Leszek. All rights reserved.
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

class GraphTraversingTestsTests: XCTestCase {
    
    var graph: Graph!
    
    override func setUp() {
        super.setUp()
        graph = Graph()
    }
    
    // MARK: - bfs
    
    func test_bfs_shouldReturnVertexA_whenGivenVertexA() {
        let a = Vertex(id: 1)
        graph._vertices = [a]
        if let result = graph.bfs(start: a, goal: a, graph: graph) {
            XCTAssert(result == a)
        } else {
            XCTAssert(false)
        }
        
    }
    
    func test_bfs_shouldReturnSecondVertex_whenGivenTwoVertices() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let ab = Edge(id: 1, left: a, right: b)
        graph._edges = [ab]
        graph._vertices = [a, b]
        if let result = graph.bfs(start: a, goal: b, graph: graph) {
            XCTAssert(result == b)
        } else {
            XCTAssert(false)
        }
    }
    
    func test_bfs_shouldCorrectResult_whenGivenSevenVerticesGraph() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        let d = Vertex(id: 4)
        let e = Vertex(id: 5)
        let f = Vertex(id: 6)
        let g = Vertex(id: 7)
        let ab = Edge(id: 1, left: a, right: b)
        let ac = Edge(id: 2, left: a, right: c)
        let bd = Edge(id: 3, left: b, right: d)
        let be = Edge(id: 4, left: b, right: e)
        let cf = Edge(id: 5, left: c, right: f)
        let cg = Edge(id: 6, left: c, right: g)
        graph._edges = [ab, ac, bd, be, cf, cg]
        graph._vertices = [a, b, c, d, e, f, g]
        if let result = graph.bfs(start: a, goal: g, graph: graph) {
            XCTAssert(result == g)
        } else {
            XCTAssert(false)
        }
    }
}
