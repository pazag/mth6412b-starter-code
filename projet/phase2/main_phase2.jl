include("../phase1/node.jl")
include("../phase1/edge.jl")
include("../phase1/graph.jl")
include("../phase1/read_stsp.jl")
include("../phase1/create_graph.jl")
include("kruskal.jl")

path="instances/stsp/"
filename="bays29.tsp"

file_to_open=string(path,filename)

header=read_header(file_to_open)

read_edges(header,file_to_open)

read_stsp(file_to_open)

graph=create_graph(file_to_open)

kruskal_graph=kruskal(graph)

show(kruskal_graph)
