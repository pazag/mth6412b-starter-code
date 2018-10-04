include("connected_node.jl")
include("../phase1/edge.jl")


my_node1 = ConnectedNode("LeZag",(1,2))
my_node2 = ConnectedNode("LeZag",(1,2))


edge1 = Edge(my_node1, my_node2, 10)
edge2 = Edge(my_node1, my_node2, 8)
edge3 = Edge(my_node1, my_node2, 1)
edge4 = Edge(my_node1, my_node2, 3)


edges_list = [edge1, edge2, edge3, edge4]
