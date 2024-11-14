# Load the igraph library
install.packages("igraph")
library(igraph)

# Step a: Create an adjacency list representation for a given undirected graph
# Let's assume we have an undirected graph with 5 vertices and some edges
# Initialize the graph with a list of edges
edges <- c(1, 2, 1, 3, 2, 3, 2, 4, 3, 5)

# Create an undirected graph using the edges list
g <- graph(edges = edges, directed = FALSE)

# Display the adjacency list
adj_list <- as_adj_list(g, mode = "all")
print("Adjacency List Representation:")
print(adj_list)

# Step b: Implement a function to add an edge between two vertices in the graph
add_edge <- function(graph, v1, v2) {
  graph <- add_edges(graph, c(v1, v2))
  return(graph)
}

# Example of adding an edge between vertex 4 and 5
g <- add_edge(g, 4, 5)

# Display the updated adjacency list
print("Updated Adjacency List Representation:")
print(as_adj_list(g, mode = "all"))

# Step c: Write an R function to perform DFS traversal on a graph starting from a specific vertex
dfs_traversal <- function(graph, start_vertex) {
  # Perform DFS using the igraph function
  dfs_result <- dfs(graph, root = start_vertex, unreachable = FALSE)
  
  # Return the vertices in the order they were visited
  return(dfs_result$order)
}

# Example DFS traversal starting from vertex 1
print("DFS Traversal starting from vertex 1:")
print(dfs_traversal(g, start_vertex = 1))
