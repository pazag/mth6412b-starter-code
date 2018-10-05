include("connected_node.jl")
include("../phase1/graph.jl")

"""On fournit un dictionnaire avce les noeuds du graphe
"""
function Intitialisation_kruskal(g::AbstractGraph{T}) where T
	list_nodes = nodes(g)
	dict_node  = Dict{Int}{ConnectedNode{T}}()
	for node in list_nodes
		c_node = ConnectedNode(node)
		dict_node[id(c_node)]=c_node
	end
	dict_node
end

function kruskal(graph::AbstractGraph)

    old_edges_list = edges(graph)
	edges_list=sort_edges!(old_edges_list)
    dict_c_node = Intitialisation_kruskal(graph)

    k = 0
	i = 1
    A_k = Edge[]

    while k< nb_nodes(graph)-1
	 	e = edges_list[i]
        id_node1, id_node2 = edge_nodes(e)

        root1 = get_root(dict_c_node[id_node1])
        root2 = get_root(dict_c_node[id_node2])
        if root1!=root2
            push!(A_k,e)
            set_parent!(dict_c_node[id(root1)],root2)
            k=k+1
        end

		i=i+1
    end
	g_name = name(graph)
	list_node = nodes(graph)
    Graph(g_name, list_node, A_k)
end
