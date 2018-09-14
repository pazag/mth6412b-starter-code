
function create_graph(filename::String)
  graph=Graph(filename, Node{Number}[],Edge{Number}[])
  node_dict,edge_list=read_stsp(filename)
  for node_id in keys(node_dict)
    node=Node(node_id,node_dict[node_id])
    add_node!(graph,node)
  edge_origin=1
  for edge_brut in edge_list
      node_1=Node(edge_origin,node_dict[edge_origin])
      for edge_ in edge_brut
         node2=Node(edge_[1],node_dict[edge_[1])
         edge=Edge(e
    
  
  
