//
//  GraphTests.swift
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
@testable import algorithms

class GraphOperationableTests: XCTestCase {
    
    var graph: Graph!
    
    override func setUp() {
        super.setUp()
        graph = Graph()
    }
    
    // MARK: - neighborsOf v withGiven edges
    
    func test_neighborsOfVWithGivenEdges_shouldHaveNoNeighbors_whenIsSingleVertexGraph() {
        let a = Vertex(id: 1)
        let neighbors = graph.neighborsOf(a, withGiven: [])
        XCTAssert(neighbors.count == 0)
    }
    
    func test_neighborsOfVWithGivenEdges_shouldHaveNoNeighbors_whenSingleVertexGraph_andProvideUnrelatedEdge() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        let ab = Edge(id: 1, left: a, right: b)
        let neighbors = graph.neighborsOf(c, withGiven: [ab])
        XCTAssert(neighbors.count == 0)
    }
    
    func test_neighborsOfVWithGivenEdges_shouldHaveOneNeighbor_whenSingleEdgeGraph_andFirstVertexUsedAsParameter() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let ab = Edge(id: 1, left: a, right: b)
        let neighbors = graph.neighborsOf(a, withGiven: [ab])
        XCTAssert(neighbors.count == 1)
    }
    
    func test_neighborsOfVWithGivenEdges_shouldHaveOneNeighbor_whenSingleEdgeGraph_andSecondVertexUsedAsParameter() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let ab = Edge(id: 1, left: a, right: b)
        let neighbors = graph.neighborsOf(b, withGiven: [ab])
        XCTAssert(neighbors.count == 1)
    }
    
    // MARK: - contain v onArray vertices
    
    func test_containVOnArrayVertices_shouldNotContainVertex() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        XCTAssertFalse(graph.contain(a, onArray: []))
        XCTAssertFalse(graph.contain(a, onArray: [b,c]))
    }
    
    func test_containVOnArrayVertices_shouldContainVertex() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        XCTAssertTrue(graph.contain(a, onArray: [a]))
        XCTAssertTrue(graph.contain(a, onArray: [a,b,c]))
        XCTAssertTrue(graph.contain(a, onArray: [c,b,a]))
    }
    
    // MARK: - contain v onArray vertices
    
    func test_bringVertexToFront_shouldDoNothing_whenGivenOneVertex() {
        let a = Vertex(id: 1)
        let array = graph.bringVertexToFront(a, vertices: [a])
        if let first = array.first {
            XCTAssertTrue(first == a)
        } else {
            XCTAssert(false)
        }
    }
    
    func test_bringVertexToFront_shouldBringLastElementToFront_whenGivenThreeVertices() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        let array = graph.bringVertexToFront(c, vertices: [a, b, c])
        if let first = array.first {
            XCTAssertTrue(first == c)
        } else {
            XCTAssert(false)
        }
    }
    
    func test_bringVertexToFront_shouldBringMiddleElementToFront_whenGivenThreeVertices() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        let array = graph.bringVertexToFront(b, vertices: [a, b, c])
        if let first = array.first {
            XCTAssertTrue(first == b)
        } else {
            XCTAssert(false)
        }
    }
    
    func test_bringVertexToFront_shouldDoNothing_whenVertexIsInTheFrontAlready() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        let array = graph.bringVertexToFront(a, vertices: [a, b, c])
        if let first = array.first {
            XCTAssertTrue(first == a)
        } else {
            XCTAssert(false)
        }
    }
}
