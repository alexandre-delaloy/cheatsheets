 ------------------------------------------------------------------------------------------------
|                                  BASH COMMAND LINE CHEATSHEET                                  |
|                                                                                                |
|                                by Alexandre Delaloy - @blyndusk                                |
 ------------------------------------------------------------------------------------------------


[1] - GENERAL & SYSTEM


[1.0] - MY NOTATION
----
  [D]                                           Directory                            
  [D...]                                        Directory, directories
  [F]                                           File
  [F...]                                        Files
  [FD]                                          File, directory
  [FD...]                                       File, files, directory, directories


[1.1] - GETTING HELP
----
  man [cmd]                                     Read the manual for a given command
  [cmd] -h | --help                             Ask the command for help
E.G.
  man chmod
  chmod -h


[1.2] - GET INFORMATIONS
----
  uname -archive                                Display system and kernel
  date                                          Display system date
  uptime                                        Display uptime
  top                                           Display live informations about currently processes
  whoami                                        Display your username
  clear                                         Clear the current terminal


[1.3] - SHUTDOWN THE SYSTEM AT A GIVEN TIME
----
  shutdown [TIME]                               Shutdown the system at [TIME]
  --                                            --
  shutdown -s [TIME]                            The system is put to sleep at [TIME]
  shutdown -r [TIME]                            The system is rebooted at [TIME]
  shutdown -h [TIME]                            The system is halted at [TIME]
E.G.
  shutdown -h now
  shutdown -r 8:00


[1.4] - ENVIRONMENT VARIABLES
----
  printenv                                      Display all environment variables 
  --                                            --
  $USERNAME                                     The name of the user
  $HOSTNAME                                     The name of your computer
  $HOME                                         The home directory of the current user
  $PWD                                          The path to workdir directory
  $OLDPWD                                       The path to the previous workdir directory
  $PS1                                          The prompt settings
  $SHELL                                        The path to default shell
  $EDITOR                                       The path to default text editor


[1.5] - WILDCARDS AND REGULAR EXPRESSIONS
----
STANDARD WILDCARDS (GLOBBING PATTERNS)
  ?                                             Represent any single character
  *                                             Represent any number of character
  []                                            Specifies a range
  {}                                            Terms are separated by commas
  [!]                                           Logical NOT
REGULAR EXPRESSIONS
  .                                             Match any single character
  ?                                             Match between 0 and 1 of the precending token
  *                                             Match 0 or more of the precending token
  +                                             Match 1 or more of the precending token
  .*                                            Match any string, similar to * in standard
  ^                                             Match the beginging of a string / a line
  $                                             Match the end of a string / a line
  \                                             Used to escape character
  |                                             Logical OR
  []                                            Specifies a range
  [^]                                           Logical NOT
CATEGORIES OF CHARACTERS
  [:upper:] | A-Z                               Uppercase letters
  [:lower:] | a-z                               Lowercase letters
  [:alpha:] | A-z                               [:upper:] + [:lower:]
  [:digit:] | 0-9                               Numbers in decimal, 0 to 9
  [:alnum:] | A-z0-9                            [:upper:] + [:lower:] + [:digit:]
  [:space:]                                     Whitespace


[1.6] - RERUN COMMANDS AND REUSE ARGUMENTS
----
COMMAND RUN => [du -h /], [ls $HOME]
  ![a-z]                                        Rerun the command matching the [a-z] string
  !!                                            Rerun the last command
  !*                                            All arguments of the last command
  !^                                            First argument of the last command
  !$                                            Last argument of the last command
E.G.
  !d                                            => du -h /
  !ls                                           => ls $HOME
  !!                                            => ls $HOME
  !! | grep 'bar'                               => ls $HOME | grep 'bar'
  adduser john                                  => Permission denied
  sudo !!                                       => ok
  touch /bin/hello-world.sh                     => ok
  vim !*                                        => vim /bin/hello-world.sh
  chmod +x !*                                   => chmod +x /bin/hello-world.sh
  touch foo.txt bar.txt                         => ok
  ls !*                                         => ls foo.txt bar.txt
  ls !$                                         => ls bar.txt


