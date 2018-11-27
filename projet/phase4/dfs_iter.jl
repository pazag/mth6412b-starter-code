include("stack.jl")

"""
Parcours du graph en préordre en attribuant à chaque noeud son prénum.
"""

function dfs_iter(G::Graph{T})
    k=1
    for node in nodes(G)
        visited(node) || k = dfs_visit_iter(G, node, k, rsl)
    end
    return
end

function dfs_visit_iter(G::Graph{T}, node::MarkedNode{T}, k::Int64, rsl::AbstractGraph)
    s = Stack{MarkedNode{T}}()
    push!(s, node)

    while not is_empty(s)
        u = pop!(s)
        set_visited!(u)
        set_prenum!(u,k)
        k = k+1

        for neighbor in neighbors(G, u)
            visited(neighbor) || push!(s, neighbor)
        end
    end
    return k
end
