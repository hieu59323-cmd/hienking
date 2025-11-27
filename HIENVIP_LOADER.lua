-- HIENVIP FINAL LOADER

local HttpService = game:GetService("HttpService")
local ENCRYPTED_URL = "https://raw.githubusercontent.com/hieu59323-cmd/hienking/refs/heads/main/HIENVIPOPL.lua"
local XOR_KEY = 73

local function safeGet(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)
    if not ok then
        return nil, res
    end
    return res
end

local function decode(payload)
    local ok, decoded = pcall(function()
        return HttpService:Base64Decode(payload)
    end)
    if not ok then
        return nil
    end

    local bytes = {string.byte(decoded, 1, #decoded)}
    for i = 1, #bytes do
        bytes[i] = bit32.bxor(bytes[i], XOR_KEY)
    end

    return string.char(table.unpack(bytes))
end

local raw = safeGet(ENCRYPTED_URL)
if not raw then
    warn("Không tải được file mã hoá!")
    return
end

local encoded = raw:match('return%s+%"(.-)%"')
if not encoded then
    warn("Payload lỗi hoặc sai format!")
    return
end

local final = decode(encoded)
if not final then
    warn("Giải mã thất bại!")
    return
end

loadstring(final)()
print("HIENVIP: Chạy thành công!")
