-- HIENVIP PREMIUM LOADER (FINAL VERSION)
local HttpService = game:GetService("HttpService")
local ENCRYPTED_RAW_URL = "https://raw.githubusercontent.com/hieu59323-cmd/hienking/main/HIENVIPOPL.lua"
local XOR_KEY = 73

local function safeGet(url)
    local ok, res = pcall(function() return game:HttpGet(url) end)
    if ok then return res else return nil, res end
end

local function decode_and_run(b64payload)
    local ok, decoded = pcall(function() return HttpService:Base64Decode(b64payload) end)
    if not ok then return false, ("Base64 decode failed: %s"):format(decoded) end

    local bytes = {string.byte(decoded, 1, #decoded)}
    local out = {}
    for i = 1, #bytes do
        local b = bytes[i]
        local x
        if bit32 and bit32.bxor then
            x = bit32.bxor(b, XOR_KEY)
        else
            x = (b ~ XOR_KEY)
        end
        out[#out+1] = string.char(x)
    end

    local source = table.concat(out)
    local ok2, err = pcall(function() loadstring(source)() end)
    if not ok2 then return false, err end
    return true, nil
end

local payloadRaw, err = safeGet(ENCRYPTED_RAW_URL)
if not payloadRaw then error("Không tải được file mã hoá: " .. tostring(err)) end

local b64 = payloadRaw:match('return%s+"(.+)"')
if not b64 then b64 = payloadRaw end

local ok, runErr = decode_and_run(b64)
if not ok then error("Giải mã thất bại: " .. tostring(runErr)) end

print("🔥 HIENVIP đã chạy thành công!")