[1.7] - INPUT / OUTPUT HANDLING
----
  [CMD] > [FILE]                                Standard output (stdout) of [CMD] to [FILE]
  [CMD] >> [FILE]                               Append the output of [CMD] into [FILE]
  [CMD1] | [CMD1]                               Stdout of [CMD1] to [CMD2]
  [CMD] > /dev/null                             Discard stdout of [CMD]
E.G.
  ls -la > foo.txt
  pwd >> bar.txt
  cat ~/.bash_history | grep 'docker' | less


[2] - FILES AND DIRECTORIES MANIPULATION, NAVIGATION AND DISPLAY


[2.1] - LISTING FILE(S) AND DIRECTOR(Y/IES) CONTENT
----
  ls [FD...]                                    List file(s) or director(y/ies) at [FD...]
  --                                            --
  ls [FD1...] [FD2...]                          List both [FD1...] and [FD2...]
  ls -a [FD...]                                 Show all files, including hidden files
  ls -l [FD...]                                 Long listing format
  ls -t [FD...]                                 Sort by last modified
  ls -S [FD...]                                 Sort by file size
  ls -R [FD...]                                 Recursive listing
  ls -F [FD...]                                 Show type of each file 
                                                (/=directory, *=executable, @=link)
E.G.
  ls ~/foo
  ls -laS $HOME ./bar


[2.2] - CHANGING DIRECTORY
----
  cd [D]                                        Change into the directory at [D]
  --                                            --
  cd                                            Change into your home directory ($HOME)
  cd ..                                         Go to the parent directory
  cd ../../ n times                             Go up n parent directories 
                                                (cd ../../../ => 3 parents directories)
  cd -                                          Change to the previous directory
  cd ~n                                         Change into n directory (see dirs command)
  pwd                                           Return working directory fullname
E.G.
  cd ~/foo
  cd ../../../../
  cd ~0


[2.3] - CREATING FILE(S) AND DIRECTOR(Y/IES)|
----
  mkdir [D...]                                  Create director(y/ies) at [D...]
  --                                            --
  mkdir -p [D...]                               Create one or more parents directories if needed 
                                                (mkdir -p foo/bar => 2 parents directories)
  touch [F...]                                  Create file(s) if does not exist
E.G.
  mkdir ./bar
  mkdir -p ~/foo/bar ./bar
  touch ~/foo/bar/foobar.txt
  touch foo.txt ~/foo/bar.txt


[2.4] - REMOVING FILE(S) AND DIRECTOR(Y/IES)
----
  rmdir [D...]                                  Remove director(y/ies) at [D...] (it must be empty)
  rm [F...]                                     Remove file(s) at [F...]
  --                                             --
  rm -r [FD...]                                 Recursively remove all files, subdirectories and
                                                files into subdirectories starting at [FD...]
  rm -i [F...]                                  Run in interactive mode
  rm -f [F...]                                  Remove regardless of the [F...] permissions
E.G.
  rmdir ~/foo ./bar
  rm -f ~/foo/bar/foobar.txt
  rm -ri ~/foo/bar
  rm -rf ~/foo ./bar


[2.5] - COPYING, MOVING AND RENAMING FILE(S) AND DIRECTOR(Y/IES)
----
  [cp/mv] [F...] [D]                            Copy/Move file(s) at [F...] to directory at  [D]
  --                                            --
  cp -r [FD...] [D]                             Copy file(s) and director(y/ies) recursively to [D]
                                                (directory, files, subdir and subfiles) 
  mv [OLDFILE] [NEWFILE]                        Rename [OLDFILE] to [NEWFILE]
E.G.
  [cp/mv] foo.txt bar.txt ~/bar/
  cp -r ~/foo/ ~/bar/
  mv foo.txt bar.txt  


