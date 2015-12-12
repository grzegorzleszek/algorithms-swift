//
//  graphTest.swift
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

class GraphTest: XCTestCase {
    
    func testGraphCreation() {
        var G = Graph()
        XCTAssert(G._edges.count == 0)
        XCTAssert(G._vertices.count == 0)
        
        let a = Vertex(id: 0)
        let b = Vertex(id: 0)
        let ab = Edge(id: 0, left: a, right: b)
        
        G._edges = [ab]
        G._vertices = [a,b]
        
        XCTAssert(G._edges.count == 1)
        XCTAssert(G._vertices.count == 2)
    }
    
}
