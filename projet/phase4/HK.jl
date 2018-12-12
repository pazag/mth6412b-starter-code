include("../phase2/kruskal.jl")
include("../phase3/prim.jl")
include("RSL.jl")

"""
Cree un one tree.
- Si le booleen est true, le mst est généré avec l'algorithme de prim, sinon, avec l'algorithme de Kruskal.
- La racine ne doit pas être le premier noeud car on l'enlève pour faire le one tree.
"""
function create_one_tree(graph::AbstractGraph,
                         root::AbstractNode{T};
                         use_prim::Bool=true) where T

    mst_nodes = copy(nodes(graph))
    mst_edges = copy(edges(graph))
    # On enlève un noeud du graph pour construire un spanning tree sur les n-1 noeuds restant

    #Choix du noeud qui permettra de former le cycle dans le one tree
    index_keep=2:nb_nodes(graph)
    chosen_node = mst_nodes[1]
    mst_nodes=mst_nodes[index_keep]

    # On enlève les arêtes incidentes à ce noeud
    index_remove = findall(edge->edge_id1(edge)==id(chosen_node)||edge_id2(edge)==id(chosen_node),mst_edges)
    chosen_edges = mst_edges[index_remove]
    mst_edges = deleteat!(mst_edges, index_remove)

    # On crée le graph sur lequel on appliquera Prim ou Kruskal
    mst_graph = Graph("mst",mst_nodes,mst_edges)
    mst = Graph()

    # Pour le moment, on choisit le premier noeud en tant que racine. Il faudra avoir l'option de le choisir nous même
    use_prim ? mst = prim(mst_graph,root) : mst = kruskal(mst_graph)

    # Pour construire le 1-tree on rajoute le noeud enlevé au préalable
    add_node_bis!(mst,chosen_node)

    # Ainsi que les deux arêtes de poids minimum
    weights = map(edge->weight(edge),chosen_edges)
    (w1,indice1) = findmin(weights)
    weights[indice1] = Inf
    (w2,indice2) = findmin(weights)

    add_edge!(mst,chosen_edges[indice1])
    add_edge!(mst,chosen_edges[indice2])

    mst
end

"""
Fonction qui renvoit un vecteur de la taille du nombre de noeuds où chaque valeur correspond
au degré du noeud dont l'identifiant est l'indice dans le vecteur
"""
function nodes_degree(graph::AbstractGraph)
    n = nb_nodes(graph)
    dict = distance_between_node(graph)
    degree = zeros(n)
    for i in 1:n
        degree[i] = length(dict[i])
    end
    degree
end

"""
Renvoit un nouveau graphe avec des poids modifiés.
Le graphe initial reste inchangé
"""
function new_weights(graph::AbstractGraph,
                     pi_vect::Vector{Float64})

    #list_edges = copy(edges(graph))
    list_edges = Edge[]
    for edge in edges(graph)
        id1 = edge_id1(edge)
        id2 = edge_id2(edge)
        w = weight(edge) + pi_vect[id1] + pi_vect[id2]
        push!(list_edges,Edge(id1,id2,w))
        #weight!(edge,weight(edge)+pi_vect[edge_id1(edge)]+pi_vect[edge_id2(edge)])
    end
    Graph(name(graph),nodes(graph),list_edges)
end

"""
Renvoit un graphe qui correspond à une tournée construite par l'algorithme de HK.
- Si l'optimal n'est pas atteint après un certain nombre d'itérations, la tournée renvoyée
correspond à une tournée construite sur le dernier one tree avec l'algorithme de RSL.
- Si le booleen est true, les mst sont générés avec l'algorithme de prim, sinon, avec l'algorithme de Kruskal.
- La racine ne doit pas être le premier noeud car on l'enlève pour faire le one tree.
"""
function hk(graph::AbstractGraph,
            root::AbstractNode{T};
            use_prim::Bool = true,
            max_iter::Int64 = 1000) where T

    #Initialisation
    iter = 0
    t = 1
    pi_vect = zeros(nb_nodes(graph))

    #Construction du one-tree
    one_tree = create_one_tree(graph,root,use_prim=use_prim)
    d = nodes_degree(one_tree)
    v = d .-2

    opt = v == zeros(nb_nodes(one_tree))
    tired = iter>max_iter
    stop = tired || opt

    while !stop
        @info("iteraion HK : ", iter)

        #màj poids du one_tree
        pi_vect = pi_vect + t*v
        new_graph = new_weights(graph,pi_vect)
        one_tree = create_one_tree(new_graph, root, use_prim=use_prim)


        # mise à jour du critère d'arrêt
        d = nodes_degree(one_tree)
        v = d .-2
        opt = v == 0

        iter +=1
        t=1/sqrt(iter)
        tired = iter>max_iter
        stop = tired || opt
    end
    #Dictionnaire pour recuperer le vrai poids des arêtes dans notre tournee
    dict_distance=distance_between_node(graph)
    if (tired)


        rsl_nodes = copy(nodes(one_tree))
        rsl_edges = copy(edges(one_tree))
        rsl_graph = Graph("rsl",rsl_nodes,rsl_edges)
        rsl_graph = rsl(rsl_graph,nodes(rsl_graph)[1])

        for edge in edges(rsl_graph)
            id1=edge_id1(edge)
            id2=edge_id2(edge)
            weight!(edge,dict_distance[id1][id2])
        end
        println("Nb max d'itérations atteint")
        return rsl_graph
    else
        for edge in edges(one_tree)
            id1=edge_id1(edge)
            id2=edge_id2(edge)
            weight!(edge,dict_distance[id1][id2])
        end
        println("Tournée optimale")
        return one_tree
    end
end
