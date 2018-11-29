include("markednode.jl")

"""
Exploration en profondeur récursive attribuant un prénum à chaque noeud visité.
Le graphe renvoyé contient seulement les noeuds de la tournée dans l'ordre dans lequel ils doivent être visité
"""
function dfs(G::Graph{T}) where T
    k = 1
    dict_distance = distance_between_node(G)
    tour_graph = Graph()
    for node in nodes(G)
        if !visited(node)
            k,tour_graph = dfs_visit(G, node, k, tour_graph, dict_distance)
        end
    end
    #Ajout de la derniere arête
    # weight = dict_distance[ id(nodes(tour_graph)[1]) ][ id(nodes(tour_graph)[end]) ]
    # edge=Edge(id(nodes(tour_graph)[1] ),id(nodes(tour_graph)[end]),weight)
    # add_edge!(tour_graph,edge)
    return tour_graph
end

"""
Fonction auxilliaire de la fonction récursive dfs
Ne doit pas être appelée en dehors de dfs
"""
function dfs_visit(G::Graph{T},
                   node::MarkedNode{T},
                   k::Int,
                   tour_graph::AbstractGraph,
                   dict_distance::Dict{Int64,Dict{Int64,Float64}}) where T

    set_visited!(node)  # node devient la racine d'une nouvelle arborescence
    set_prenum!(node,k)
    #Rajout des noeuds et arêtes dans la tournee
    if (k==1)
        tour_graph = Graph(string("tour ",name(G)),[node],Edge[])
    # else
    #     weight=dict_distance[id(node)][id(nodes(tour_graph)[end-1])]
    #     edge=Edge(id(node),id(nodes(tour_graph)[end-1]),weight)
    #     add_edge!(tour_graph,edge)
    else
        add_node!(tour_graph,node)
    end
    k=k+1
    indices_neighbors = findall(v -> haskey(dict_distance[id(node)],id(v)),nodes(G))
    for neighbor in nodes(G)[indices_neighbors]
        visited(neighbor) && continue
        set_parent!(neighbor, node)
        k, tour_graph = dfs_visit(G, neighbor,k,tour_graph,dict_distance)
    end
    return k, tour_graph
end
