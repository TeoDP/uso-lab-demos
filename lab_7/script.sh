#! /usr/bin/bash

export teste='5'

case $1 in

    1)
    # vrem sa ne afiseze doar testele obligatorii, si doar coloana cu numarul testului si daca e passed sau nu
    echo "./a.out | grep test | grep -v valgrind | cut -d ' ' -f2,4"
    ;;

    2)
    # vrem alta metoda ca sa ne arate toata linia pentru testele obligatorii
    echo './a.out | head -n -3 | tail -n +3 | sed -n "p;n"'
    ;;

    3)
    # vrem sa ne arate toate testele de valgrind, dar sa lase un singur punct in loc de toata linia de puncte
    echo "./a.out | grep test | grep valgrind | sed 's/\.\+/./g'"
    ;;

    4)
    # printeaza in tertminal toate numerele de la 1 la 10
    echo 'for i in $(seq 1 10); do echo "$i"; done'
    ;;

    5)
    # ne spune daca 2 argumente adaugate ulterior sunt identice
    echo 'if test -z $3 || test -z $4; then echo "please give two more arguments so that they can be compared"; exit; fi'
    echo 'if test $3 = $4; then echo "yes"; else echo "no"; fi"'
    ;;

    run)
    case $2 in

        1)
        make clean &> /dev/null
        make > /dev/null
        ./a.out | grep test | grep -v valgrind | cut -d ' ' -f2,4
        ;;

        2)
        make clean &> /dev/null
        make > /dev/null
        ./a.out | head -n -3 | tail -n +3 | sed -n "p;n"
        ;;

        3)
        make clean &> /dev/null
        make > /dev/null
        ./a.out | grep test | grep valgrind | sed 's/\.\+/./g'
        ;;

        4)
        for i in $(seq 1 10); do echo "$i"; done
        ;;

        5)
        if test -z $3 || test -z $4; then echo "please give two more arguments so that they can be compared"; exit -1; fi
        if test $3 = $4; then echo "yes"; else echo "no"; fi
        ;;

        *)
         echo -e "\033[0;31m ! incorrect use ! \033[0m\
        \nthe script takes as argument a number from 1 to $teste\
        \nor 'run' and then a number from 1 to $teste\
        \nexample:\
        \n$0 1\
        \n$0 run 3"
        ;;
    esac
    ;;

    *)
    echo -e "\033[0;31m ! incorrect use ! \033[0m\
    \nthe script takes as argument a number from 1 to $teste\
    \nor 'run' and then a number from 1 to $teste\
    \nexample:\
    \n$0 1\
    \n$0 run 3"
    ;;
esac

make clean &> /dev/null
