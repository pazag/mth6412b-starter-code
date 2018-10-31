include("queue.jl")
include("priority_item.jl")


"""File de priorité."""
	mutable struct PriorityQueue{T <: AbstractPriorityItem} <: AbstractQueue{T}
	items::Vector{T}
end

PriorityQueue{T}() where T = PriorityQueue(T[])

"""Retire et renvoie l'élément ayant la plus haute priorité."""
function popfirst!(q::PriorityQueue)
	highest = q.items[1]
	for item in q.items[2:end]
		if item > highest
			highest = item
		end
	end
	idx = findall(x -> x == highest, q.items)[1]
	deleteat!(q.items, idx)
	highest
end


"""Retire et renvoie l'élément ayant la plus faible priorité."""
function poplast!(q::PriorityQueue)
	lowest = q.items[1]
	for item in q.items[2:end]
		if item < lowest
			lowest = item
		end
	end
	idx = findall(x -> x == lowest, q.items)[1]
	deleteat!(q.items, idx)
	lowest
end
