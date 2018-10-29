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
function prim(graph::AbstractGraph,s::DistanceNode{T}) where T

	"""Liste des arêtes de l'arbre"""
	list_edges=Edge[] 

	set_distance!(s,0)	
	set_parent!(s,s)

	q=PriorityQueue{DistanceNode{T}}()
	push!(q,PriorityItem(s,0))


	while not is_empty(q)
		u=poplast!(q)
		push!(list_edges,Edge(id(u),id(parent(u))) """Attention a l'initialisation : Il y a une arête du noeud source vers lui même."""

		for v in neighbours(G,u) """Fonction a créer"""
			if parent(v)==nothing 
				parent(v)=u
				distance=dict_distance[id(u)][id(v)]
				set_distance!(v,distance)
				q.push!(PriorityItem(v,distance))
			else
				"""J'arrive pas a modifier un element deja present dans la file"""
				if dict_distance[id(u)][id(v)]<distance(v)
					set_parent!(v,u)
					distance=dict_distance[id(u)][id(v)]


	end

	
	g_name = string( "Prim : arbre de poids minimal de ", name(graph))
	list_node = nodes(graph)
    Graph(g_name, list_node, list_edges)

end

