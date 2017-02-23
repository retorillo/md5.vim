# md5.vim

RFC 1321 MD5 implementation written only in Vim Script.
Works on non-python(`-python`) and non-ruby(`-ruby`) environments.

Distributed as a joke/experimental plugin because of awful slowness.

Generally, python, ruby, or md5sum are good to accomplish this.

Tested on Vim 8.0(`+num64`) and 7.4(`-num64`)
On `+num64` environment, calculation speed may be a bit better.

## Install

```bash
# Use pathogen
# Or, copy the content of this repository into your vim runtime path.
git clone https://github.com/retorillo/md5.vim.git ~/.vim/bundle/md5.vim

# Or manually load script without installation
git clone https://github.com/retorillo/md5.vim.git ~/md5.vim
vim -c 'source ~/md5.vim/plugin/md5.vim | source ~/md5.vim/plugin/md5_script.vim'
```

## Usage

```viml
:MD5Line " Calculate MD5 hash for current line
:MD5String foobar " Calculate MD5 hash for string
:MD5File filename " Calculate MD5 hash for file
:MD5Test " Run testsuite specified in RFC 1321
```

Note that `MDFile` may be a long running script in case of large file.
When cannot wait, press CTRL + C to stop script.

## License

The MIT License

Copyright (C) 2017 Retorillo
