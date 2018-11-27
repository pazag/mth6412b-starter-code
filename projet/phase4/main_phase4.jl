include("../phase1/node.jl")
include("../phase1/edge.jl")
include("../phase1/graph.jl")
include("../phase1/read_stsp.jl")
include("../phase1/create_graph.jl")

include("../phase3/prim.jl")
include("../phase3/heuristique_acceleration.jl")

include("RSL.jl")
include("HK.jl")

path = "../../instances/stsp/"
filename = "bayg29.tsp"
file_to_open = string(path,filename)
println(filename)
graph_1 = create_graph(file_to_open)
rsl_1 = rsl(graph_1,nodes(graph_1)[1]);
println("Poids tournée RSL : ", get_total_weight(rsl_1) )
hk_1 = hk(graph_1,nodes(graph_1)[2],use_prim=true,max_iter=10000);
println("Poids tournée HK : ", get_total_weight(hk_1) )

filename="bays29.tsp"
file_to_open=string(path,filename)
println(filename)
graph_2=create_graph(file_to_open)


filename="dantzig42.tsp"
file_to_open=string(path,filename)
println(filename)
graph_3=create_graph(file_to_open)



filename="gr120.tsp"
file_to_open=string(path,filename)
println(filename)
graph_4=create_graph(file_to_open)



filename="pa561.tsp"
file_to_open=string(path,filename)
println(filename)
graph_5=create_graph(file_to_open)
