local options = {
    mouse = "a", -- Allow mouse in all modes
    scrolloff = 10, -- Max height/depth of cursor while scrolling
    hidden = true, -- Allow switching away from buffer before saving
    ignorecase = true, -- Case insensitive searches
    
    -- Line Nums
    number = true,
    relativenumber = true,

    -- UI
    showtabline = 2, -- Always show tabs
    termguicolors = true, -- Enable more colors (used for some colorschemes)

    -- Tabs/Spaces
    tabstop = 4, -- Num spaces in tab
    shiftwidth = 4, -- Num spaces to move when >> shifting a line
    expandtab = true, -- Insert spaces when tabbing 
    cursorline = true,
}

vim.cmd("colorscheme slate")

for k, v in pairs(options) do
    vim.opt[k] = v
end

