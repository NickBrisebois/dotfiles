" Initialisation:"{{{
" ----------------------------------------------------------------------------
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "elly"
"}}}


" Palettes:"{{{
" ----------------------------------------------------------------------------
let s:palette = {}
let s:palette.bg        = "#111a1f"
let s:palette.comment   = "#545759"
let s:palette.markup    = "#8D7856"
let s:palette.constant  = "#738C9C"
let s:palette.operator  = "#738C9C"
let s:palette.tag       = "#8D7856"
let s:palette.regexp    = "#6998B3"
let s:palette.string    = "#798362"
let s:palette.function  = "#8D7856"
let s:palette.special   = "#9B9257"
let s:palette.keyword   = "#8D7856"
let s:palette.error     = "#810002"
let s:palette.accent    = "#9B9257"
let s:palette.panel     = "#14191F"
let s:palette.guide     = "#2D3640"
let s:palette.line      = "#151A1E"
let s:palette.selection = "#253340"
let s:palette.fg        = "#ACB3B5"
let s:palette.fg_idle   = "#3E4B59"
let s:palette.diffg     = "#012800"
let s:palette.diffr     = "#340001"
let s:palette.cdiffg    = "#037500"
let s:palette.cdiffy    = "#817e00"
let s:palette.cdiffr    = "#810002"
"}}}


" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------
function! s:build_prim(hi_elem, field)
  let l:vname = "s:" . a:hi_elem . "_" . a:field " s:bg_gray
  let l:gui_assign = "gui".a:hi_elem."=".s:palette[a:field] " guibg=...
  exe "let " . l:vname . " = ' " . l:gui_assign . "'"
endfunction
let s:bg_none = ' guibg=NONE ctermbg=NONE'
let s:fg_none = ' guifg=NONE ctermfg=NONE'
for [key_name, d_value] in items(s:palette)
  call s:build_prim('bg', key_name)
  call s:build_prim('fg', key_name)
endfor
" }}}


" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"
exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"
"}}}


" Vim Highlighting: "{{{
" ----------------------------------------------------------------------------
exe "hi! Normal"        .s:fg_fg          .s:bg_bg          .s:fmt_none
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! Constant"      .s:fg_accent      .s:bg_line        .s:fmt_none
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_accent      .s:bg_line        .s:fmt_none
exe "hi! LineNr"        .s:fg_guide       .s:bg_none        .s:fmt_none
exe "hi! Directory"     .s:fg_fg_idle     .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_string      .s:bg_panel       .s:fmt_none
exe "hi! DiffChange"    .s:fg_tag         .s:bg_panel       .s:fmt_none
exe "hi! DiffText"      .s:fg_fg          .s:bg_panel       .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_error       .s:bg_none        .s:fmt_none
exe "hi! EndOfBuffer"   .s:fg_bg          .s:bg_none        .s:fmt_none
exe "hi! VertSplit"     .s:fg_comment     .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_fg_idle     .s:bg_panel       .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_panel       .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_bg          .s:fmt_none
exe "hi! MatchParen"    .s:fg_fg          .s:bg_bg          .s:fmt_undr
exe "hi! ModeMsg"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_guide       .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_fg          .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_fg          .s:bg_selection   .s:fmt_revr
exe "hi! Question"      .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_none        .s:bg_guide       .s:fmt_bold
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_tag         .s:bg_none        .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_keyword     .s:bg_none        .s:fmt_undr
exe "hi! SpellBad"      .s:fg_error       .s:bg_none        .s:fmt_undr
exe "hi! SpellRare"     .s:fg_regexp      .s:bg_none        .s:fmt_undr
exe "hi! StatusLine"    .s:fg_fg          .s:bg_panel       .s:fmt_none
exe "hi! StatusLineNC"  .s:fg_fg_idle     .s:bg_panel       .s:fmt_none
exe "hi! WildMenu"      .s:fg_bg          .s:bg_markup      .s:fmt_none
exe "hi! TabLine"       .s:fg_fg          .s:bg_panel       .s:fmt_revr
exe "hi! Title"         .s:fg_constant    .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
exe "hi! WarningMsg"    .s:fg_error       .s:bg_none        .s:fmt_none
"}}}


" Generic Syntax Highlighting: "{{{
" ----------------------------------------------------------------------------
exe "hi! Comment"           .s:fg_comment   .s:bg_none        .s:fmt_none
exe "hi! String"            .s:fg_string    .s:bg_none        .s:fmt_none
exe "hi! Identifier"        .s:fg_tag       .s:bg_none        .s:fmt_none
exe "hi! Function"          .s:fg_function  .s:bg_none        .s:fmt_none
exe "hi! Statement"         .s:fg_keyword   .s:bg_none        .s:fmt_none
exe "hi! Operator"          .s:fg_fg        .s:bg_none        .s:fmt_none
exe "hi! Keyword"           .s:fg_operator  .s:bg_none        .s:fmt_none
exe "hi! PreProc"           .s:fg_special   .s:bg_none        .s:fmt_none
exe "hi! Type"              .s:fg_accent    .s:bg_none        .s:fmt_none
exe "hi! Structure"         .s:fg_special   .s:bg_none        .s:fmt_none
exe "hi! Special"           .s:fg_operator  .s:bg_none        .s:fmt_none
exe "hi! Underlined"        .s:fg_tag       .s:bg_none        .s:fmt_undr
exe "hi! Ignore"            .s:fg_none      .s:bg_none        .s:fmt_none
exe "hi! Error"             .s:fg_fg        .s:bg_error       .s:fmt_none
exe "hi! Todo"              .s:fg_markup    .s:bg_none        .s:fmt_none
exe "hi! qfLineNr"          .s:fg_keyword   .s:bg_none        .s:fmt_none
exe "hi! Conceal"           .s:fg_guide     .s:bg_none        .s:fmt_none
exe "hi! CursorLineConceal" .s:fg_guide     .s:bg_line        .s:fmt_none
exe "hi! DiffAdd"           .s:fg_none      .s:bg_diffg       .s:fmt_none
exe "hi! DiffText"          .s:fg_none      .s:bg_diffg       .s:fmt_none
exe "hi! DiffChange"        .s:fg_none      .s:bg_diffg       .s:fmt_none
exe "hi! DiffDelete"        .s:fg_diffr     .s:bg_diffr       .s:fmt_none
"}}}


" Terminal: "{{{
" ----------------------------------------------------------------------------
if has("nvim")
  let g:terminal_color_0  = s:palette.bg
  let g:terminal_color_1  = s:palette.markup
  let g:terminal_color_2  = s:palette.string
  let g:terminal_color_3  = s:palette.accent
  let g:terminal_color_4  = "#63768A"
  let g:terminal_color_5  = s:palette.constant
  let g:terminal_color_6  = s:palette.regexp
  let g:terminal_color_7  = s:palette.fg
  let g:terminal_color_8  = "#868b8d"
  let g:terminal_color_9  = s:palette.markup
  let g:terminal_color_10 = s:palette.string
  let g:terminal_color_11 = s:palette.accent
  let g:terminal_color_12 = "#63768A"
  let g:terminal_color_13 = s:palette.constant
  let g:terminal_color_14 = s:palette.regexp
  let g:terminal_color_15 = s:palette.fg
  let g:terminal_color_backround = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
else
  let g:terminal_ansi_colors =  [s:palette.bg,      s:palette.markup]
  let g:terminal_ansi_colors += [s:palette.string,  s:palette.accent]
  let g:terminal_ansi_colors += ["#63768A",         s:palette.constant]
  let g:terminal_ansi_colors += [s:palette.regexp,  s:palette.fg]
  let g:terminal_ansi_colors += ["#868b8d",         s:palette.markup]
  let g:terminal_ansi_colors += [s:palette.string,  s:palette.accent]
  let g:terminal_ansi_colors += ["#63768A",         s:palette.constant]
  let g:terminal_ansi_colors += [s:palette.regexp,  s:palette.fg]
endif
" }}}


" Plugins: "{{{
" ----------------------------------------------------------------------------
" NerdTree
" ---------
exe "hi! NERDTreeOpenable"      .s:fg_fg_idle    .s:bg_none        .s:fmt_none
exe "hi! NERDTreeClosable"      .s:fg_accent     .s:bg_none        .s:fmt_none
exe "hi! NERDTreeUp"            .s:fg_fg_idle    .s:bg_none        .s:fmt_none
exe "hi! NERDTreeDir"           .s:fg_function   .s:bg_none        .s:fmt_none
exe "hi! NERDTreeFile"          .s:fg_none       .s:bg_none        .s:fmt_none
exe "hi! NERDTreeDirSlash"      .s:fg_accent     .s:bg_none        .s:fmt_none

" GitGutter
" ---------
exe "hi! GitGutterAdd"          .s:fg_string     .s:bg_none        .s:fmt_none
exe "hi! GitGutterChange"       .s:fg_tag        .s:bg_none        .s:fmt_none
exe "hi! GitGutterDelete"       .s:fg_markup     .s:bg_none        .s:fmt_none
exe "hi! GitGutterChangeDelete" .s:fg_function   .s:bg_none        .s:fmt_none

" ale
" ---------
exe "hi! ALEError"              . s:fg_none      .s:bg_none        .s:fmt_curl
exe "hi! ALEErrorSign"          . s:fg_none      .s:bg_error       .s:fmt_none
exe "hi! ALEWarning"            . s:fg_none      .s:bg_none        .s:fmt_curl
exe "hi! ALEWarningSign"        . s:fg_none      .s:bg_accent      .s:fmt_none

" coc-git
" ---------
exe "hi! CocDiffAdd"            . s:fg_cdiffg    .s:bg_none        .s:fmt_none
exe "hi! CocDiffChange"         . s:fg_cdiffy    .s:bg_none        .s:fmt_none
exe "hi! CocDiffDelete"         . s:fg_cdiffr    .s:bg_none        .s:fmt_none
