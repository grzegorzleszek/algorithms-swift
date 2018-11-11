algorithms-swift  
===================

Library for graph algorithms which allow a fast algorithm computation for graph problems.

----------

Breadth-first search
-------------

In graph theory a breadth first search algorithm is used for searching for a specific node of a given graph or visiting all nodes of a graph.

```
1.  Initialize: open=[Start]; closed=[]
2.  while open ≠ [] do
3.  begin
4.    remove the left most from open, call it X;
5.    if X is a goal then return(success);
6.    generate all children of X;
7.    put X on closed;
8.    eliminate any children of X already on either open or closed, as these will cause loops in the search;
9.    put the remaining descendants, in order of discovery, on the right end of open;
10. end.
```

Complexity: O(|V| + |E|), where |V| is number of vertices and |E| is number of edges.

Bibliography: G. F. Luger, W. A. Stubblefield, Artificial Intelligence, The Benjamin/Cummings (1989)


Deapth-first search
-------------

The depth first search algorithm has the same functionality as breadth first search algorithm but has different approach of traversing nodes.

```
1.  Initialize: open=[Start]; closed=[]
2.  while open ≠ [] do
3.  begin
4.    remove the left most from open, call it X;
5.    if X is a goal then return(success);
6.    generate all children of X;
7.    put X on closed;
8.    eliminate any children of X already on either open or closed, as these will cause loops in the search;
9.    put the remaining descendants, in order of discovery, on the left begining of open;
10. end.
```

Complexity: O(|V| + |E|)

Bibliography: G. F. Luger, W. A. Stubblefield, Artificial Intelligence, The Benjamin/Cummings (1989)


Dijsktra Algorithm
-------------

Shortest path between vertices. Problem of finding a path between two vertices in a graph such that the sum of the weights of its constituent edges is minimized. An example is finding the quickest way to get from one location to another on a road map.

```
1  Initialize: Graph, source;
2      foreach (vertex v in Graph) {
3          distance[v] = infinity;
4          previous[v] = undefined;
5      }
6      distance[source] = 0;
7      Q = the set of all nodes in Graph;
8      while (!Q.isEmpty()) {
9          u = vertex in Q with smallest distance in distance[];
10          if (distance[u] = infinity) {
11              break;
12          }
13          remove u from Q;
14          foreach (neighbor v of u) {
15              alt = distance[u] + dist_between(u, v);
16              if (alt < distance[v]) {
17                  distance[v] = alt;
18                  previous[v] = u;
19                  decrease-key v in Q;
20              }
21          }
22      }
23      return distance[] ;
```

Complexity O( |V|^2 )

Bibliography: Moshe Sniedovich, Dijkstra’s algorithm revisited: the dynamic programming connexion, Control and cybernetics (2006)


Euler Cycle
-------------

If it is possible to start at a vertex and move along each path so as to pass along each edge without going over any of them more than once, the graph has an Euler path.  If the path ends at the same vertex at which you started it is called an Euler cycle. There are two assumptions which must be satisfied by graph to have Euler cycle. First graph must be conected, second all its vertices are of even degree.  To solve this problem we will be using Fleury algorithm.

```
1. if ( !G.isEulerian() ) return;
2. Assign G’ = G
3. Append to solution vertex v
4. while  ( vertex v is not isolated )  {
5.      Assign in index of any vertex that is Incidence with v
6.      S.push( v );
7.      Delete from G’ edge w – v
8.      Assign   v = w
     }
9.  if ( !S.isEmpty() ) {
10.      Assign   v = S.pop();
11.      Append to solution vertex v
12.      GO TO   4.
     }
13. return
```

Complexity: O( |E|^2 )

Bibliography: E. Lucas Récréations mathématiques {in French}, C. Delagrave. (1883)


Hamiltonian Cycle
-------------

In the mathematical field of graph theory, a Hamiltonian path (or traceable path) is a path in an undirected graph that visits each vertex exactly once. A Hamiltonian cycle (or Hamiltonian circuit) is a cycle in an undirected graph that visits each vertex exactly once and also returns to the starting vertex, which is an NP-complete problem. It is based on Traveling Salesman algorithm, which is more general case. Graph first is transferred to complete graph, where non existing nodes have weights equal to one and existing nodes weights equal to zero. Such constructed graph is computing using TSP algorithm. When weight of route of salsman is equal to zero, then there exist hamiltonian path. Otherwise it does not.


Longest path in directed acyclic graph
-------------

The longest path problem is the problem of finding a path of maximum length in a graph. Polynomial solutions for this problem are known only for small classes of graphs, while it is NP-complete on general graphs, as it is a generalization of the Hamiltonian path problem.

```
1. Initialize:	topOrder = BFS(Start);
2.			length_to[topOrder.size()];
3. foreach (vertex v in topOrder) {
4. 	foreach (edge (v, w) in E(G)) {
5.		if ( length_to[w] <= length_to[v] + weight(G,(v,w)) ) {
6.			length_to[w] = length_to[v] + weight(G, (v,w))
7.		}
8.	}
9. }
10.return max(length_to[v] for v in V(G))
```

Complexity: O( |V| + |E| )

Bibliography: Robert Sedgewick, Algorithms in Java (2004)


Maximum clique
-------------

