
function create_graph(filename::String)
  graph=Graph(filename, Node{Number}[],Edge{Number}[])
  node_dict,edge_list=read_stsp(filename)
  for node_id in keys(node_dict)
    node=Node(node_id,node_dict[node_id])
    add_node!(graph,node)
  end
  edge_origin=1
  for list_edge in list_list_edge
      for edge_brut in list_edge
         edge=Edge(edge_origin,edge_brut[1],edge_brut[2])
         add_edge!(graph,edge)
      end
      edge_origin+=1
  end
  graph
end
    
  
  
