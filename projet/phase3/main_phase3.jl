include("../phase1/node.jl")
include("../phase1/edge.jl")
include("../phase1/graph.jl")
include("../phase1/read_stsp.jl")
include("../phase1/create_graph.jl")

include("prim.jl")
include("heuristique_acceleration.jl")

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
prim_example=prim(graph_example,nodes(graph_example)[1])

path="../../instances/stsp/"
filename="bayg29.tsp"
file_to_open=string(path,filename)
graph_1=create_graph(file_to_open)
prim_1=prim(graph_1,nodes(graph_1)[1])
heuris_rang_1=heuristique_union_rang(graph_1)
heuris_comp_1=heuristique_compression_chemin(graph_1)
kruskal_1=kruskal(graph_1)

filename="bays29.tsp"
file_to_open=string(path,filename)
graph_2=create_graph(file_to_open)
prim_2=prim(graph_2,nodes(graph_2)[1])
heuris_rang_2=heuristique_union_rang(graph_2)
heuris_comp_2=heuristique_compression_chemin(graph_2)
kruskal_2=kruskal(graph_2)


filename="dantzig42.tsp"
file_to_open=string(path,filename)
graph_3=create_graph(file_to_open)
prim_3=prim(graph_3,nodes(graph_3)[1])
heuris_rang_3=heuristique_union_rang(graph_3)
heuris_comp_3=heuristique_compression_chemin(graph_3)
kruskal_3=kruskal(graph_3)


filename="gr120.tsp"
file_to_open=string(path,filename)
graph_4=create_graph(file_to_open)
prim_4=prim(graph_4,nodes(graph_4)[1])
heuris_rang_4=heuristique_union_rang(graph_4)
heuris_comp_4=heuristique_compression_chemin(graph_4)
kruskal_4=kruskal(graph_4)


filename="pa561.tsp"
file_to_open=string(path,filename)
graph_5=create_graph(file_to_open)
prim_5=prim(graph_5,nodes(graph_5)[1])
heuris_rang_5=heuristique_union_rang(graph_5)
heuris_comp_5=heuristique_compression_chemin(graph_5)
kruskal_5=kruskal(graph_5)


print("instance cours, poids du MST : ")
println(get_total_weight(prim_example))
println("\n\n")

println("instance bayg29.tsp, poids du MST : ")
print("kruskal : ")
println(get_total_weight(kruskal_1))
print("Heuristique Rang  : ")
println(get_total_weight(heuris_rang_1))
print("Heuristique Compression chemin : ")
println(get_total_weight(heuris_comp_1))
print("Prim : ")
println(get_total_weight(prim_1))
println("\n\n")

println("instance bays29.tsp, poids du MST : ")
print("kruskal : ")
println(get_total_weight(kruskal_2))
print("Heuristique Rang  : ")
println(get_total_weight(heuris_rang_2))
print("Heuristique Compression chemin : ")
println(get_total_weight(heuris_comp_2))
print("Prim : ")
println(get_total_weight(prim_2))
println("\n\n")

println("instance dantzig42.tsp, poids du MST : ")
print("kruskal : ")
println(get_total_weight(kruskal_3))
print("Heuristique Rang  : ")
println(get_total_weight(heuris_rang_3))
print("Heuristique Compression chemin : ")
println(get_total_weight(heuris_comp_3))
print("Prim : ")
println(get_total_weight(prim_3))
println("\n\n")

println("instance gr120.tsp, poids du MST : ")
print("kruskal : ")
println(get_total_weight(kruskal_4))
print("Heuristique Rang  : ")
println(get_total_weight(heuris_rang_4))
print("Heuristique Compression chemin : ")
println(get_total_weight(heuris_comp_4))
print("Prim : ")
println(get_total_weight(prim_4))
println("\n\n")

println("instance pa561.tsp, poids du MST : ")
print("kruskal : ")
println(get_total_weight(kruskal_5))
print("Heuristique Rang  : ")
println(get_total_weight(heuris_rang_5))
print("Heuristique Compression chemin : ")
println(get_total_weight(heuris_comp_5))
print("Prim : ")
println(get_total_weight(prim_5))
println("\n\n")