A clique in an undirected graph G = (V, E) is a subset of the vertex set C⊆V, such that for every two vertices in C, there exists an edge connecting the two, which is NP-complete problem. This is equivalent to saying that the subgraph induced by C is complete (in some cases, the term clique may also refer to the subgraph). A maximum clique is a clique of the largest possible size in a given graph. The clique number ω(G) of a graph G is the number of vertices in a maximum clique in G. The intersection number of G is the smallest number of cliques that together cover all edges of G. Algorithm is based on maximum independent set algorithm. It is using property of graph that maximum clique of G is maximum independent set of G complement.


Maximum independent set
-------------

According to WolframMathWorld[8], an independent vertex set of a graph G is a subset of the vertices such that no two vertices in the subset represent an edge of G. A maximum independent vertex set is an independent vertex set containing the largest possible number of vertices for a given graph. It is an NP-complete problem

```
1. if(|V (G)| ≤ 1) return |V (G)|;
2. if( ∃ component C ⊂ G) return mis(C)+mis(G – C);
3. if( ∃ vertices v and w: N[w] ⊆ N[v]) return mis(G - {v});
4. if( ∃ a vertex v, with d(v) = 2) return 1+mis(G~(v));
5. select a vertex v of maximum degree, which minimizes |E(N(v))|;
6. return max{mis(G – {v} - M(v)), 1+mis(G - N[v])};
```

Complexity: O(2^|V|*0.406)

Bibliography: F. V. Fomin, F. Grandoni, D. Kratsch, A Measure & Conquer Approach for the Analysis of Exact Algorithms REPORT NO 359 (2007)


Maximum Matching of bipartite graphs
-------------

Matching M is a subset of its edges such that no two meet the same vertex. M is a maximum matching if no other matching in graph G contains more edges than M. Vertex is exposed if it meets no edge from M. An alternating path in (G,M) is a simple path whose edges are alternately in M and not in M. An augmenting path is an alternating path whose ends are distinct exposed vertices.

```
1. foreach( exposed v in A ) {
2. 	Search for simple alternating paths starting at v
3. 	if ( path P ends at an exposed vertex u in B ) { 
4.		P is an augmenting path {Update M}
5.	}
6. }
7. Current M is maximum {No more augmenting paths}
```

Complexity: O( |E| * |V| )

Bibliography: Ahmad Khayyat, Maximum Matching in General Graphs (2008)


Minimum spanning tree
-------------

A subgraph that is a tree and that reaches out to all vertices of the original graph is called a spanning tree. Among all the spanning trees of a weighted and connected graph, the one with the least total weight is called a minimum spanning tree (MST). For solving this problem we used Borůvka's algorithm.

```
1. Initialize: G = connected graph G with distinct edges weights;
2.		  T = empty set of edges
3. While ( !isConnected(G.veritces, T) )
4.  {
5.	component = G.vertices; // list of sets of connected vertices 
6.	Foreach (component)
7.	{
8.		S = empty set of edges
9.		Foreach (vertex in the component)
10.		{
11.			Add the cheapest edge from the vertex in the component
12.			to another vertex in a disjoint component to S
13.		}
14.		Add the cheapest edge in S to E
15.	}
16. 	Add the resulting set of edges E to T.
17. }
18. return T;
```

Complexity: O(|E| * log |V|) 

Bibliography: O. Borůvka, About a certain minimal problem {in Czech}, Praca Moravske Prirodovedecke Spolecnosti 3 (1926)


Shortest cycle in a graph
-------------

In graph theory, the term cycle may refer to a closed path. If the path is a simple path, with no repeated vertices or edges other than the starting and ending vertices, it may also be called a simple cycle, circuit, circle. If the smallest degree of vertex in graph G is not smaller than 2, then graph G contains cycle. For finding shortest cycle in graph we will use modified Depth First Search algorithm.

```
1. startingVertex.Visited = ture
2. returnStack.Push(startingVertex)
3.	for each (neighbor of starting vertex )
4.		if(neighbor is not null and neighobr.Visited == false)
5.		  if ((returnstack.Count + 1) >= 3)
6. 			for each (Vertex in startingVertex 					  				Neighbor.ElementAt(i).Neighbors.Keys)	
7.				if (Vertex.Id == startingVertex.Id) 
8.				   if ((shCycle == null) or (shCycle.Count==0))
9.					shCycle = returnstack
10.			                 shCycle.Add(Vertex)
11.		 		   else
12.				     if (shCycle.Count > (returnstack.Count + 1))
13.					 shCycle = returnstack
14. 			   		 shCycle.Add(Vertex)
15.		 dfs(startingVertex ElementAt(i) )
```

Complexity: O( |V|^2 )

Bibliography: Michael T. Goodrich and Roberto Tamassia, Algorithm Ddesign (2004)


Traveling Salesman
-------------

Traveling Salesman is more general problem of Hamiltonian Cycle. For given cities and distance between them, the task is to find the shortest possible route between them, such that it visit all cities. In our project TSP is modeled as undirected simple complete graph, where vertices correspond to cities, edges with weight to routes and it's cost. It is an NP-complete problem.

```
Initialize: T [ S ,v ] - the shortest  path, which:
	* Starts in vertex 1
	* Visits each vertex from S – {v}
	* End in v
1. T [ {v},v ] = w ( 1,v ) 
2. T[S,v] = min( T [ S – {v}, x ] + w ( x,v )), where x∈S - {v} 
3. to find cycle we need to T[V(G)-{1},v] + w(v,1)
```

Complexity: O(2^|V| * |V|^2)

Bibliography: M. Held & R. M. Karp The Traveling Salesman Problem and Minimum Spanning Trees, Springer (1971)
