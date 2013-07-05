#!/bin/sh -x

CAT="/bin/cat"
ECHO="/bin/echo"
MKDIR="/bin/mkdir"
RM="/bin/rm"

${ECHO} -e "\n\e[1;36;40mUnitial is started to initial your Unix-like working environment\n\nPlease wait...\n\n \e[0m";

os=`uname`
if [ $os = "Linux" ]
then
    ${ECHO} -e "\n\e[1;36;40mYour operating system is GNU/Linux\n\e[0m";
    download='wget -nv'
    download_o='wget -nv -O'
else
    ${ECHO} -e "\n\e[1;36;40mYour operating system is NOT GNU/Linux\nmaybe a BSD system!?\n\e[0m";
    download='fetch'
    download_o='fetch -o'
fi

path='https://raw.github.com/PeterDaveHello/Unitial/master/'

${ECHO} -e "\n\e[1;36;40mTyy to download and setup configs from server...\n\e[0m";
for files in gitconfig tcshrc bash_profile inputrc vimrc
do
    ${download} "$path""$files"
    ${CAT} "$files" >> ~/."$files"
    ${RM} "$files"
done

${ECHO} -e "\n\e[1;36;40mAdd some color setting which depends on your OS...\n\e[0m";
if [ $os = "Linux" ]
then
    ${ECHO} "alias ls='\ls -GF --color=auto'" >> ~/.bash_profile
    ${ECHO} "alias ls '\ls -GF --color=auto'" >> ~/.tcshrc
else
    ${ECHO} "export LSCOLORS=gxfxcxdxbxegedabagacad" >> ~/.bash_profile
fi

${ECHO} -e "\n\e[1;36;40mTyy to download VIM color scheme from server...\n\e[0m";
${MKDIR} -p ~/.vim/colors/
${download_o} ~/.vim/colors/kolor.vim https://raw.github.com/zeis/vim-kolor/master/colors/kolor.vim
${ECHO} -e "\n\e[1;36;40mTyy to download git's auto completion configs from server...\n\e[0m";
${download_o} ~/.git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash

${ECHO} -e "\n\e[1;36;40mUnitial is finished!\n\nPlease terminate all other works and restart your shell or re-login.\n \e[0m";