[2.6] - DISPLAYING LIST OD CURRENTLY REMEMBERED DIRECTORIES
----
  dirs [D...]                                   Display the history of directories at [D...]
  --                                            --
  dirs -l                                       Long list format
E.G.
  dirs -l
  dirs ~


[2.7] - VIEWING FILE(S)
----
  cat [F...]                                    Display the content of file(s) at [F...]
  less [F...]                                   Browse throught a text file(s) at [F...]
  head [F...]                                   Output the top portion of file(s) at [F...]
  tail [F...]                                   Output the bottom of file(s) at [F...]
  --
  cat -n [F...]                                 Display with line numbers output
  [head/tail] -n [F...]                         Display n number of lines (10 by default)
E.G.
  cat -n foo.txt
  head -6 foo.txt


[2.8] - EDITING FILE(S)
----
  vim [F...]                                    Use vim editor to view/modify a file(s) at [F...]
  nano [F...]                                   Use nano editor to view/modify a file(s) at [F...]
E.G.
  vim foo.txt  
  nano bar.txt


[2.9] - SORTING FILE(S) CONTENT
----
  sort [F...]                                   Sort/merge lines of text/binary file(s) at [F...]
  --                                            --
  sort -r [F...]                                Sort in reverse order
  sort -u [F...]                                Suppress all lines that is equal to another
  sort -o [OUTPUT_FILE] [F...]                  Print the output to [OUTPUT_FILE]
  sort -k n [F...]                              Sort by key (n is the field number)
E.G.
  sort -ru -o bar.txt foo.txt
  sort -k 2 foo.txt


[2.10] - SEARCH PATTERN IN FILE AND STRING
----
  grep [PATTERN] [F...]                         Search [PATTERN] in file(s) at [F...]
  --                                            --
  grep -E [PATTERN] [F...]                      Search with extended regex
  grep -f [PATTERN_FILE] [F...]                 Search with a file pattern using [PATTERN_FILE]
  grep -i [PATTERN] [F...]                      Search with case insensitive
  grep -o [PATTERN] [F...]                      Output only the match, not the entire line
  grep -n [PATTERN] [F...]                      Prefix output with line number
E.G.
  ls -la | grep '[[:digit:]]'
  cat foo.txt | grep -nio 'foo'
  grep -E '^[A-Z]+*[0-9]' foo.txt 
  grep -f patterns.txt foo.txt


[2.11] - STREAM EDIT AND TEXT TRANSFORMATION
----
  sed 's/[FIND]/[REPLACE]/[FLAGS]' [F...]       Output the file with [FIND] pattern replaced with           
                                                [REPLACE], with optional [FLAGS] at [F...]
  --                                             --
  sed 's///' [F...] > [F]                       Create a new file with the output of original file
  sed -i.bak 's///' [F...]                      Create a backup file (foo.txt.bak), rewrite foo.txt
  sed -e 's///' -e 's///' [F...]                Using multiple expressions
  sed -E 's///' [F...]                          Search with extended regex
  sed -f [PATTERN_FILE] [F...]                  Search with a file pattern using [PATTERN_FILE]
E.G.
  cat foo.txt | sed 's/foo/bar/'
  sed -i.backup -f foo.sed foo.txt
  sed -E 's/^[A-Z]+[^0-9]/bar' foo.txt 


[2.12] - FINDING FILES IN DIRECTOR(Y/IES)
----
  find [D...] -name [NAME]                      Find files matching the [NAME] in director(y/ies) 
                                                at [D...] 
  --                                            --
  find [D...] -name [NAME] -type [TYPE]         Find files with specific type
  find [D...] -name [NAME] -delete              Find files and delete them
  find [D...] -path [EXPR]                      Find files matching a pattern
E.G.
  find ~/foo -name 'foo'
  find ./bar -type f -delete
  find -path '*Library*' -type d -name 'bar'


