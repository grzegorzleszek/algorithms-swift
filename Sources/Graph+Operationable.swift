//
//  Graph+Operations.swift
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

import Foundation

extension Graph {
    
    func neighborsOf(_ v: Vertex, withGiven edges: [Edge]) -> [Vertex] {
        var result = [Vertex]()
        for index in 0..<edges.count {
            if edges[index].left.id == v.id {
                result.append(edges[index].right)
            } else if edges[index].right.id == v.id {
                result.append(edges[index].left)
            }
        }
        return result
    }
    
    func contain(_ v: Vertex, onArray vertices: [Vertex]) -> Bool {
        for i in 0..<vertices.count {
            if vertices[i].id == v.id  {
                return true;
            }
        }
        return false
    }
    
    func bringVertexToFront(_ v: Vertex, vertices: [Vertex]) -> [Vertex] {
        var vertexArray = vertices
        let index  = vertices.index(where: {$0.id == v.id})
        vertexArray.remove(at: index!)
        vertexArray.insert(v, at: 0)
        return vertexArray
    }

    func findEdge(_ x: Vertex, _ y: Vertex) -> Edge? {
        for i in 0..<_edges.count {
            if (_edges[i].left.id == x.id && _edges[i].right.id == y.id)
            || (_edges[i].left.id == y.id && _edges[i].right.id == x.id) {
                return _edges[i]
            }
        }
        return nil
    }

}
