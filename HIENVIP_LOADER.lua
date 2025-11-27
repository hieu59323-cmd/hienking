-- HIENVIP LOADER
repeat task.wait() until game:IsLoaded()

-- Loading Notify
print("HIEN LOADER ĐANG CHẠY...")

-- 🟥 LINK TẢI SCRIPT CHÍNH (KHÔNG SAI ĐƯỜNG DẪN RAW)
local mainScriptURL = "https://raw.githubusercontent.com/hieu59323-cmd/hienking/refs/heads/main/HIENVIPOPL.lua"

-- 🟦 TẢI SCRIPT
local s = game:HttpGet(mainScriptURL)

-- 🟩 CHẠY SCRIPT
local f = loadstring(s)
f()
