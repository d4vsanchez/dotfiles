require 'nvim-tree'.setup {
    sort_by = 'case-insensitive',
    view = {
        width = 30,
    },
    renderer = {
        add_trailing = true,
        group_empty = true,
    },
    filters = {
        custom = {".git"},
    },
}
