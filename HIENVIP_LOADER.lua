--==========================
--    HIENVIP LOADER FINAL
--==========================

local MAIN_SCRIPT = "https://raw.githubusercontent.com/hieu59323-cmd/hienking/main/hienvipno1.lua"

local function safeGet(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)

    if ok and res then
        return res
    end
    
    warn("❌ HIENVIP Loader lỗi tải script!")
    return nil
end

local code = safeGet(MAIN_SCRIPT)

if code then
    local fn, err = loadstring(code)
    if not fn then
        warn("❌ HIENVIP Loader lỗi loadstring: " .. tostring(err))
    else
        print("✅ HIENVIP: Script đã chạy!")
        fn()
    end
end
