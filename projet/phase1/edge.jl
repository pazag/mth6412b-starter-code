import Base.show

"""Type représentant les aretes d'un graphe.

Exemple:

        arete = Edge("Ross", "Rachel", 1)
        arete = Node("Chandler", "Monica", 3.0)

"""
mutable struct Edge
    name_node1_::String
    name_node2_::String
    weight_::Number
end

"""Renvoie le poids de l'arête."""
weight(edge::Edge) = edge.weight_

"""Renvoie les sommets de l'arête."""
edge_nodes(edge::Edge)= edge.name_node1_, edge.name_node2_

"""Affiche une arête"""
function show(edge::Edge)
    s = string("Edge ", edge.name_node1_, " - " ,edge.name_node2_,  ", weight: ", edge.weight_ )
end
