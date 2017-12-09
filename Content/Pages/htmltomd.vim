:%s:<!DOCTYPE html>::ge
:%s:<html[^>]*>::ge
:%s:<head>\_.*</head>::ge
:%s:<body>::ge
:%s:<article>::ge
:%s:</article>::ge
:%s:</body>::ge
:%s:</html>::ge

:%s:<h1>:# :ge
:%s:</h1>:\r:ge

:%s:<h2>:## :ge
:%s:</h2>:\r:ge

:%s:<h3>:### :ge
:%s:</h3>:\r:ge

:%s:<h4>:#### :ge
:%s:</h4>:\r:ge

:%s:<h5>:##### :ge
:%s:</h5>:\r:ge

:%s:<br>:\r:ge
:%s:<p>:\r\r:ge
:%s:</p>:\r\r:ge

:%s:<b>:**:ge
:%s:</b>:**:ge
:%s:<i>:_:ge
:%s:</i>:_:ge

:%s:<ul>::ge
:%s:</ul>::ge
" leave these in
" :%s:<ol>::ge
:%s:</ol>::ge
:%s:\s*<li>:- :ge
:%s:</li>::ge


:%s: target="[^"]*"::ge
" <a href="ref.html" ...>text</a> => [text](ref.md)
:%s:<a href="\([^."]*\)\.html"[^>]*>\([^<]*\)</a>:[\2](\1.md):ge

" <a href="ref" ...>text</a> => [text](ref)
:%s:<a href="\([^"]*\)"[^>]*>\([^<]*\)</a>:[\2](\1):ge

" <img src="ref".*> => ![](ref)
:%s:<img src="\([^"]*\)"[^>]*\s*>:![](\1):ge

" code
:%s:<textarea[^>]*>:```cs:ge
:%s:</textarea>:```:ge

" only whitespace lines > remove whitespace, but not newline
:%s:\_^\s\_$::ge

" Clean up new lines (max 3 consecutive, i.e. 2 whitelines)
:%s:\n\n\n\+:\r\r\r:ge

" write buffer
:w %:t:r.md


