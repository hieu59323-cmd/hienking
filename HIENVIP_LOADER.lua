--=============================
--      HIENVIP FINAL LOADER
--=============================

local MAIN_SCRIPT = "https://raw.githubusercontent.com/hieu59323-cmd/hienking/main/HIENVIPOPL.lua"

local function safeGet(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)
    if ok then 
        return res 
    end
    return nil
end

task.spawn(function()
    print("🔄 HIENVIP Loader: Đang tải script...")

    local code = safeGet(MAIN_SCRIPT)

    if code then
        print("✅ HIENVIP: Tải thành công — Đang chạy script!")
        local fn, err = loadstring(code)
        if fn then
            fn()
        else
            warn("❌ Lỗi loadstring: " .. tostring(err))
        end
    else
        warn("❌ HIENVIP Loader: Không tải được script chính! Kiểm tra RAW link!")
    end
end)
