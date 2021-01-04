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

" Run this before every other command
call panelmanager#init()

" REGISTER PLUGIN AND THEIR PANEL POSITION

                         POSITION  IDENTIFIER, OPEN COMMAND     CLOSE COMMAND

call PMRegisterPanelView('left',   'nerdtree', 'NERDTree',      'NERDTreeClose')
call PMRegisterPanelView('left',   'voom',     'Voom markdown', 'Voomquit')
call PMRegisterPanelView('left',   'linny',    'LinnyMenuOpen', 'LinnyMenuClose')
call PMRegisterPanelView('bottom', 'quickfix', 'copen',         'cclose')
call PMRegisterPanelView('right',  'minimap',  'Minimap',       'MinimapClose')
call PMRegisterPanelView('right',  'tagbar',   'Tagbar',        'TagbarClose')

" MAP KEYS TO PLUGINS

"LEFT SIDEBAR                 IDENTIFIER
map <F1>  :call PMToggleView('nerdtree')<CR>
map <F2>  :call PMToggleView('voom')<CR>
map <F3>  :call PMToggleView('linny')<CR>

"BOTTOM SIDEBAR               IDENTIFIER
map <F5>  :call PMToggleView('quickfix')<CR>

"RIGHT SIDEBAR                IDENTIFIER
map <F9>  :call PMToggleView('tagbar')<CR>
map <F10> :call PMToggleView('minimap')<CR>
```
