import Base.isless, Base.==

abstract type AbstractPriorityItem{T} end

mutable struct PriorityItem{T} <: AbstractPriorityItem{T}
	priority::Int
	data::T
end

function PriorityItem(priority::Int, data::T) where T
	PriorityItem{T}(max(0, priority), data)
end

priority(p::PriorityItem) = p.priority

function priority!(p::PriorityItem, priority::Int)
	p.priority = max(0, priority)
	p
end


isless(p::PriorityItem, q::PriorityItem) = priority(p) < priority(q)

==(p::PriorityItem, q::PriorityItem) = priority(p) == priority(q)



