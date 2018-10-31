import Base.isless, Base.==

abstract type AbstractPriorityItem{T} end

mutable struct PriorityItem{T} <: AbstractPriorityItem{T}
	data::T
	priority::Float64
end

function PriorityItem(data::T,priority::Int) where T
	PriorityItem{T}(data,max(0, priority))
end

priority(p::PriorityItem) = p.priority
data(p::PriorityItem)=p.data

function priority!(p::PriorityItem, priority::Float64)
	p.priority = max(0, priority)
	p
end

function set_data!(p::PriorityItem, new_data::T) where T
	p.data = new_data
	p
end

isless(p::PriorityItem, q::PriorityItem) = priority(p) < priority(q)

==(p::PriorityItem, q::PriorityItem) = priority(p) == priority(q)
