include("connected_node.jl")
include("../phase1/graph.jl")

function kruskal(graph::AbstractGraph)

    edges_list = edges(graph)
    nodes_list = nodes(graph)
    dict_connected_node = Dict{Int}{ConnectedNode{T}} where T

    k = 0
    A_k = Edge[]

    while k<10000
        
        for e in edges_list
            id_node1, id_node2 = nodes(e)

            root1 = get_root(dict_connected_node[name_node_1])
            root2 = get_root(dict_connected_node[name_node_2])
            if root1!=root2
                push!(A_k,e)
                set_parent!(dict_connected_node[name(root1)],root2)
                k=k+1
            end
        end
    end
    A_k

end
