include("../phase2/kruskal.jl")

"""Renvoie un arbre de recouvrement minimal en utilisant l'algorithme de Kruskal
"""
function heuristique_union_rang(graph::AbstractGraph)

    old_edges_list = edges(graph)
	edges_list=sort_edges!(old_edges_list)
    dict_c_node = dict_connected_composant(graph)

    k = 0
	i = 1
    A_k = Edge[]

    while k< nb_nodes(graph)-1
	 	e = edges_list[i]
        id_node1, id_node2 = edge_nodes(e)

        root1 = get_root(dict_c_node[id_node1])
		rg1 = rang(root1)
        root2 = get_root(dict_c_node[id_node2])
		rg2 = rang(root2)

        if root1 != root2
            push!(A_k,e)
            if rg1 > rg2
				set_parent!(dict_c_node[id(root1)],root2)
			else
				set_parent!(dict_c_node[id(root2)],root1)
			end
			if rg1 == rg2
				set_rang!(dict_c_node[id(root1)], rg1 + 1)
			end
            k=k+1
        end

		i=i+1
    end
	g_name = string( "Arbre de poids minimal de ", name(graph))
	list_node = nodes(graph)
    Graph(g_name, list_node, A_k)
end

"""Fourni la racine de la composante connexe en compressant le chemin de recherche"""
function get_root_compression(connected_node::ConnectedNode)
    node = connected_node
    parent = connected_node.parent_
	chemin_recherche = [node]
    while parent != nothing
		node = parent
        parent = node.parent_
		push!(chemin_recherche,node)
    end
	for n in chemin_recherche
		id(n)!=id(node) && set_parent!(n,node)
	end
    return node
end

"""Renvoie un arbre de recouvrement minimal en utilisant l'algorithme de Kruskal
"""
function heuristique_compression_chemin(graph::AbstractGraph)

    old_edges_list = edges(graph)
	edges_list=sort_edges!(old_edges_list)
    dict_c_node = dict_connected_composant(graph)

    k = 0
	i = 1
    A_k = Edge[]

    while k< nb_nodes(graph)-1
	 	e = edges_list[i]
        id_node1, id_node2 = edge_nodes(e)

        root1 = get_root_compression(dict_c_node[id_node1])
        root2 = get_root_compression(dict_c_node[id_node2])
        if root1!=root2
            push!(A_k,e)
            set_parent!(dict_c_node[id(root1)],root2)
            k=k+1
        end

		i=i+1
    end
	g_name = string( "Arbre de poids minimal de ", name(graph))
	list_node = nodes(graph)
    Graph(g_name, list_node, A_k)
end
