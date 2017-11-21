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

Complexity O(|V| + |E|)

Bibliography: G. F. Luger, W. A. Stubblefield Artificial Intelligence, The Benjamin/Cummings (1989)


Deapth-first search.
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

Complexity: O(|V| + |E|), where |V| is number of vertices and |E| is number of edges.

Bibliography: G. F. Luger, W. A. Stubblefield Artificial Intelligence, The Benjamin/Cummings (1989)
