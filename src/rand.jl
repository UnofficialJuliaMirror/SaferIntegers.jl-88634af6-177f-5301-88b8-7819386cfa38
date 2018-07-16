import Base:rand

Base.rand(::Type{T}) where {T<:SafeInteger} = T(rand(integer(T)))
Base.rand(::Type{T}, n::I) where {T<:SafeInteger, I<:Integer} = T.(rand(integer(T), n))
Base.rand(::Type{T}, n::I) where {T<:SafeInteger, I<:SafeInteger} = T.(rand(integer(T), integer(n)))
Base.rand(x::T) where {S<:SafeInteger, T<:UnitRange{S}} = S(rand(integer(x)))
Base.rand(x::T, n::I) where {S<:SafeInteger, T<:UnitRange{S}, I<:Integer} = S.(rand(integer(x), n))
Base.rand(x::T, n::I) where {S<:SafeInteger, T<:UnitRange{S}, I<:SafeInteger} = S.(rand(integer(x), integer(n)))
