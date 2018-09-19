include("node.jl")
include("edge.jl")
include("graph.jl")
include("read_stsp.jl")
include("create_graph.jl")


path="../../instances/stsp/"
filename="bays29.tsp"

create_graph(path+filename)
