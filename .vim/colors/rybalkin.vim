" Vim color file
" Name:       rybalkin.vim
" Author:     Aleksey Rybalkin <aleksey@rybalkin.org>
" Version:    0.1.0
" Notes:      Supports 8 and 256 color modes

hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "rybalkin"
set background=dark

if &t_Co == 256
    " -> Text; Miscellaneous
    " non-highlighted code, like function invocation
    hi Normal         ctermbg=234  ctermfg=15   cterm=none
    " e.g. tabs
    hi SpecialKey     ctermbg=234  ctermfg=240  cterm=none
    hi VertSplit      ctermbg=234  ctermfg=160  cterm=none
    hi SignColumn     ctermbg=234  ctermfg=141  cterm=none
    hi NonText        ctermbg=234  ctermfg=240  cterm=none
    hi Directory      ctermbg=234  ctermfg=227  cterm=none
    hi Title          ctermbg=234  ctermfg=84   cterm=bold

    " -> Cursor
    hi Cursor         ctermbg=227  ctermfg=234  cterm=none
    hi CursorIM       ctermbg=227  ctermfg=234  cterm=none
    hi CursorColumn   ctermbg=235               cterm=none
    hi CursorLine     ctermbg=235  ctermfg=none cterm=none

    " -> Folding
    hi FoldColumn     ctermbg=234  ctermfg=25   cterm=none
    hi Folded         ctermbg=234  ctermfg=25   cterm=none

    " -> Line info
    hi LineNr         ctermbg=234  ctermfg=241  cterm=none
    hi StatusLine     ctermbg=2    ctermfg=0    cterm=none
    hi StatusLineNC   ctermbg=244  ctermfg=0    cterm=none

    " -> Messages
    hi ErrorMsg       ctermbg=124  ctermfg=252  cterm=none
    hi Question       ctermbg=234  ctermfg=214  cterm=none
    hi WarningMsg     ctermbg=214  ctermfg=0    cterm=none
    hi MoreMsg        ctermbg=234  ctermfg=214  cterm=none
    hi ModeMsg        ctermbg=234  ctermfg=214  cterm=none

    " -> Search
    hi Search         ctermbg=241  ctermfg=227  cterm=none
    hi IncSearch      ctermbg=227  ctermfg=241  cterm=none

    " -> Diff
    hi DiffAdd        ctermbg=22   ctermfg=208  cterm=none
    hi DiffChange     ctermbg=235  ctermfg=130  cterm=none
    hi DiffDelete     ctermbg=234  ctermfg=208  cterm=none
    hi DiffText       ctermbg=24   ctermfg=208  cterm=underline

    " -> Menu
    hi Pmenu          ctermbg=234  ctermfg=68   cterm=none
    hi PmenuSel       ctermbg=240  ctermfg=68   cterm=none
    hi PmenuSbar      ctermbg=52                cterm=none
    hi PmenuThumb     ctermbg=52                cterm=none

    " -> Tabs
    hi TabLine        ctermbg=234  ctermfg=252  cterm=none
    hi TabLineFill    ctermbg=234               cterm=none
    hi TabLineSel     ctermbg=234  ctermfg=215  cterm=bold
    "
    " -> Visual Mode
    hi Visual         ctermbg=234  ctermfg=215  cterm=none
    hi VisualNOS      ctermbg=234  ctermfg=241  cterm=none

    " -> Code
    hi Comment        ctermbg=234  ctermfg=246  cterm=none
    hi Constant       ctermbg=234  ctermfg=33   cterm=none
    hi String         ctermbg=234  ctermfg=166  cterm=none
    hi Error          ctermbg=234  ctermfg=7    cterm=none
    hi Identifier     ctermbg=234  ctermfg=106  cterm=none
    hi Function       ctermbg=234  ctermfg=119  cterm=none
    hi Ignore         ctermbg=234  ctermfg=7    cterm=none
    hi MatchParen     ctermbg=94   ctermfg=7    cterm=none
    hi PreProc        ctermbg=234  ctermfg=196  cterm=none
    hi Special        ctermbg=234  ctermfg=93   cterm=none
    hi Todo           ctermbg=234  ctermfg=160  cterm=none
    hi Underlined     ctermbg=234  ctermfg=7    cterm=none
    hi Statement      ctermbg=234  ctermfg=175  cterm=none
    hi Operator       ctermbg=234  ctermfg=226  cterm=none
    hi Delimiter      ctermbg=234  ctermfg=7    cterm=none
    hi Type           ctermbg=234  ctermfg=111  cterm=none
    hi Exception      ctermbg=234  ctermfg=198  cterm=none

    " -> HTML-specific
    hi htmlBold                 ctermbg=234  ctermfg=252   cterm=bold
    hi htmlBoldItalic           ctermbg=234  ctermfg=252   cterm=bold,italic
    hi htmlBoldUnderline        ctermbg=234  ctermfg=252   cterm=bold,underline
    hi htmlBoldUnderlineItalic  ctermbg=234  ctermfg=252   cterm=bold,underline,italic
    hi htmlItalic               ctermbg=255  ctermfg=125   cterm=italic
    hi htmlUnderline            ctermbg=234  ctermfg=252   cterm=underline
    hi htmlUnderlineItalic      ctermbg=234  ctermfg=252   cterm=underline,italic
