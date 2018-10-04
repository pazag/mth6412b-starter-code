import Base.show

"""Type abstrait dont d'autres types de noeuds dériveront."""
abstract type AbstractNode{T} end

"""Type représentant les noeuds d'un graphe.

Exemple:

        noeud = Node("James", [π, exp(1)])
        noeud = Node("Kirk", "guitar")
        noeud = Node("Lars", 2)

"""
mutable struct Node{T} <: AbstractNode{T}
    id_::Int
    data_::T
end

# on présume que tous les noeuds dérivant d'AbstractNode
# posséderont des champs `name` et `data`.

"""Renvoie le nom du noeud."""
id(node::AbstractNode) = node.id_

"""Renvoie les donnees contenues dans le noeud."""
data(node::AbstractNode) = node.data_

"""Affiche un noeud"""
function show(node::AbstractNode)
    s = string("Node ", name(node), ", data: ", data(node))
end
