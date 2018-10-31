import Base.maximum, Base.push!, Base.length, Base.popfirst!


abstract type AbstractQueue{T} end


"""Type représentant une file avec des éléments de type T."""
	mutable struct Queue{T} <: AbstractQueue{T}
	items::Vector{T}
end


Queue{T}() where T = Queue(T[])

"""Ajoute `item` à la fin de la file `s`."""
function push!(q::AbstractQueue{T}, item::T) where T
	push!(q.items, item)
	q
end

"""Retire et renvoie l'objet du début de la file."""
popfirst!(q::AbstractQueue) = popfirst!(q.items)

"""Indique si la file est vide."""
is_empty(q::AbstractQueue) = length(q.items) == 0

"""Donne le nombre d'éléments sur la file."""
length(q::AbstractQueue) = length(q.items)

"""Affiche une file."""
show(q::AbstractQueue) = show(q.items)


maximum(q::AbstractQueue) = maximum(q.items)
