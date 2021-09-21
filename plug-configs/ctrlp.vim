let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_show_hidden = 1

let g:ctrlp_custom_ignore = {
        \ 'dir': '\v[\/]\(.git|node_modules)',
        \ 'file': '\v\(package.json|package-lock.json)',}
