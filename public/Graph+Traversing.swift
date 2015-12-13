//
//  Graph+Traversing.swift
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

protocol Traversing {
}

extension Graph: Traversing {
    /// Breadth-first search.
    ///
    /// 1.  Initialize: open=[Start]; closed=[]
    /// 2.  while open ≠ [] do
    /// 3.  begin
    /// 4. 	 remove the left most from open, call it X;
    /// 5.	 if X is a goal then return(success);
    /// 6.	 generate all children of X;
    /// 7.	 put X on closed;
    /// 8.	 eliminate any children of X already on either open or closed, as these will cause loops in the search;
    /// 9.	 put the remaining descendants, in order of discovery, on the right end of open;
    /// 10. end.
    ///
    /// - Complexity: O(|V|+|E|), where |V| is number of vertices and |E| is number of edges.
    func bfs(start start: Vertex, goal: Vertex, graph: Graph) -> [Vertex]? {
        guard graph._vertices.count > 0
            else { return nil }
        var open = [Vertex]()
        var closed = [Vertex]()
        let vertexArray = bringVertexToFront(start, vertices: graph._vertices)
        open.append(vertexArray.first!)
        while open.count != 0 {
            let x = open.first!
            open.removeFirst()
            if x == goal {
                closed.append(x)
                return closed
            }
            var children = neighborsOf(x, withGiven: graph._edges)
            closed.append(x)
            for v in open {
                children = children.filter({$0.id != v.id})
            }
            for v in closed {
                children = children.filter({$0.id != v.id})
            }
            open.appendContentsOf(children)
        }
        return nil
    }
}
