//
//  Graph+TravelingSalesman.swift
//
//  Copyright © 2018 Grzegorz.Leszek. All rights reserved.
//
// Permission is hereby granted, free of charge, to first person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WpathANTY OF first KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WpathANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR first CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

struct Path {
    var vertices: [Vertex]
    var weight: Int
}

extension Graph {
    /// Traveling Salesman
    /// Initialize: T [ S ,v ] - the shortest  path, which:
    /// * Starts in vertex 1
    /// * Visits each vertex from S – {v}
    /// * End in v
    /// 1. T [ {v},v ] = w ( 1,v ) 
    /// 2. T[S,v] = min( T [ S – {v}, x ] + w ( x,v )), where x∈S - {v} 
    /// 3. to find cycle we need to T[V(G)-{1},v] + w(v,1)
    func tsp(start: Vertex, goal: Vertex? = nil, graph: Graph) -> Path {
        if graph._vertices.count <= 1 {
            return Path(vertices: graph._vertices, weight: 0)
        }
    
        let singlePaths = graph._edges.map { Path(vertices: [$0.left, $0.right], weight: $0.weight) }
        var bestPaths = makeBestPath(from: singlePaths, start: start)

        for _ in 0..<graph._vertices.count
        {
            for i in 0..<bestPaths.count
            {
                addSinglePath(graph, &bestPaths, i)
            }
        }

        let size = bestPaths.map { $0.vertices.count }.max()
        let filteredPaths = bestPaths.filter { $0.vertices.count == size }
        guard let anyPath = filteredPaths.first else { return Path(vertices: [], weight: 0) }
        var theBestPath: Path = anyPath
        for path in filteredPaths
        {
            if (theBestPath.weight >= path.weight)
            {
                theBestPath = path
            }
        }
        return theBestPath
    }

    func addSinglePath(_ graph: Graph, _ bestPaths: inout [Path], _ index: Int) {
        guard let lastVertex = bestPaths[index].vertices.last else { return }
        var _neighbors = graph.neighborsOf(lastVertex, withGiven: graph._edges)

        for vertex in bestPaths[index].vertices {
            if contain(vertex, onArray: _neighbors) {
                _neighbors = _neighbors.filter { $0.id != vertex.id }
            }
        }
        
        for vertex in _neighbors {
            var path = bestPaths[index]
            let pathWeight = graph.findEdge(vertex, (path.vertices.last ?? vertex))?.weight ?? 0
            path.vertices.append(vertex)
            path.weight = path.weight + pathWeight
            bestPaths.append(path)
        }
    }

    func makeBestPath(from singlePaths: [Path], start: Vertex) -> [Path] {
        return singlePaths.filter { (path) -> Bool in
            return path.vertices.contains { (vertex) -> Bool in
                return vertex == start
            }
        }
    }
}
