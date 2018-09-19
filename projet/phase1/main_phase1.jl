include("node.jl")
include("edge.jl")
include("graph.jl")
include("read_stsp.jl")
include("create_graph.jl")


path="../../instances/stsp/"
filename="bays29.tsp"

file_to_open=string(path,filename)

header=read_header(file_to_open)

read_edges(header,file_to_open)

read_stsp(file_to_open)

graph=create_graph(file_to_open)

show(graph)
