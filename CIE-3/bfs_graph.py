class Graph:
    def __init__(self):
        self.adj_list = {}

    def add_edge(self, u, v):
        if u not in self.adj_list:
            self.adj_list[u] = []
        if v not in self.adj_list:
            self.adj_list[v] = []
        self.adj_list[u].append(v)
        self.adj_list[v].append(u)

    def bfs(self, start_vertex):
        visited = set()
        queue = [start_vertex]
        visited.add(start_vertex)

        for vertex in queue:  
            print(vertex, end=" ")

            for neighbor in self.adj_list.get(vertex, []):
                if neighbor not in visited:
                    visited.add(neighbor)
                    queue.append(neighbor)


graph = Graph()
graph.add_edge(1, 2)
graph.add_edge(1, 3)
graph.add_edge(2, 4)
graph.add_edge(3, 4)
graph.add_edge(4, 5)

graph.bfs(1)
