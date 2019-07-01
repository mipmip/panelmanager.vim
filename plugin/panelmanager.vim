" Panel Manager

let g:PMleft_views = {}
let g:PMright_views = {}
let g:PMPanelsViews = {}

augroup PanelManagerTabInit
  autocmd!
  autocmd VimEnter,TabEnter * call PMInitTab()
augroup END

function! PMInitTab()
  let t:PMcurrent_left_view = ''
  let t:PMcurrent_right_view = ''
  let t:PMcurrent_view = {}
endfunction

function! PMRegisterPanelView(position, identifier, open_command, close_command)

  let l:registration = {}
  let l:registration['opener'] = a:open_command
  let l:registration['closer'] = a:close_command
  let l:registration['position'] = a:position
  let g:PMPanelsViews[a:identifier] = l:registration

endfunction

function! PMToggleView(identifier)

  let l:previous_view_id = ''

  if has_key(t:PMcurrent_view, PMGetPositionByIdentifier(a:identifier))
    let l:previous_view_id = t:PMcurrent_view[PMGetPositionByIdentifier(a:identifier)]

    if l:previous_view_id != ''
      exec g:PMPanelsViews[l:previous_view_id]['closer']
    end
  endif

  " only open when opening a new panel, else act as toggle
  if l:previous_view_id != a:identifier
    exec g:PMPanelsViews[a:identifier]['opener']
    call PMSetCurrentViewForIdentifier(a:identifier)
  else
    let t:PMcurrent_view[PMGetPositionByIdentifier(a:identifier)] = ''

  endif
endfunction

function! PMGetPositionByIdentifier(identifier)
  return g:PMPanelsViews[a:identifier]['position']
endfunction

function! PMSetCurrentViewForIdentifier(identifier)
  let l:position = g:PMPanelsViews[a:identifier]['position']
  let t:PMcurrent_view[l:position] = a:identifier
endfunction
