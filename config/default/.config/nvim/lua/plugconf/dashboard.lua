require('dashboard').setup ({
    theme = 'hyper',
    config = {
      header = {
        '',
        '',
        '',
        '          ▀████▀▄▄              ▄█ ',
        '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
        '    ▄        █          ▀▀▀▀▄  ▄▀  ',
        '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
        '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
        '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
        '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
        '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
        '   █   █  █      ▄▄           ▄▀   ',
        '▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀',
        '',
      },
      shortcut = {
        { desc = '󰊳 update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'edit ~/repos/dotfiles/',
          key = 'd',
        },
        {
          desc = '󱠓 colourscheme',
          group = 'label',
          action = 'Telescope colorscheme',
          key = 'c',
        },
      },
    packages = { enable = false },
    project = { enable = false, limit = 0, action = 'Telescope find_files cwd=' },
    mru = { limit = 7, cwd_only = false },

    footer = {" richard stallman being devil preaching stuff like \"emacs\""},
    },
  })
