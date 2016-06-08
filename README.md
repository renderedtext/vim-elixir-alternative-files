# vim-elixir-alternative-files

Installation with Vundle:

```
Plugin 'renderedtext/vim-elixir-alternative-files'
```

Currently, you have to define a shortcut:

```
nnoremap <silent><leader>t :call ElixirAlternateFile()<cr>
```

My plan for the future is to make use of `:A`, but currently it is clashing with
the vim-rails plugin.
