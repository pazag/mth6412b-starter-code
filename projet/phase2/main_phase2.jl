include("../phase1/node.jl")
include("../phase1/edge.jl")
include("../phase1/graph.jl")
include("../phase1/read_stsp.jl")
include("../phase1/create_graph.jl")
include("kruskal.jl")

""" Test de l'algorithme de Kruskal"""
my_node1 = Node(1,0)
my_node2 = Node(2,0)
my_node3 = Node(3,0)
my_node4 = Node(4,0)
my_node5 = Node(5,0)
my_node6 = Node(6,0)
my_node7 = Node(7,0)
my_node8 = Node(8,0)
my_node9=  Node(9,0)

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

println("\n\n")
show(kruskal_graph)
println("\n\n\n\n\n\n\n")

"""Test de l'algorithme de kruskal à partir d'une instance"""

path="../../instances/stsp/"
filename="pa561.tsp"
file_to_open=string(path,filename)
header=read_header(file_to_open)
read_edges(header,file_to_open)
read_stsp(file_to_open)
graph_2=create_graph(file_to_open)
kruskal_graph2=kruskal(graph_2)
show(kruskal_graph2)

println(nb_nodes(kruskal_graph2))
