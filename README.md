# vim-elixir-alternative-files

Vim script for alternating between test and implementation files for Elixir

## Installation with Vundle:

```
Plugin 'renderedtext/vim-elixir-alternative-files'
```

Currently, you have to define a shortcut:

```
nnoremap <silent><leader><leader> :call ElixirAlternateFile()<cr>
```

My plan for the future is to make use of `:A`, but currently it is clashing with
the vim-rails plugin.
