let g:build_database_script = expand("<sfile>:p:h") . "/build-database"

function TagsLoaderBuildDatabase(dirs, patterns)
    let dir_flags = ""
    for dir in a:dirs
        let dir_flags .= "-d " . dir . " "
    endfor

    let pattern_flags = ""
    for pattern in a:patterns
        let pattern_flags .= "-p " . pattern . " "
    endfor

    exec "!" . g:build_database_script . " " . dir_flags . " " .  pattern_flags

    set tags=.tags/ctags.out
    cscope add .tags/cscope.out
endfunction
