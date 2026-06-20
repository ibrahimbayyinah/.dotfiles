local M = {}

local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 2
local STEP = 0.5

---@param action? string
---@return nil
function M.zoom(action)
    local current = hl.get_config("cursor.zoom_factor")

    if action == "increase" then
        current = current + STEP
    elseif action == "decrease" then
        current = current - STEP
    else
        -- toggle
        if current ~= MIN_ZOOM then
            current = MIN_ZOOM
        else
            current = ZOOM_TOGGLE_FACTOR
        end
    end

    current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))

    hl.config({
        cursor = {
            zoom_factor = current,
        },
    })
end

return M
