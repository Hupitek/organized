# Fonction général:

grep -R '_printf' . --include="*.c" --exclude-dir="bootstrap" > res1 ; grep -R 'printf' . --include="*.c" --exclude-dir="bootstrap" > res2
grep -R 'my_strlen' . --include="*.c" --exclude-dir="bootstrap" >> res1 ; grep -R 'strlen' . --include="*.c" --exclude-dir="bootstrap" >> res2
grep -R 'my_strcat' . --include="*.c" --exclude-dir="bootstrap" >> res1 ; grep -R 'strcat' . --include="*.c" --exclude-dir="bootstrap" >> res2
grep -R 'my_strcmp' . --include="*.c" --exclude-dir="bootstrap" >> res1 ; grep -R 'strcmp' . --include="*.c" --exclude-dir="bootstrap" >> res2
grep -R 'my_strncmp' . --include="*.c" --exclude-dir="bootstrap" >> res1 ; grep -R 'strncmp' . --include="*.c" --exclude-dir="bootstrap" >> res2
grep -R 'my_strcpy' . --include="*.c" --exclude-dir="bootstrap" >> res1 ; grep -R 'strcpy' . --include="*.c" --exclude-dir="bootstrap" >> res2
grep -R 'my_strncpy' . --include="*.c" --exclude-dir="bootstrap" >> res1 ; grep -R 'strncpy' . --include="*.c" --exclude-dir="bootstrap" >> res2
grep -R 'my_strdup' . --include="*.c" --exclude-dir="bootstrap" >> res1 ; grep -R 'strdup' . --include="*.c" --exclude-dir="bootstrap" >> res2

grep -vFf res1 res2 > res

remove_file() {
    rm -f res1
    rm -f res2
    rm -f res
}

# tab_banned_function=("getpw" "getsp" "getgr" "fork" "clone" "openat" "getpass" "getlogin" "cuserid")            

# grep -R 'system' . --include="*.c" --exclude-dir="bootstrap" --exclude-dir="test_perso"> res
# for function in ${tab_banned_function[@]}
#     do
#         grep -R function . --include="*.c" --exclude-dir="bootstrap" --exclude-dir="test_perso">> res
#     done

if [ -s res ]
then
    echo 'banned function'
    cat res
    remove_file
    exit 1
else
    echo 'no problem'
    remove_file
    exit 0
fi