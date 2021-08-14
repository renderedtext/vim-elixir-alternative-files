function! ElixirGetAlternateFilenameForImplementation(filepath)
  let currentFileRoot = split(a:filepath, ".ex$")[0]

  let pathWithoutLib = split(currentFileRoot, "^lib/")[0]
  let fileToOpen = "test/" . pathWithoutLib . "_test.exs"

  return fileToOpen
endfunction

function! ElixirGetAlternateFilenameForTest(filepath)
  let currentFileRoot = split(a:filepath, "_test.exs$")[0]
  let pathWithoutTest = split(currentFileRoot, "^test/")[0]

  let fileToOpen = "lib/" . pathWithoutTest . ".ex"
  
  return fileToOpen
endfunction

function! ElixirGetAlternateFilename(filepath)
  let fileToOpen = ""

  if empty(matchstr(a:filepath, "_test"))
    let fileToOpen = ElixirGetAlternateFilenameForImplementation(a:filepath)
  else
    let fileToOpen = ElixirGetAlternateFilenameForTest(a:filepath)
  endif

  return fileToOpen
endfunction

function! ElixirAlternateFile()
  let currentFilePath = expand(bufname("%"))
  let fileToOpen = ElixirGetAlternateFilename(currentFilePath)

  exec(":e" . " " . fileToOpen)
endfunction
