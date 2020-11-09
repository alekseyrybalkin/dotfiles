if !has('python3')
    echo "No python3 support"
    finish
endif

function! FastOpen()

python3 << EOF
import os
import vim

names = []
for root, dirs, files in os.walk(os.getcwd(), topdown=True):
    root = root.replace(os.getcwd(), '')
    if root.startswith('/'):
        root = root[1:]
    if len(root) > 0:
        root += '/'
    for skip in ['target', '.data', '.git']:
        try:
            dirs.remove(skip)
        except ValueError as e:
            pass
    for f in files:
        if f.endswith('.pyc'):
            continue
        names.append((root, f))
        if len(names) > 100000:
            break
    if len(names) > 100000:
        break

names = sorted(names)

win_num = vim.current.window.number
vim.command('rightb new')
b = vim.current.buffer

term = ''
pos = 0
vpos = 0
c = None
while True:
    if '/' in term:
        matches = [name for name in names if term.lower() in (name[0] + name[1]).lower()][:100]
    else:
        matches = [name for name in names if term.lower() in name[1].lower()][:100]

    if vpos >= len(matches):
        vpos = len(matches) - 1
    if vpos < 0:
        vpos = 0

    prev_len = len(b)
    i = 0
    for line in matches:
        if len(line[0]) > 0:
            line = '{:<3}{:<50}   {}'.format(chr(9632) if i == vpos else '', line[1], line[0])
        else:
            line = '{:<3}{}'.format(chr(9632) if i == vpos else '', line[1])
        if i < prev_len:
            b[i] = line
        else:
            b.append(line)
        i += 1
    del b[i:prev_len]
    vim.command('redraw')
    print('find: {}'.format(term[:pos] + chr(9632) + term[pos:]))

    c = vim.bindeval('getchar()')

    if isinstance(c, int):
        if c == 13:
            vim.command('q!')
            vim.command('{} wincmd W'.format(win_num))
            if len(matches) > 0:
                vim.command('e {}'.format(matches[vpos][0] + matches[vpos][1]))
            break
        if c == 27:
            vim.command('q!')
            break
        term = term[:pos] + chr(c) + term[pos:]
        pos += 1
    elif isinstance(c, bytes):
        if c[0] == 128:
            if c[1:] == b'kb':
                if pos > 0:
                    term = term[:pos-1] + term[pos:]
                    pos -= 1
            if c[1:] == b'kl':
                if pos > 0:
                    pos -= 1
            if c[1:] == b'kr':
                if pos < len(term):
                    pos += 1
            if c[1:] == b'kd':
                if vpos < len(matches) - 1:
                    vpos += 1
            if c[1:] == b'ku':
                if vpos > 0:
                    vpos -= 1
EOF

endfunction

command! -nargs=0 E call FastOpen()

map <C-o> :E<cr>
