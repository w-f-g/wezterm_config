local M = {}

function M.find_index(arr, callback)
	for i, x in ipairs(arr) do
		local flag = callback(x, i - 1)
		if flag then
			return i - 1
		end
	end
	return -1
end

return M
