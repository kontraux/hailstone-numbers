local collatz = {}

function collatz.run(x)
    local t = {}
    while x ~= 1 do
        table.insert(t, x)
        if x % 2 == 0 then
            x = x / 2
        else
            x = (x * 3) + 1
        end
        if x == 1 then
            table.insert(t, 1)
        end
    end
    return t
end

return collatz