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
graph_1 = create_graph(file_to_open)
rsl_1 = rsl(graph_1,nodes(graph_1)[1]);
hk_1 = hk(graph_1,nodes(graph_1)[2],use_prim=true,max_iter=10000);


filename="bays29.tsp"
file_to_open=string(path,filename)
graph_2=create_graph(file_to_open)
rsl_2 = rsl(graph_2,nodes(graph_2)[1]);
hk_2 = hk(graph_2,nodes(graph_2)[2],use_prim=true,max_iter=10000);


filename="dantzig42.tsp"
file_to_open=string(path,filename)
println(filename)
graph_3=create_graph(file_to_open)
rsl_3 = rsl(graph_3,nodes(graph_3)[1]);
hk_3 = hk(graph_3,nodes(graph_3)[2],use_prim=true,max_iter=10000);



filename="gr120.tsp"
file_to_open=string(path,filename)
println(filename)
graph_4=create_graph(file_to_open)
rsl_4 = rsl(graph_4,nodes(graph_4)[1]);
hk_4 = hk(graph_4,nodes(graph_4)[2],use_prim=true,max_iter=1000);



filename="pa561.tsp"
file_to_open=string(path,filename)
println(filename)
graph_5=create_graph(file_to_open)
rsl_5 = rsl(graph_5,nodes(graph_5)[1]);
hk_5 = hk(graph_5,nodes(graph_5)[2],use_prim=true,max_iter=100);



println("\n\n")
println("bayg29.tsp")
println("Poids tournée RSL : ", get_total_weight(rsl_1) )
println("Poids tournée HK : ", get_total_weight(hk_1) )

println("\n\n")
println("bays29.tsp")
println("Poids tournée RSL : ", get_total_weight(rsl_2) )
println("Poids tournée HK : ", get_total_weight(hk_2) )

println("\n\n")
println("dantzig42.tsp")
println("Poids tournée RSL : ", get_total_weight(rsl_3) )
println("Poids tournée HK : ", get_total_weight(hk_3) )

println("\n\n")
println("gr120.tsp")
println("Poids tournée RSL : ", get_total_weight(rsl_4) )
println("Poids tournée HK : ", get_total_weight(hk_4) )

println("\n\n")
println("pa561.tsp")
println("Poids tournée RSL : ", get_total_weight(rsl_5) )
println("Poids tournée HK : ", get_total_weight(hk_5) )
