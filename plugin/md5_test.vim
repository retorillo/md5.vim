command! MD5Test call MD5Test()

function! s:passing(it, time)
  echohl Statement
  echomsg printf("\u2713 %s (%ssec)", a:it, substitute(reltimestr(a:time), '^\s*', '', ''))
  echohl None
endfunction
function! s:failing(it, actual, expect)
  echohl WarningMsg
  echomsg printf('x %s', a:it)
  echomsg printf('  expect: %s', a:expect)
  echomsg printf('  actual: %s', a:actual)
  echohl None
endfunction
function! s:shouldeql(it, actual, expect, time)
  if a:actual == a:expect
    call s:passing(a:it, a:time)
  else
    call s:failing(a:it, a:actual, a:expect)
  endif
endfunction
function! s:expect(input, expect)
  let start = reltime()
  let it = printf('md5(%s) = %s', s:justify(a:input, 20), a:expect)
  call s:shouldeql(it, MD5String(a:input), a:expect, reltime(start))
endfunction
function! s:justify(str, width)
  return strlen(a:str) < a:width
    \ ? a:str . repeat("\u0020", a:width - strlen(a:str))
    \ : a:str[0 : a:width - 2] . "\u2026"
endfunction
function! MD5Test()
  call s:expect("", "d41d8cd98f00b204e9800998ecf8427e")
  call s:expect("a", "0cc175b9c0f1b6a831c399e269772661")
  call s:expect("abc", "900150983cd24fb0d6963f7d28e17f72")
  call s:expect("message digest", "f96b697d7cb7938d525a2f31aaf161d0")
  call s:expect("abcdefghijklmnopqrstuvwxyz", "c3fcd3d76192e4007dfb496cca67e13b")
  call s:expect("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", "d174ab98d277d9f5a5611c2c9f419d9f")
  call s:expect("12345678901234567890123456789012345678901234567890123456789012345678901234567890", "57edf4a22be3c955ac49da2e2107b67a")
endfunction
