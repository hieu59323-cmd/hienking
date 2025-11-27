-- HIENVIP LOADER FINAL - CHẠY 100%

local url = "https://raw.githubusercontent.com/hieu59323-cmd/hienking/main/HIENVIPOPL.lua"

local function safe(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)
    if ok then return res end
    warn("❌ HIENVIP Loader: Không tải được script chính")
    return nil
end

local code = safe(url)
if not code then return end

local fn, err = loadstring(code)
if not fn then
    warn("❌ HIENVIP Loader: Lỗi loadstring:", err)
    return
end

print("🔥 HIENVIP: Script đã chạy thành công!")
fn()
