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

protocol Operationable {
}

extension Operationable {
    
    func neighborsOf(v: Vertex, withGiven edges: [Edge]) -> [Vertex] {
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
    
    func contain(v: Vertex, onArray vertices: [Vertex]) -> Bool {
        for i in 0..<vertices.count {
            if vertices[i].id == v.id  {
                return true;
            }
        }
        return false
    }
    
    func bringVertexToFront(v: Vertex, vertices: [Vertex]) -> [Vertex] {
        var vertexArray = vertices
        let index  = vertices.indexOf({$0.id == v.id})
        vertexArray.removeAtIndex(index!)
        vertexArray.insert(v, atIndex: 0)
        return vertexArray
    }

}

extension Graph: Operationable {
}