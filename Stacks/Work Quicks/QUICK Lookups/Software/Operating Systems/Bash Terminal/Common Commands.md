# TERMINAL COMMANDS

- Remove entire folder and contents
$ rm -rf ./folder-path

- delete files by find
find ./ -name '*.pdf' -type f -delete

- create directory
$ mkdir ./path

- copy file with prompt to overwrite if applicable
$ cp -i /from.jpg /to.jpg

- read short file
$ cat filePath

- read long file
$ less filePath

- create blank file
$ touch empty.txt

- rename and move
$ mv abc.txt xyz.txt



# MAC

- Add bash aliases:
nano ~/.zshrc
source ~/.zshrc

- Flush DNS OS X Mavericks
$ dscacheutil -flushcache;sudo killall -HUP mDNSResponder

- Flush DNS OS X Lion(s)
$ sudo killall -HUP mDNSResponder
