import Base.show

"""Type abstrait dont d'autres types de noeuds dériveront."""
abstract type AbstractEdge{T} end

"""Type représentant les arêtes d'un graphe

"""
mutable struct Edge{T} <: AbstractEdge{T}
    name::String
    node1::AbstractNode{T}
    node2::AbstractNode{T}
    weight::Float64
end

# on présume que tous les noeuds dérivant d'AbstractNode
# posséderont des champs `name` et `data`.

"""Renvoie le nom de l'arête."""
name(edge::AbstractEdge) = edge.name

"""Renvoie les donnees contenues dans l'arête."""
weight(edge::AbstractEdge) = edge.weight

"""Renvoie les sommets de l'arête."""
nodes(edge::AbstractEdge)= (edge.node1, edge.node2)

"""Affiche une arête"""
function show(edge::AbstractEdge)
    s = string("Edge ", name(edge), ", weight: ", weight(edge),", node : ",name(edge.node1) ", ",name(edge.node2) )
    println(s)
end
