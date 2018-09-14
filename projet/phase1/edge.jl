import Base.show

"""Type abstrait dont d'autres types de noeuds dériveront."""
abstract type AbstractEdge{T} end

"""Type représentant les arêtes d'un graphe

"""
mutable struct Edge{T} <: AbstractEdge{T}
    name_node1::String
    name_node2::String
    weight::T
end

# on présume que tous les noeuds dérivant d'AbstractNode
# posséderont des champs `name` et `data`.

"""Renvoie les donnees contenues dans l'arête."""
weight(edge::AbstractEdge) = edge.weight

"""Renvoie les sommets de l'arête."""
nodes(edge::AbstractEdge)= (edge.name_node1, edge.name_node2)

"""Affiche une arête"""
function show(edge::AbstractEdge)
    s = string("Edge ", edge.name_node1, " - " ,edge.name_node2,  ", weight: ", weight(edge) )
    println(s)
end
