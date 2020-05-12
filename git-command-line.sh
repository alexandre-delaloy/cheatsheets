 ------------------------------------------------------------------------------------------------
|                                  GIT COMMAND LINE CHEATSHEET                                   |
|                                                                                                |
|                                by Alexandre Delaloy - @blyndusk                                |
 ------------------------------------------------------------------------------------------------

[0.0] - MY NOTATION
----
  [D]                                           Directory                            
  [D...]                                        Directory, directories
  [F]                                           File
  [F...]                                        Files
  [FD]                                          File, directory
  [FD...]                                       File, files, directory, directories


[1] - INTIALIZING A NEW REPOSITORY
----
  git init                                      Create a .git folder in the current workdir
  --                                            --
  git init [D]                                  Init a git repository in the directory at [D]
E.G.
  git init ~/foo


[2] - CLONING A REPOSITORY
----
  git clone [HTTPS/SSH]                         Create a copy of remote git repository in the 
                                                current working directory using remote link
  --                                            --
  git clone [HTTP/SSH] [D]                      Clone a repository in directory at [D]
  git clone -o [NAME] [HTTP/SSH]                Use [NAME] instead of the original repository name 
E.G.
  git clone git@github.com:mrdoob/three.js.git
  git clone https://github.com:mrdoob/three.js.git
  git clone -o bar git@github.com:mrdoob/three.js.git ~/foo


[3] - DISPLAY THE UNTRACKED AND STAGED FILES OF WORKING three
----
  git status                                    Display added/modified/renamed/deleted/untracked
                                                files in the working tree
  --                                            --
  git status -s                                 Display in short format
  git status --porcelain                        Display in short format, but easy-to-parse using
  git status -b                                 Display current branch
E.G.
  git status
  git status -s -b


[4] - ADDING FILES TO THE STAGING AREA
----
  git add [FD...]                               Add file(s), director(y/ies), subfile(s) and 
                                                subdirector(y/ies) at [FD... to the staging area
  --                                            --

E.G.
  git add ./bar foo.txt
  git add *


[5] - COMMITTING FILES IN THE STAGING AREA
----
  git commit -m [MESSAGE]                       Commit added files with a message at [MESSAGE]
  --                                            --
  git commit --amend                            View and/or edit the commit with default editor
E.G.
  git commit -m "Add: foobar"


[6] - PULLING AND PUSHING REMOTE CHANGES
----
  git pull                                      Fetch from defautl brznch of default repository url
  git push                                      Update remote repository with commited files
  --
  git pull [REPOSITORY] [BRANCH]                Fetch from [BRANCH] of remote [REPOSITORY]
  git push [REPOSITORY] [BRANCH]                Update remote [REPOSITORY] at [BRANCH]
E.G.
  git pull origin feature/api
  git pull upstream master  
  git push origin fix/auth                     


[7] - MOVING, RENAMING AND DELETING FILES IN THE STAGING ARENA
----
  git mv [OLDFILE] [NEWFILE]                    Rename [OLDFILE] to [NEWFILE] - using `mv` instead
                                                of `git mv` will delete the file, then create an 
                                                untracked file, while using `rm` will rename it
  git rm [F...]                                 Delete the file from the staging area. If you 
                                                create a file, then add it to the staging area    
                                                the delete it, it will still be in the staging area
                                                as 'added' then 'deleted'. `git rm` clear it 
E.G.
  git mv foo.txt bar.txt  
  git rm foobar.txt


[8] - DISPLAYING HISTORY AND LOGS
----
  git log                                       Output the list of commits ordered by date
  --                                            --
  git log --all                                 Output all actions
  git log --graph                               Output commits with a graph of all branches, merge
  git log --oneline                             Compact output and shorten commit id
  git log --decorate                            Add colors
E.G.
  git log
  git log --graph --oneline --decorate


[9] - CHANGING THE WORKING TREE / BRANCH
----
  git checkout [BRANCH]                         Change the working tree with [BRANCH]
  --                                            --  
  git checkout -b [BRANCH]                      Create a new branch [BRANCH] from the current
  git checkout -- [FD...]                       Reset the file with remote changes
E.G.
  git checkout -b fix/auth
  git checkout -- foo.txt


[10] - RESET BY UPDATING THE INDEX
----
  git reset [FD...]                             Update the index with remote changes at [FD...]
  --                                            --
  git reset --hard                              Reset index at last commit for all tracked files
E.G.
  git reset foo.txt


"origin" is a shorthand name for the remote repository that a project was originally cloned from. 


 ------------------------------------------------------------------------------------------------
|                                  GIT COMMAND LINE CHEATSHEET                                   |
|                                                                                                |
|                                by Alexandre Delaloy - @blyndusk                                |
 ------------------------------------------------------------------------------------------------