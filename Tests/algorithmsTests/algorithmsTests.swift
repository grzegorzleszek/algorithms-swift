import XCTest
@testable import algorithms

extension Graph {
    static func generateBigGraph() -> Graph {
        var graph = Graph()
        var vertices = [Vertex]()
        var edges = [Edge]()
        for i in 1...1001 {
            vertices.append(Vertex(id: i))
        }
        for i in 0...199 {
            for j in 1...5 {
                edges.append(Edge(id: (i*5 + j), left: Vertex(id: i*5 + 1), right: Vertex(id: i*5 + 1 + j)))
            }
        }
        graph._edges = edges
        graph._vertices = vertices

        return graph
    }
}

class algorithmsTests: XCTestCase {
    func testTime() {
        let graph = Graph.generateBigGraph()
        var time = Date()
        _ = graph.bfs(start: Vertex(id: 1), graph: graph)
        print("Time to execute BFS: \(-time.timeIntervalSinceNow)")
        time = Date()
        _ = graph.dfs(start: Vertex(id: 1), graph: graph)
        print("Time to execute DFS: \(-time.timeIntervalSinceNow)")
    }


    static var allTests = [
        ("testExample", testTime),
    ]
}