elseif &t_Co == 8
    " -> Text; Miscellaneous
    hi Normal         ctermbg=8    ctermfg=7    cterm=none
    hi SpecialKey     ctermbg=8    ctermfg=5    cterm=none
    hi VertSplit      ctermbg=8    ctermfg=6    cterm=none
    hi SignColumn     ctermbg=8    ctermfg=5    cterm=none
    hi NonText        ctermbg=8    ctermfg=4    cterm=none
    hi Directory      ctermbg=8    ctermfg=6    cterm=none
    hi Title          ctermbg=8    ctermfg=2    cterm=bold

    " -> Cursor
    hi Cursor         ctermbg=6    ctermfg=8    cterm=none
    hi CursorIM       ctermbg=6    ctermfg=8    cterm=none
    hi CursorColumn   ctermbg=234               cterm=none
    hi CursorLine     ctermbg=234               cterm=none

    " -> Folding
    hi FoldColumn     ctermbg=234  ctermfg=1    cterm=none
    hi Folded         ctermbg=234  ctermfg=1    cterm=none

    " -> Line info
    hi LineNr         ctermbg=234  ctermfg=7    cterm=none
    hi StatusLine     ctermbg=234  ctermfg=7    cterm=none
    hi StatusLineNC   ctermbg=234  ctermfg=7    cterm=none

    " -> Messages
    hi ErrorMsg       ctermbg=4    ctermfg=7    cterm=none
    hi Question       ctermbg=8    ctermfg=6    cterm=none
    hi WarningMsg     ctermbg=6    ctermfg=0    cterm=none
    hi MoreMsg        ctermbg=8    ctermfg=6    cterm=none
    hi ModeMsg        ctermbg=8    ctermfg=6    cterm=none

    " -> Search
    hi Search         ctermbg=7    ctermfg=6    cterm=none
    hi IncSearch      ctermbg=7    ctermfg=6    cterm=none

    " -> Diff
    hi DiffAdd        ctermbg=234  ctermfg=2    cterm=none
    hi DiffChange     ctermbg=234  ctermfg=6    cterm=none
    hi DiffDelete     ctermbg=234  ctermfg=4    cterm=none
    hi DiffText       ctermbg=1    ctermfg=6    cterm=underline

    " -> Menu
    hi Pmenu          ctermbg=234  ctermfg=4    cterm=none
    hi PmenuSel       ctermbg=6    ctermfg=4    cterm=none
    hi PmenuSbar      ctermbg=234               cterm=none
    hi PmenuThumb     ctermbg=4                 cterm=none
    hi PmenuSel       ctermbg=6    ctermfg=4    cterm=none

    " -> Tabs
    hi TabLine        ctermbg=8    ctermfg=8    cterm=none
    hi TabLineFill    ctermbg=8                 cterm=none
    hi TabLineSel     ctermbg=8    ctermfg=7    cterm=bold

    " -> Visual Mode
    hi Visual         ctermbg=234  ctermfg=6    cterm=none
    hi VisualNOS      ctermbg=234  ctermfg=7    cterm=none

    " -> Code
    hi Comment        ctermbg=8    ctermfg=1    cterm=none
    hi Constant       ctermbg=8    ctermfg=2    cterm=none
    hi String         ctermbg=8    ctermfg=6    cterm=none
    hi Error          ctermbg=8    ctermfg=4    cterm=none
    hi Identifier     ctermbg=8    ctermfg=3    cterm=none
    hi Function       ctermbg=8    ctermfg=3    cterm=none
    hi Ignore         ctermbg=8    ctermfg=8    cterm=none
    hi MatchParen     ctermbg=6    ctermfg=8    cterm=none
    hi PreProc        ctermbg=8    ctermfg=5    cterm=none
    hi Special        ctermbg=8    ctermfg=6    cterm=none
    hi Todo           ctermbg=8    ctermfg=4    cterm=bold
    hi Underlined     ctermbg=8    ctermfg=4    cterm=underline
    hi Statement      ctermbg=8    ctermfg=5    cterm=none
    hi Operator       ctermbg=8    ctermfg=4    cterm=none
    hi Delimiter      ctermbg=8    ctermfg=4    cterm=none
    hi Type           ctermbg=8    ctermfg=6    cterm=none
    hi Exception      ctermbg=8    ctermfg=4    cterm=none

    " -> HTML-specific
    hi htmlBold                  ctermbg=8 ctermfg=7 cterm=bold
    hi htmlBoldItalic            ctermbg=8 ctermfg=7 cterm=bold,italic
    hi htmlBoldUnderline         ctermbg=8 ctermfg=7 cterm=bold,underline
    hi htmlBoldUnderlineItalic   ctermbg=8 ctermfg=7 cterm=bold,underline,italic
    hi htmlItalic                ctermbg=8 ctermfg=7 cterm=italic
    hi htmlUnderline             ctermbg=8 ctermfg=7 cterm=underline
    hi htmlUnderlineItalic       ctermbg=8 ctermfg=7 cterm=underline,italic
endif

hi! default link bbcodeBold htmlBold
hi! default link bbcodeBoldItalic htmlBoldItalic
hi! default link bbcodeBoldItalicUnderline htmlBoldUnderlineItalic
hi! default link bbcodeBoldUnderline htmlBoldUnderline
hi! default link bbcodeItalic htmlItalic
hi! default link bbcodeItalicUnderline htmlUnderlineItalic
hi! default link bbcodeUnderline htmlUnderline
