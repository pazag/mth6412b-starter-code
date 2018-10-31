include("../phase2/connected_node.jl")

"""Type représentant les noeuds avec une distance
"""

mutable struct DistanceNode{T} <: ConnectedNode{T}
    id_::Int
    data_::T
    parent_::Union{AbstractNode,Nothing}
    distance_::Union{Real,Inf}
end




"""Renvoie la distance du noeud"""
distance(distance_node::DistanceNode) = distance_node.distance_

"""Réaffecte la distance du noeud."""
function set_distance!(distance_node::DistanceNode, new_distance::Union{Real,Inf})
    distance_node.distance_ = new_distance
end
