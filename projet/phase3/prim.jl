include("../phase1/node.jl")
include("../phase1/edge.jl")
include("../phase1/graph.jl")

include("distance_node.jl")

"""Retourne un dictionnaire qui permet d'avoir la distance entre deux noeuds si l'arête est présente dans le graphe"""
function distance_between_node(g::AbstractGraph)
	dict_distance=Dict{Int64}{Dict{Int64}{Real}()}()
	for graph_edge in edges(graph)
		id1,id2=edge_nodes(graph_edge)
		dict_distance[id1][id2]=weight(graph_edge)
		dict_distance[id2][id1]=weight(graph_edge)
	end
	dict_distance
end


"""Renvoit l'arbre de poids minimal construit par l'algorithme de Prim"""
function prim(graph::AbstractGraph,s::AbstractNode{T}) where T

	"""Liste des arêtes de l'arbre"""
	list_edges=Edge[]

	"""Creation de la file d'attente avec priorite"""
	for node in nodes(graph)
		if(id(node)!=id(s))
			push!(q,PriorityItem(ConnectedNode(node),Inf) )
		else
			push!(q,PriorityItem(ConnectedNode(id(node),data(node),node),0) )
		end
	end

	dict_distance=distance_between_node(graph)

	q=PriorityQueue{PriorityItem{ConnectedNode}}()

	while not is_empty(q)
		u=data(poplast!(q))
		id(u)!=id(parent(u)) && push!(list_edges,Edge(id(u),id(parent(u))) """Attention a l'initialisation : Il y a une arête du noeud source vers lui même."""

		p=PriorityQueue{PriorityItem{ConnectedNode}}()

		while not is_empty(q)
			last_priority_item=poplast!(q)
			distance=priority(last_priority_item)
			v=data(last_priority_item)
			if haskey(dict_distance[id(u)],id(v))
				if dict_distance[id(u)][id(v)]<distance
					set_parent!(v,u)
					set_data!(last_priority_item,v)
					priority!(last_priority_item,dict_distance[id(u)][id(v)])
				end
			end
			push!(p,last_priority_item)
		q=p
	end


	g_name = string( "Prim : arbre de poids minimal de ", name(graph))
	list_node = nodes(graph)
    Graph(g_name, list_node, list_edges)

end
