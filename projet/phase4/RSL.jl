include("../phase1/node.jl")
include("../phase1/edge.jl")
include("../phase1/graph.jl")
include("../phase1/read_stsp.jl")
include("../phase1/create_graph.jl")

include("../phase3/prim.jl")
include("../phase3/heuristique_acceleration.jl")

include("dfs.jl")

function rsl(graph::AbstractGraph,
             s::AbstractNode{T}) where T
    #Creation de l'arbre de recouvrement de poids minimal
    mst = prim(graph,s)
    #Convertion des noeuds en markedNode
    list_marked_node = MarkedNode{T}[]
    for node in nodes(mst)
        marked_node = MarkedNode(node)
        push!(list_marked_node,marked_node)
    end
    mst = Graph(name(mst),list_marked_node,edges(mst))
    #Parcours de l'arbre en profondeur et création de la tournée
    tour = dfs(mst)
    #Creation du dictionnaire des arêtes du graph
    distance_matrix = distance_between_node(graph)
    for i in 1:nb_nodes(tour)-1
        id1=id(nodes(tour)[i])
        id2=id(nodes(tour)[i+1])
        # S'il n'y a pas d'arête dans le graph entre 2 noeuds de la tournée alors la tournée a un poids infini
        haskey(distance_matrix[id1],id2) ? weight = distance_matrix[id1][id2] : weight  = Inf
        add_edge!(tour,Edge(id1,id2,weight))
    end
    id1=id(nodes(tour)[1])
    id2=id(nodes(tour)[end])
    haskey(distance_matrix[id1],id2) ? weight = distance_matrix[id1][id2] : weight  = Inf
    add_edge!(tour,Edge(id1,id2,weight))
    tour
end
