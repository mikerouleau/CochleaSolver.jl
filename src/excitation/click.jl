struct ClickParams{T1,T2}
    Timpulse::T1
    v::T2
end

function ClickParams(d::Dict)
    return ClickParams{typeof(d["Timpulse"]),typeof(d["v"])}(d["Timpulse"], d["v"])
end

function click!(V, p, t)
    if t < 0
        V .= zero(V)
    elseif t < p.Timpulse
        V = p.v
    else
        V .= zero(V)
    end
end