[2.13] - CHANGE FILE MODE, ACCESS, PREMISSIONS AND OWNER
----
  chmod [MODE] [F...]                           Change mode of file(s) at [F...]
  chown [OWNER]:[GROUP] [F...]                  Change owner and group of file(s) at [F...]
  --                                            --
  chmod -R [MODE] [D...]                        Change permission of director(y/ies), subfile(s)
                                                and subdirector(y/ies)
  chown -R [OWNER]:[GROUP] [D...]               Change owner and group of director(y/ies), 
                                                subfile(s) and subdirector(y/ies)
E.G.
  chmod +x-rw foo.sh
  chmod -R 600 ~/foo ./bar
  chown user1 foo.sh


[2.14] - MANIPULATING TAR ARCHIVE(S)
----
  tar -[ctx]f [OUTPUT_FILE] [FD...]             Manipulate archive from file(s) and director(y/ies)
OPTIONS
  -c                                            Create a tar archive
  -x                                            Extract files from the archive
  -t                                            Display the table of contents (list)
  -v                                            Be verbose
  -z                                            Use compression
  -f [OUTPUT_FILE]                              Output archive file to [OUTPUT_FILE]
E.G.
  tar -czvf foo.gz ~/foo                        Create a archive named 'foo.gz' from the 'foo' dir
                                                using verbose and compression
  tar -tf foo.gz                                List 'foo.gz' files in archive
  tar -xzf foo.gz                               Extract 'foo.gz' content in the workdir


[2.15] - DISPLAYING DISK USAGE STATE
----
  du                                            Estimate file(s) usage (all files in workdir)
  --                                            --
  du [FD...]                                    Estimate file(s) usage at [FD...]
  du -h                                         Display size in human readable format (octets)
  du -k                                         Display size in Kilobytes
E.G.
  du ~/foo ./bar
  du -h /


[3] - NETWORK


[3.1] - REMOTE LOGIN TO A HOST OR INSTANCE
----
  ssh [USER]@[HOST]                             Establish a SSH connection to the [HOST] with user [USER]
  --
  ssh -i [SSHKEY] [USER]@[HOST]                 Connect using the provided private SSH key
  ssh -p [PORT] [USER]@[HOST]                   Connect with a specific port
E.G.
  ssh ubuntu@35.181.54.187
  ssh -i ~/.ssh/foo_key ubuntu@35.181.54.187
  ssh -p 666 ubuntu@35.181.54.187


[3.2] - STATUS OF A HOST
----
  ping [HOST]                                   Ping [HOST] and display STATUS
  --                                            --
  ping -c n [HOST]                              Stop after receiving n packets
  ping -i n [HOST]                              Wait n seconds between sending each packet
  ping -v [HOST]                                Show verbose output
E.G.
  ping google.com
  ping -c 6 -i 2 -v reddit.com


[3.3] - TRANSFER A URL
----
  curl [URL]                                    Output the response of the URL
  --                                            --
  curl [URL] > [F]                              Output written in file at [F]
  curl -sS [URL]                                Silent mode, only show errors
  curl -sS [URL] | [LANGUAGE]                   Execute the response with a specific [LANGUAGE]
E.G.
  curl localhost:80 
  curl localhost:80 > foo.sh
  curl -sS localhost:80 | sh


[3.4] - GET INFORMATION ABOUT A DOMAIN
----
  whois [DOMAIN]                                Get all informations about a [DOMAIN]
  --                                            --
  whois -h [HOST]                               Use specific [HOST]
  whois -p [PORT]                               Use specific [PORT]
E.G.
  whois reddit.com
  whois -p 666


 ------------------------------------------------------------------------------------------------
|                                  BASH COMMAND LINE CHEATSHEET                                  |
|                                                                                                |
|                                by Alexandre Delaloy - @blyndusk                                |
 ------------------------------------------------------------------------------------------------
