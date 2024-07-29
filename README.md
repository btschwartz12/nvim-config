# Neovim Setup Guide

I need to optomize my neovim usage, so as I revamp my current configs, I am going to document all of the shortcuts and plugins to make sure I don't forget to use anything.

Thanks [ottingbob](https://github.com/ottingbob/nvim-setup/tree/main) :)

## Binds

- Toggle file explorer: `,b`
- Save file: `,w`
- Fuzzy-find file: `,p`
- Live grep: `,fg`
- Leap forward: `s{char-1}{char-2}`
- Leap backward: `S{char-1}{char-2}`
- Comment line: `gcc`

#### Misc binds
- Insert comma: `,,`
- Buffers: `,fb`
- Help tags: `,fh`
- Git branches: `,gb`
- Git stuff: `:Gitsigns`
- Surround words: `ysiw)`
- Make strings: `ys$"`

### Tabs/Windows binds
- Switch windows: `<C-l>`, `<C-h>`, `<C-j>`, `<C-k>`
- Exit out of terminal: `,x` (in `TERMINAL` mode)
- Switch tabs: `,;`, `,'`
- Switch tab order: `,<`, `,>`
- Close tab: `,x`
- Pin tab: `,bp`
- Split horizontal: `,t`
- Split vertical: `,vt`
- Open terminal tab: `,tn`

### `file_explorer` binds
- Open file browser: `,ff`
- Create file: `c`
- Rename file: `r`
- Delete file: `d`
- Parent directory: `g`
- Current working directory: `w`
- Toggle hidden files: `h`
- Toggle folder browser: `f`



### LSP binds
- LSP hover: `,w` (in `INSERT` mode)
- Open diagnostic when hovering over error: `<space>e`
- Tab through diagnostics: `[d`, `]d`
- Add diagnostics to loclist: `<space>q`
- Add a workspace folder: `<space>wa`
- Remove a workspace folder: `<space>wr`
- List all workspace folders: `<space>wl`
- Show code actions: `<space>ca`
- Jump to declaration: `gD`
- Jump to definition: `gd`
- Show references: `gr`
- Show hover information: `K`
- List all implemntations: `gi`
- Jump to type definition: `<space>D`
- Rename symbol: `<space>rn`
- Format current buffer: `<space>f`

