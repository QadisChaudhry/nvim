local status, org = pcall(require, "orgmode")
if not status then
    return
end
local status1, org_bullets = pcall(require, "org-bullets")
if not status1 then
    return
end

org.setup_ts_grammar()

org.setup({
    -- org_agenda_files = "~/Desktop/College/org/",
    org_default_notes_file = "~/Desktop/College/TODO.org",
    mappings = {
        agenda = {
            org_agenda_quit = { "<esc>", "q" }
        },
        capture = {
            org_capture_finalize = "<esc>",
            org_capture_kill = "<c-c>",
        },
        org = {
            org_meta_return = "<c-cr>",
            org_deadline = "<leader>od",
            org_schedule = "<leader>os",
            org_priority = "<leader>op",
            org_insert_todo_heading_respect_content = "<leader>ot",
            org_set_tags_command = "<leader>oit",
            org_todo = "<cr>",
        }
    },
    win_split_mode = {"float", 0.8}
})

org_bullets.setup {
    concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
    symbols = {
        -- headlines can be a list
        headlines = { "◉", "○", "✸", "✿" },
        -- or a function that receives the defaults and returns a list
        -- headlines = function(default_list)
        --     table.insert(default_list, "♥")
        --     return default_list
        -- end,
        checkboxes = {
            half = { "", "OrgTSCheckboxHalfChecked" },
            done = { "✓", "OrgDone" },
            todo = { "˟", "OrgTODO" },
        },
    }
}
