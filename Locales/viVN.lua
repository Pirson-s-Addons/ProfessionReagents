local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- TIẾNG VIỆT (viVN)
-- ==========================================
local locale = GetLocale()
if locale ~= "viVN" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Tùy chọn Profession Reagents"
L["GENERAL"] = "Chung"
L["TOOLTIP_HEADER"] = "Chú giải vật phẩm"
L["TOOLTIP_TITLE"] = "Nghề nghiệp"
L["ENABLE"] = "Hiện nghề trong chú giải nguyên liệu"
L["TT_ENABLE"] = "Thêm vào chú giải của mỗi nguyên liệu nghề các nghề sử dụng nó."
L["SHOW_RANGE"] = "Hiện khoảng cấp độ"
L["TT_SHOW_RANGE"] = "Bên cạnh mỗi nghề là các cấp kỹ năng mà công thức của nghề đó dùng nguyên liệu: từ công thức đầu tiên bạn có thể học đến công thức cuối cùng vẫn còn cho điểm."
L["DEFAULTS"] = "Giá trị mặc định"
L["TT_DEFAULTS"] = "Đặt lại mọi thiết lập về giá trị mặc định."
L["VERSION"] = "Phiên bản:"
L["AUTHOR"] = "Tác giả:"
L["LINKS"] = "Liên kết"
L["COMMANDS"] = "Lệnh"
L["SELECT"] = "Chọn"
L["TT_SELECT"] = "Chọn toàn bộ liên kết để bạn có thể sao chép bằng Ctrl+C. WoW không cho phép addon ghi vào bộ nhớ tạm, nên bước cuối là của bạn."
L["ABOUT_DESC"] = "Hiện trong chú giải của mỗi nguyên liệu nghề những nghề nào dùng nó và ở cấp nào. Thiết lập nằm trong Chung."
L["CMD_OPEN"] = "Mở cài đặt."
