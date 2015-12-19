algorithms-swift  
===================

Library for graph algorithms which allow a fast algorithm computation for graph problems.

----------

Breadth-first search
-------------

In graph theory a breadth first search algorithm is used for searching for a specific node of a given graph or visiting all nodes of a graph. 

1.  Initialize: open=[Start]; closed=[]
2.  while open ≠ [] do
3.  begin
4. 	 remove the left most from open, call it X;
5.	 if X is a goal then return(success);
6.	 generate all children of X;
7.	 put X on closed;
8.	 eliminate any children of X already on either open or closed, as these will cause loops in the search;
9.	 put the remaining descendants, in order of discovery, on the right end of open;
10. end.

Complexity O( |V| + |E| )

#### Swift vs C++ (only C subclass and Standard Template Library)

<b> sample: </b> 10 001 vertices, 2000 vertices

Device  |  Swift  |  C++
------------- | ------------- | -------------
MacBook Air (13-inch, Mid 2013)  | 152 718 ms  | 2 260 ms 
MacBook Pro (Retina, 15-inch, Mid 2015)  | 116 853 ms  | 1 697 ms 

Source swift: https://gist.github.com/grzegorzleszek/db8546067844ae1ad9a1 <br>
Source c++: https://gist.github.com/grzegorzleszek/e5aadb96095b3f5b36a6

Bibliography: G. F. Luger, W. A. Stubblefield Artificial Intelligence, The Benjamin/Cummings (1989)
