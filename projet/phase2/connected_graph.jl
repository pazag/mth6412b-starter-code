"""Type representant un graphe connexe comme un ensemble de noeuds.

Attention, tous les noeuds doivent avoir des données de même type.
"""
mutable struct ConnectedGraph{T} <: AbstractGraph{T}
	name_::String
	nodes_::Vector{ConnectedNode{T}}
	edges_::Vector{Edge}
	id_root_::Int
end

function ConnectedGraph(name::String, nodes::Vector{ConnectedNode{T}},root::Int)
