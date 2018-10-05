include("../phase1/edge.jl")
include("connected_node.jl")
include("kruskal.jl")


my_node1 = Node(1,1)
my_node2 = Node(2,1)
my_node3 = Node(3,1)
my_node4 = Node(4,1)
my_node5 = Node(5,1)
my_node6 = Node(6,1)
my_node7 = Node(7,1)
my_node8 = Node(8,1)
my_node9=  Node(9,1)

nodes_list=[my_node1,my_node2,my_node3,my_node4,my_node5,my_node6,my_node7,my_node8,my_node9]

edge1 = Edge(1, 2, 4)
edge2 = Edge(1, 8, 8)
edge3 = Edge(2, 3, 8)
edge4 = Edge(2, 8, 11)
edge5 = Edge(3, 4, 7)
edge6 = Edge(3, 9, 2)
edge7 = Edge(3, 6, 4)
edge8 = Edge(4, 5, 9)
edge9 = Edge(4, 6, 14)
edge10 = Edge(5, 6, 10)
edge11= Edge(6, 7, 2)
edge12=  Edge(7, 9, 6)
edge13= Edge(7, 8, 1)
edge14 = Edge(8, 9, 7)

edges_list = [edge1, edge2, edge3, edge4,edge5,edge6,edge7,edge8,edge9,edge10,edge11,edge12,edge13,edge14]

graph_example=Graph("Exemple_vu_en_cours",nodes_list,edges_list)

kruskal_graph=kruskal(graph_example)

show(kruskal_graph)
