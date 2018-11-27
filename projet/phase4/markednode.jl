import Base.parent

include("../phase1/node.jl")

mutable struct MarkedNode{T} <: AbstractNode{T}
    id_::Int
    data_::T
    visited_::Bool
    prenum_::Int64
    parent_::Union{AbstractNode{T},Nothing}
end

function MarkedNode(data::T; id::Int=0, prenum::Int64=0) where T
    MarkedNode(id, data, false, max(0, prenum), nothing)
end

function MarkedNode()
    MarkedNode(0, nothing, false, 0, nothing)
end

function MarkedNode(node::Node)
    MarkedNode(id(node),data(node), false, 0, nothing)
end

visited(node::MarkedNode) = node.visited_
prenum(node::MarkedNode) = node.prenum_
parent(node::MarkedNode) = node.parent_

function set_visited!(node::MarkedNode)
    node.visited_ = true
    node
end

function set_prenum!(node::MarkedNode, d::Int64)
    node.prenum_ = max(0, d)
    node
end

function set_parent!(node::MarkedNode{T}, p::MarkedNode{T}) where T
    node.parent_ = p
    node
end

function show(node::MarkedNode)
    return "node $(id(node)) at prenum $(prenum(node)), data: $(data(node))"
end
