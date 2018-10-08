include("../phase1/node.jl")

"""Type représentant les noeuds connexes d'un graphe.

Exemple:

        noeud1 = Node("Paul", [1, 2], nothing)
        noeud2 = Node("Alice", [0, 7], noeud1)
        noeud3 = Node("Alexis", [4, 4], noeud1)

Par convention, si un noeud est son propre parent alors noeud.parent_ = nothing.
"""
mutable struct ConnectedNode{T} <: AbstractNode{T}
    id_::Int
    data_::T
    parent_::Union{AbstractNode,Nothing}
end

"""Constructeurs pour un noeud qui est son propre parent"""
function ConnectedNode(id::Int, data::T) where T
    ConnectedNode(id, data, nothing)
end

"""Constructeurs pour un noeud connecté à partir d'un noeud"""
function ConnectedNode(node::AbstractNode)
    ConnectedNode(id(node), data(node))
end

"""Renvoie le parent du noeud"""
parent(connected_node::ConnectedNode) = connected_node.parent_

"""Réaffecte le parent du noeud."""
function set_parent!(connected_node::ConnectedNode, new_parent::Union{AbstractNode,Nothing})
    connected_node.parent_ = new_parent
end

"""Fourni la racine de la composante connexe"""
function get_root(connected_node::ConnectedNode)
    node = connected_node
    parent = connected_node.parent_
    while parent != nothing
        node = parent
        parent = node.parent_
    end
    return node
end
