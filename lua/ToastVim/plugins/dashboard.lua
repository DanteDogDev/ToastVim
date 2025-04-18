local logo = [[
████████╗ ██████╗  █████╗ ███████╗████████╗██╗   ██╗██╗███╗   ███╗
╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║
   ██║   ██║   ██║███████║███████╗   ██║   ██║   ██║██║██╔████╔██║
   ██║   ██║   ██║██╔══██║╚════██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║   ╚██████╔╝██║  ██║███████║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                                  
                                                                  
 ]]
return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = logo,
      },
      sections = {
        {section = "header"},
        {section = "startup", padding = 1},
        {icon = " ", title = "Git Status", section = "terminal", enabled = function() return Snacks.git.get_root() ~= nil end, cmd = "git status --short --branch --renames", height = 5, padding = 1, ttl = 5 * 60, indent = 3, },
      }
    },
  },
}
