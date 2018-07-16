if VERSION > v"0.7-"
   import Random.rand
else
   import Base.rand
end


SafeInt32(x::UnitRange{I}) where {I<:Integer} = UnitRange(SafeInt32(x.start), SafeInt32(x.stop))

rand(::Type{T}) where {T<:SafeInteger} = T(rand(integer(T)))
rand(::Type{T}, n::I) where {T<:SafeInteger, I<:Integer} = T.(rand(integer(T), n))
rand(::Type{T}, n::I) where {T<:SafeInteger, I<:SafeInteger} = T.(rand(integer(T), integer(n)))
rand(x::T) where {S<:SafeInteger, T<:UnitRange{S}} = T(rand(UnitRange(integer(x.start), integer(x.stop))))
rand(x::T, n::I) where {S<:SafeInteger, T<:UnitRange{S}, I<:Integer} = T.(rand(UnitRange(integer(x.start), integer(x.stop)), n))
rand(x::T, n::I) where {S<:SafeInteger, T<:UnitRange{S}, I<:SafeInteger} = T.(rand(UnitRange(integer(x.start), integer(x.stop)), integer(n)))



