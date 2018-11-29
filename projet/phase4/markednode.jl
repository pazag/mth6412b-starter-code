import Base.parent

include("../phase1/node.jl")

mutable struct MarkedNode{T} <: AbstractNode{T}
    id_::Int
    data_::T
    visited_::Bool
    prenum_::Int64
    parent_::Union{AbstractNode{T},Nothing}
end

"""
Constructeur 
"""
function MarkedNode(data::T; id::Int=0, prenum::Int64=0) where T
    MarkedNode(id, data, false, max(0, prenum), nothing)
end

"""
Constructeur vide
"""
function MarkedNode()
    MarkedNode(0, nothing, false, 0, nothing)
end

"""
Constructeur a partir d'un noeud de type Node
"""
function MarkedNode(node::Node)
    MarkedNode(id(node),data(node), false, 0, nothing)
end

visited(node::MarkedNode) = node.visited_
prenum(node::MarkedNode) = node.prenum_
parent(node::MarkedNode) = node.parent_

"""
Marque que le noeud a été visité
"""
function set_visited!(node::MarkedNode)
    node.visited_ = true
    node
end

"""
Modifie le prenum du noeud
"""
function set_prenum!(node::MarkedNode, d::Int64)
    node.prenum_ = max(0, d)
    node
end

"""
Modifie le parent du noeud
"""
function set_parent!(node::MarkedNode{T}, p::MarkedNode{T}) where T
    node.parent_ = p
    node
end

"""
Affiche le noeud
"""
function show(node::MarkedNode)
    return "node $(id(node)) at prenum $(prenum(node)), data: $(data(node))"
end
