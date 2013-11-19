# ~/.bash_completion.d/yaml_command

_yaml()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local pos=(COMP_CWORD - 1)
    local pre=${COMP_WORDS[@]:0:$pos}
    local cpl=$($pre _)

    if [[ "$cur" == -* ]]; then
        cpl=${cpl[@]//^[^-]/}
    else
        cpl=${cpl[@]//-*/}
    fi

    COMPREPLY=( $(compgen -W "$cpl" -- $cur) )
}
complete -F _yaml yaml

