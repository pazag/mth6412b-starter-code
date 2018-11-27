include("../phase1/node.jl")
include("../phase1/edge.jl")
include("../phase1/graph.jl")

include("../phase2/connected_node.jl")

include("priority_item.jl")
include("priority_queue.jl")



"""Retourne un dictionnaire qui permet d'avoir la distance entre deux noeuds si l'arête est présente dans le graphe"""
function distance_between_node(g::AbstractGraph)
	dict_distance = Dict{Int64,Dict{Int64,Float64}}()

	for node in nodes(g)
		dict_distance[id(node)]=Dict{Int64,Float64}()
	end

	for graph_edge in edges(g)
		id1,id2 = edge_nodes(graph_edge)
		dict_distance[id1][id2]=weight(graph_edge)
		dict_distance[id2][id1]=weight(graph_edge)
	end
	dict_distance
end

"""Renvoit l'arbre de recouvrement de poids minimal construit par l'algorithme de Prim"""
function prim(graph::AbstractGraph,s::AbstractNode)

	"""Liste des arêtes de l'arbre"""
	list_edges=Edge[]


	q=PriorityQueue{PriorityItem}()
	"""Creation de la file d'attente avec priorite"""
	for node in nodes(graph)
		if(id(node)!=id(s))
			push!(q,PriorityItem(ConnectedNode(node),Inf) )
		else
			push!(q,PriorityItem(ConnectedNode(node),0) )
		end
	end

	dict_distance = distance_between_node(graph)



	while !is_empty(q)
		u = data(poplast!(q))
		parent(u) != nothing && push!(list_edges,Edge(id(u),id(parent(u)),dict_distance[id(u)][id(parent(u))]))

		p = PriorityQueue{PriorityItem}()

		while !is_empty(q)
			last_priority_item = poplast!(q)
			distance = priority(last_priority_item)
			v = data(last_priority_item)
			if haskey(dict_distance[id(u)],id(v))
				if dict_distance[id(u)][id(v)]<distance
					set_parent!(v,u)
					set_data!(last_priority_item,v)
					priority!(last_priority_item,dict_distance[id(u)][id(v)])
				end
			end
			push!(p,last_priority_item)
		end
		q=p
	end

	g_name = string( "Prim : arbre de poids minimal de ", name(graph))
	list_node = nodes(graph)
    Graph(g_name, list_node, list_edges)

end
