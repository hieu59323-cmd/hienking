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

local function xorCrypt(str, key)
    local result = {}
    for i = 1, #str do
        local byte = string.byte(str, i)
        result[i] = string.char(bit32.bxor(byte, key))
    end
    return table.concat(result)
end

local function loadEncrypted()
    local encrypted, err = safeGet(ENCRYPTED_URL)
    if not encrypted then
        warn("HIENVIP Loader: Cannot load encrypted file:", err)
        return
    end
    local decrypted = xorCrypt(encrypted, XOR_KEY)
    local run = loadstring(decrypted)
    if run then
        run()
    else
        warn("HIENVIP Loader: Failed to decrypt or execute.")
    end
end

loadEncrypted()
