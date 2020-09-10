#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll="ls -l"
PS1='[\u@\h \W]\$ '
export EDITOR="vim"
export VISUAL="$EDITOR"
calc(){
        echo "scale=2;$*" | bc -l
}
nota(){
        note_file="$HOME/.notas"
        if [ "$#" -eq 0 ];then
                cat "$note_file"
        elif [ "$1" == "-c" ];then
                printf "" > "$note_file"
        elif [ "$1" == "-e" ];then
                vim "$note_file"
        elif [ "$1" == "-h" ];then
                echo "notas version $_version";
                echo "opçoes:"
                echo "  <nenhum argumeto> :listar o arquivo de notas"
                echo "  <texto> :adiciona o texto no arquivo de notas"
                echo "  -c :apagar arquivo de notas"
                echo "  -e :editar arquivo de notas"
        else
                echo "$*" >> "$note_file"
        fi
}
