NOT to forget..

## Create a new repository on the command line

    $ touch README.md
    $ git init
    $ git add README.md
    $ git commit -m "first commit"
    $ git remote add origin https://github.com/shoheik/dotfiles.git
    $ git push -u origin master
 
## Push an existing repository from the command line

    $ git remote add origin https://github.com/shoheik/dotfiles.git
    $ git push -u origin master

## obtain Submodule 

    $ git submodule init .vim/vundle.git/
    $ git submodule update .vim/vundle.git/

