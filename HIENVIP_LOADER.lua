-- HIENVIP BASIC LOADER - KHÔNG LỖI, KHÔNG MÃ HÓA, CHẠY NGAY
local url = "https://raw.githubusercontent.com/hieu59323-cmd/hienking/refs/heads/main/HIENVIPOPL.lua"

local function safe(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)
    if ok then return res end
    warn("❌ HIENVIP Loader lỗi tải script:", res)
    return nil
end

local code = safe(url)
if code then
    local fn, err = loadstring(code)
    if not fn then
        warn("❌ HIENVIP Loader lỗi loadstring:", err)
    else
        print("✅ HIENVIP: Script đã chạy!")
        fn()
    end
end
