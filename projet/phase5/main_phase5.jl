include("tools.jl")
include("../phase1/node.jl")
include("../phase1/edge.jl")
include("../phase1/graph.jl")
include("../phase1/read_stsp.jl")
include("../phase1/create_graph.jl")

include("../phase3/prim.jl")
include("../phase3/heuristique_acceleration.jl")

include("../phase4/RSL.jl")
include("../phase4/HK.jl")

"""Returns the tour"""
function get_tour(graph::AbstractGraph)
    tour=Int[]
    nodes_graph=nodes(graph)
    #index_1 = findall(x->id(x)==1,nodes_graph)[1]
    # for node in nodes_graph[index_1+1:end]
    #     push!(tour,id(node))
    # end
    #
    # for node in nodes_graph[index_1-1:-1:1]
    #     push!(tour,id(node))
    # end

    for node in nodes_graph[1:end]
        push!(tour,id(node))
    end
    tour
end

path = "../../instances/images/"

################################################################################
filename = "abstract-light-painting.tsp"
file_to_open = string(path,filename)
graph_1 = create_graph(file_to_open)
hk_1 = hk(graph_1,nodes(graph_1)[1],use_prim=true,max_iter=1000);
tour_1 =get_tour(hk_1)
cost_1 =get_total_weight(hk_1)
write_tour(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    tour_1,
                    cost_1)
@info("reconstruct picture")
reconstruct_picture(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    string(split(string("images/shuffled/",filename),".")[1],".png"),
                    string(split(string("homemade-reconstructed/",filename),".")[1],".png"),
                    b_view=false)

################################################################################
filename = "alaska-railroad.tsp"
file_to_open = string(path,filename)
graph_1 = create_graph(file_to_open)
hk_1 = hk(graph_1,nodes(graph_1)[1],use_prim=true,max_iter=1000);
tour_1 =get_tour(hk_1)
cost_1 =get_total_weight(hk_1)
write_tour(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    tour_1,
                    cost_1)
@info("reconstruct picture")
reconstruct_picture(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    string(split(string("images/shuffled/",filename),".")[1],".png"),
                    string(split(string("homemade-reconstructed/",filename),".")[1],".png"),
                    b_view=false)

################################################################################
filename = "blue-hour-paris.tsp"
file_to_open = string(path,filename)
graph_1 = create_graph(file_to_open)
hk_1 = hk(graph_1,nodes(graph_1)[1],use_prim=true,max_iter=1000);
tour_1 =get_tour(hk_1)
cost_1 =get_total_weight(hk_1)
write_tour(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    tour_1,
                    cost_1)
@info("reconstruct picture")
reconstruct_picture(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    string(split(string("images/shuffled/",filename),".")[1],".png"),
                    string(split(string("homemade-reconstructed/",filename),".")[1],".png"),
                    b_view=false)

################################################################################
filename = "lower-kananaskis-lake.tsp"
file_to_open = string(path,filename)
graph_1 = create_graph(file_to_open)
hk_1 = hk(graph_1,nodes(graph_1)[1],use_prim=true,max_iter=1000);
tour_1 =get_tour(hk_1)
cost_1 =get_total_weight(hk_1)
write_tour(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    tour_1,
                    cost_1)
@info("reconstruct picture")
reconstruct_picture(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    string(split(string("images/shuffled/",filename),".")[1],".png"),
                    string(split(string("homemade-reconstructed/",filename),".")[1],".png"),
                    b_view=false)

################################################################################
filename = "marlet2-radio-board.tsp"
file_to_open = string(path,filename)
graph_1 = create_graph(file_to_open)
hk_1 = hk(graph_1,nodes(graph_1)[1],use_prim=true,max_iter=1000);
tour_1 =get_tour(hk_1)
cost_1 =get_total_weight(hk_1)
write_tour(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    tour_1,
                    cost_1)
@info("reconstruct picture")
reconstruct_picture(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    string(split(string("images/shuffled/",filename),".")[1],".png"),
                    string(split(string("homemade-reconstructed/",filename),".")[1],".png"),
                    b_view=false)

################################################################################
filename = "nikos-cat.tsp"
file_to_open = string(path,filename)
graph_1 = create_graph(file_to_open)
hk_1 = hk(graph_1,nodes(graph_1)[1],use_prim=true,max_iter=1000);
tour_1 =get_tour(hk_1)
cost_1 =get_total_weight(hk_1)
write_tour(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    tour_1,
                    cost_1)
@info("reconstruct picture")
reconstruct_picture(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    string(split(string("images/shuffled/",filename),".")[1],".png"),
                    string(split(string("homemade-reconstructed/",filename),".")[1],".png"),
                    b_view=false)

################################################################################
filename = "pizza-food-wallpaper.tsp"
file_to_open = string(path,filename)
graph_1 = create_graph(file_to_open)
hk_1 = hk(graph_1,nodes(graph_1)[1],use_prim=true,max_iter=1000);
tour_1 =get_tour(hk_1)
cost_1 =get_total_weight(hk_1)
write_tour(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    tour_1,
                    cost_1)
@info("reconstruct picture")
reconstruct_picture(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    string(split(string("images/shuffled/",filename),".")[1],".png"),
                    string(split(string("homemade-reconstructed/",filename),".")[1],".png"),
                    b_view=false)

################################################################################
filename = "the-enchanted-garden.tsp"
file_to_open = string(path,filename)
graph_1 = create_graph(file_to_open)
hk_1 = hk(graph_1,nodes(graph_1)[1],use_prim=true,max_iter=1000);
tour_1 =get_tour(hk_1)
cost_1 =get_total_weight(hk_1)
write_tour(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    tour_1,
                    cost_1)
@info("reconstruct picture")
reconstruct_picture(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    string(split(string("images/shuffled/",filename),".")[1],".png"),
                    string(split(string("homemade-reconstructed/",filename),".")[1],".png"),
                    b_view=false)
################################################################################
filename = "tokyo-skytree-aerial.tsp"
file_to_open = string(path,filename)
graph_1 = create_graph(file_to_open)
hk_1 = hk(graph_1,nodes(graph_1)[1],use_prim=true,max_iter=1000);
tour_1 =get_tour(hk_1)
cost_1 =get_total_weight(hk_1)
write_tour(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    tour_1,
                    cost_1)
@info("reconstruct picture")
reconstruct_picture(string(split(string("homemade-tour/",filename),".")[1],".tour"),
                    string(split(string("images/shuffled/",filename),".")[1],".png"),
                    string(split(string("homemade-reconstructed/",filename),".")[1],".png"),
                    b_view=false)
