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

class GraphOperationableTests: XCTestCase {
    
    var graph: Graph!
    
    override func setUp() {
        super.setUp()
        graph = Graph()
    }
    
    func test_singleVertexGraph_shouldHaveNoNeighbors() {
        generateSingleVertexGraph()
        let neighbors = graph.neighborsOf(Vertex(id: 1), withGivenEdges: graph.edges)
        XCTAssert(neighbors.count == 0)
    }
    
    func test_singleVertexGraph_shouldHaveNoNeighbors_whenProvideUnrelatedEdge() {
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let c = Vertex(id: 3)
        let ab = Edge(id: 1, left: a, right: b)
        let neighbors = graph.neighborsOf(c, withGivenEdges: [ab])
        XCTAssert(neighbors.count == 0)
    }
    
    func test_singleEdgeGraph_shouldHaveOneNeighbor_whenFirstVertexUsedAsParameter() {
        generateSingleEdgeGraph()
        let neighbors = graph.neighborsOf(Vertex(id: 1), withGivenEdges: graph.edges)
        XCTAssert(neighbors.count == 1)
    }
    
    func test_singleEdgeGraph_shouldHaveOneNeighbor_whenSecondVertexUsedAsParameter() {
        generateSingleEdgeGraph()
        let neighbors = graph.neighborsOf(Vertex(id: 2), withGivenEdges: graph.edges)
        XCTAssert(neighbors.count == 1)
    }
    
    // MARK: - Helpers
    
    func generateSingleVertexGraph() {
        var G = Graph()
        let a = Vertex(id: 1)
        G.edges = []
        G.vertices = [a]
        self.graph = G
    }
    
    func generateSingleEdgeGraph() {
        var G = Graph()
        let a = Vertex(id: 1)
        let b = Vertex(id: 2)
        let ab = Edge(id: 1, left: a, right: b)
        G.edges = [ab]
        G.vertices = [a,b]
        self.graph = G
    }
}
