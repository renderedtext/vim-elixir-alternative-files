function! ElixirGetAlternateFilenameForImplementation(filepath)
  let currentFileRoot = split(a:filepath, ".ex$")[0]

  let testPath = substitute(currentFileRoot, "lib/", "test/", "")
  let fileToOpen = testPath . "_test.exs"

  return fileToOpen
endfunction

function! ElixirGetAlternateFilenameForTest(filepath)
  let currentFileRoot = split(a:filepath, "_test.exs$")[0]

  let implementationPath = substitute(currentFileRoot, "test/", "lib/", "")
  let fileToOpen = implementationPath . ".ex"

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
    exec(":e" . " " . fileToOpen)
  else
    echoerr "couldn't find file " . fileToOpen
  endif
endfunction
