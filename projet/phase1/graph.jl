import Base.show

"""Type abstrait dont d'autres types de graphes dériveront."""
abstract type AbstractGraph{T} end

"""Type representant un graphe comme un ensemble de noeuds.

Exemple :

		node1 = Node("Joe", 3.14)
		node2 = Node("Steve", exp(1))
		node3 = Node("Jill", 4.12)
		G = Graph("Ick", [node1, node2, node3])

Attention, tous les noeuds doivent avoir des données de même type.
"""
mutable struct Graph{T} <: AbstractGraph{T}
	name::String
	nodes::Vector{Node{T}}
	edges::Vector{Edge{T}}
end

"""Ajoute un noeud au graphe."""
function add_node!(graph::Graph{T}, node::Node{T}) where T
	push!(graph.nodes, node)
	graph
end

"""Ajoute une arête au graphe.
Si les noeuds ne sont pas dans le graphe, on les ajoute.
"""
function add_edge!(graph::Graph{T}, edge::Edge{T}) where T
	nodes=graph.nodes
	(node1,node2)=nodes(edge)
	if !(node1 in nodes)
		add_node!(graph,node1)
	end
	if !(node2 in nodes)
		add_node!(graph,node2)
	end
	push!(graph.edges, edge)
	graph
end

# on présume que tous les graphes dérivant d'AbstractGraph
# posséderont des champs `name` et `nodes`.

"""Renvoie le nom du graphe."""
name(graph::AbstractGraph) = graph.name

"""Renvoie la liste des noeuds du graphe."""
nodes(graph::AbstractGraph) = graph.nodes

"""Renvoie le nombre de noeuds du graphe."""
nb_nodes(graph::AbstractGraph) = length(graph.nodes)

"""Renvoie la liste des arêtes du graphe."""
edges(graph::AbstractGraph) = graph.edges

"""Renvoie le nombre d'arêtes du graphe."""
nb_edges(graph::AbstractGraph) = length(graph.edges)

"""Affiche un graphe"""
function show(graph::Graph)
	name = name(graph)
	graph_nb_nodes = nb_nodes(graph)
	graph_nb_edges=nb_edges(graph)
	s = string("Graph ", name, " has ", graph_nb_nodes, " nodes and " , graph_nb_edges,"edges." )
	s=string(s,"\n NODES")
	for node in nodes(graph)
		s = string(s, "\n", show(node))
	end
	s=string(s,"\n EDGES")
	for edge in edges(graph)
		s=string(s,"\n", show(edge))
	println(s)
end
