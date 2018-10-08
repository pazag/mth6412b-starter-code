include("../phase1/node.jl")
include("../phase1/graph.jl")
include("connected_node.jl")


"""Test du constructeur si on n'a pas de parent"""

connected_node1=ConnectedNode(1,0,nothing)
s=string("Test contructeur sans parent : ",)
s=string(s, "\n Id : ", id(connected_node1)==1)
s=string(s, "\n data : ", data(connected_node1)==0)
s=string(s, "\n Parent : ", parent(connected_node1)==nothing)





"""Test du constructeur lorsqu'un noeud est son propre parent"""
connected_node2=ConnectedNode(2,0)

s=string(s, "\n\n\n Test constructeur lorsqu'un noeud est son propre parent")
s=string(s, "\n Id : ", id(connected_node2)==2)
s=string(s, "\n data : ", data(connected_node2)==0)
s=string(s, "\n Parent : ", parent(connected_node2)==nothing)






"""Test du constructeur à partir d'un noeud"""
node3=Node(3,0)
connected_node3=ConnectedNode(node3)

s=string(s, "\n\n\n Test constructeur à partir d'un noeud")
s=string(s, "\n Id : ", id(connected_node3)==3)
s=string(s, "\n data : ", data(connected_node3)==0)
s=string(s, "\n Parent : ", parent(connected_node3)==nothing)





"""Test de la fonction set_parent"""

set_parent!(connected_node3,connected_node2)

s=string(s, "\n\n\n Test set_parent")
s=string(s, "\n Parent : ", id(parent(connected_node3))==id(connected_node2))





"""Test de la fonction get_root"""

s=string(s, "\n\n\n Test get_root si la racine est la même que le connectedNode ")
s=string( s, "\n Racine du noeud 2  : ", id(get_root(connected_node2))==id(connected_node2))

s=string(s, "\n\n\n Test get_root si la racine est différente ")
s=string(s, "\n Racine du noeud 3  : ", id(get_root(connected_node3))==id(connected_node2))



"""Test de la fonction get_total_weight"""
my_node1 = Node(1,1)
my_node2 = Node(2,1)

edge1 = Edge(1, 2, 4)

graph_test=Graph("Graph_example",[my_node1,my_node2],[edge1])

s=string(s,"\n\n\n Test fonction get_total_weight : ", get_total_weight(graph_test)==4)

println(s)
