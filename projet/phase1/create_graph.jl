include("node.jl")
include("edge.jl")
include("graph.jl")
include("read_stsp.jl")
include("../phase5/read_stsp_phase5.jl")

"""Crée un graphe à partir d'un fichier tsp au format explicit.
Exemple :
        create_graph(filename)
"""
function create_graph(filename::String)

  nodes_dict, edges_list_list = read_stsp(filename)

  graph_nodes = []
  number_nodes=length(edges_list_list[1])+1

  if (length(nodes_dict)==0)
    graph_nodes=AbstractNode{Array{Float64,1}}[]

    for i in 1:number_nodes
      push!(graph_nodes,Node(i,[0.0,0.0]))
    end
  else
    T = valtype(nodes_dict)
    graph_nodes = AbstractNode{T}[]
    for node_id in keys(nodes_dict)
      node = Node(node_id, nodes_dict[node_id])
      push!(graph_nodes, node)
    end
  end


  edge_origin = 1
  graph_edges = Edge[]

  for edges_list in edges_list_list
      for edge_brut in edges_list
         edge = Edge(edge_origin, edge_brut[1], edge_brut[2])
         push!(graph_edges, edge)
      end
      edge_origin+=1
  end

  graph = Graph(filename, graph_nodes, graph_edges)

end
