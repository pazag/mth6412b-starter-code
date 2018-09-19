include("node.jl")
include("edge.jl")
include("graph.jl")
include("read_stsp.jl")

"""Crée un graphe à partir d'un fichier tsp au format explicit.

Exemple :
        create_graph(filename)
"""
function create_graph(filename::String)

  nodes_dict, edges_list_list = read_stsp(filename)

  T = valtype(nodes_dict)
  graph_nodes = Node{T}[]

  for node_id in keys(nodes_dict)
    node = Node(string(node_id), nodes_dict[node_id])
    push!(graph_nodes, node)
  end


  edge_origin = 1
  graph_edges = Edge[]

  for edges_list in edges_list_list
      for edge_brut in edges_list
         edge = Edge(string(edge_origin), string(edge_brut[1]), edge_brut[2])
         push!(graph_edges, edge)
      end
      edge_origin+=1
  end

  graph = Graph(filename, graph_nodes, graph_edges)

end
