# panelmanager.vim

Vim Plugin for managing panel plugins.

* Ask a plugin to open in a panel
* Check the panel position where it should open
* Close the plugin currently occupying that position
* Open the plugin

## Supported Plugins

Any plugin that opens in a split window and has a **open** and a **close**
command.

## Example Configuration

```vim

" REGISTER PLUGIN AND THEIR PANEL POSITION

"                                     Position   Identifier,    Open command      Close Command
call panelmanager#PMRegisterPanelView('left',    'nerdtree',    'NERDTree',       'NERDTreeClose')
call panelmanager#PMRegisterPanelView('left',    'voom',        'Voom markdown',  'Voomquit')
call panelmanager#PMRegisterPanelView('left',    'wimpi',       'WimpiMenuOpen',  'WimpiMenuClose')
call panelmanager#PMRegisterPanelView('bottom',  'quickfix',    'copen',          'cclose')

call panelmanager#PMRegisterPanelView('right',   'minimap',     'Minimap',        'MinimapClose')
call panelmanager#PMRegisterPanelView('right',   'tagbar',      'Tagbar',         'TagbarClose')

" map keys to plugins
"LEFT SIDEBAR                               Identifier
map <C-F1>  :call panelmanager#PMToggleView('nerdtree')<CR>
map <C-F2>  :call panelmanager#PMToggleView('voom')<CR>
map <C-F3>  :call panelmanager#PMToggleView('wimpi')<CR>

"BOTTOM SIDEBAR                             Identifier
map <C-F5>  :call panelmanager#PMToggleView('quickfix')<CR>

"RIGHT SIDEBAR                              Identifier
map <C-F9>  :call panelmanager#PMToggleView('tagbar')<CR>
map <C-F10> :call panelmanager#PMToggleView('minimap')<CR>
```

