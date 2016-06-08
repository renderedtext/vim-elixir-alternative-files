function! ElixirGetAlternateFilenameForImplementation(filepath)
  let currentFileRoot = split(a:filepath, ".ex$")[0]

  if empty(matchstr(currentFileRoot, "web"))
    " in lib directory
    let fileToOpen = "test/" . currentFileRoot . "_test.exs"
  else
    " in web directory
    let pathWithoutWeb = split(currentFileRoot, "^web/")[0]
    let fileToOpen = "test/" . pathWithoutWeb. "_test.exs"
  endif

  return fileToOpen
endfunction

function! ElixirGetAlternateFilenameForTest(filepath)
  let currentFileRoot = split(a:filepath, "_test.exs$")[0]
  let pathWithoutTest = split(currentFileRoot, "^test/")[0]

  if empty(matchstr(pathWithoutTest, "^lib"))
    let fileToOpen = "web/" . pathWithoutTest . ".ex"
  else
    let fileToOpen = pathWithoutTest . ".ex"
  endif

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

  echo fileToOpen

  if filereadable(fileToOpen)
    exec(":A" . " " . fileToOpen)
  else
    echoerr "couldn't find file " . fileToOpen
  endif
endfunction
