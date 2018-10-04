import Base.show

abstract type AbstractEdge end

"""Type représentant les aretes d'un graphe.

Exemple:

        arete = Edge("Ross", "Rachel", 1)
        arete = Node("Chandler", "Monica", 3.0)

"""
mutable struct Edge <: AbstractEdge
    id_node1_::Int
    id_node2_::Int
    weight_::Real
end

"""Renvoie le poids de l'arête."""
weight(edge::Edge) = edge.weight_

"""Renvoie les sommets de l'arête."""
edge_nodes(edge::Edge)= edge.id_node1_, edge.id_node2_

"""Affiche une arête"""
function show(edge::Edge)
    s = string("Edge ", edge.id_node1_, " - " ,edge.id_node2_,  ", weight: ", edge.weight_ )
end

"""Trie une liste d'arête par ordre de poids croissant"""
function sort_edges!(edges_list)
    edges_list = sort(edges_list, by = weight)
end
