import Base.show
include("node.jl")
include("edge.jl")

"""Type abstrait dont d'autres types de graphes dériveront."""
abstract type AbstractGraph{T} end

"""Type representant un graphe comme un ensemble de noeuds.

Exemple :

		node1 = Node("Joe", 3.14)
		node2 = Node("Steve", exp(1))
		node3 = Node("Jill", 4.12)
		arete = Edge("Joe", "Steve", 1)
		G = Graph("Ick", [node1, node2, node3], [arete])

Attention, tous les noeuds doivent avoir des données de même type.
"""
mutable struct Graph{T} <: AbstractGraph{T}
	name_::String
	nodes_::Vector{Node{T}}
	edges_::Vector{Edge}
end

"""Ajoute un noeud au graphe.
Attention, si le noeud est déjà dans le graph, on ne fait rien."""
function add_node!(graph::Graph{T}, node::Node{T}) where T
	push!(graph.nodes_, node)
	graph
end

"""Ajoute une arête au graphe.
Attention, les noeuds de l'arete doivent être dans le graph"""
function add_edge!(graph::Graph{T}, edge::Edge) where T
	node1_in_graph = false
	node2_in_graph = false
	id_node1, id_node2 = edge_nodes(edge)
	for node in nodes(graph)
		if id(node) == id_node1
			node1_in_graph = true
		end
		if id(node) == id_node2
			node2_in_graph = true
		end
	end
	node_not_in_graph = "The nodes are not in the graph, add the nodes in the graph before adding the edge"
	node1_in_graph && node2_in_graph ? push!(graph.edges_, edge) : throw(node_not_in_graph)
	graph
end

# on présume que tous les graphes dérivant d'AbstractGraph
# posséderont des champs `name` et `nodes`.

"""Renvoie le nom du graphe."""
name(graph::AbstractGraph) = graph.name_

"""Renvoie la liste des noeuds du graphe."""
nodes(graph::AbstractGraph) = graph.nodes_

"""Renvoie le nombre de noeuds du graphe."""
nb_nodes(graph::AbstractGraph) = length(graph.nodes_)

"""Renvoie la liste des arêtes du graphe."""
edges(graph::AbstractGraph) = graph.edges_

"""Renvoie le nombre d'arêtes du graphe."""
nb_edges(graph::AbstractGraph) = length(graph.edges_)

"""Affiche un graphe"""
function show(graph::Graph)
	graph_nb_nodes = nb_nodes(graph)
	graph_nb_edges = nb_edges(graph)
	s = string("Graph ", graph.name_, " has ", graph_nb_nodes, " nodes and " , graph_nb_edges," edges." )
	if graph_nb_nodes > 0
		s = string(s,"\n NODES")
		for node in graph.nodes_
			s = string(s, "\n", show(node))
		end
	end
	if graph_nb_edges > 0
		s = string(s,"\n EDGES")
		for edge in graph.edges_
			s=string(s,"\n", show(edge))
		end
	end
	println(s)
end
