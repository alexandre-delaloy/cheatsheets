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


[0.1] - LOCAL GIT STATES

 --------------------------------------------------------------------------------------------------
|                                |                                 |                               |
|       WORKING DIRECTORY        |          STAGING AREA           |   REPOSITORY (.GIT FOLDER)    |
|                                |                                 |                               |
 --------------------------------------------------------------------------------------------------


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


[9] - COMPARING GIT STATES
----
  git diff                                      Output changes between workdir and staging area
  --                                            --
  git diff HEAD                                 Output changes between workdir and git repository
  git diff --staged HEAD                        Output changes between staged area and git repo
  git diff -- [F...]                            Limits the output to [F...]
  git diff [COMMITID1] [COMMITID2]              Output changes between 2 commits
  git diff [BRANCH1] [BRANCH2]                  Output changes between 2 branches
E.G. 
  git diff -- foo.txt
  git diff 342dca5 416babd
  git diff HEAD HEAD^                           Compare HEAD and HEAD minus 1
  git diff master origin/master                 Compare local master br and remote master branch
  

[10] - MANIPULATING BRANCHES
----
  git branch                                    List all the branches in the working tree
  --                                            --
  git branch -a                                 List all the branches, local and remote
  git branch -d [BRANCH]                        Delete the branch at [BRANCH]
  git branch -D [BRANCH]                        Shorcut for `--delete --force`
  git branch -m [OLDBRANCH] [NEWBRANCH]         Rename [OLDBRANCH] to [NEWBRANCH]
E.G.
  git branch -D fix/auth
  git branch -m feature/route feature/routes


[11] - CHANGING THE WORKING TREE / BRANCH
----
  git checkout [BRANCH]                         Change the working tree with [BRANCH]
  --                                            --  
  git checkout -b [BRANCH]                      Create a new branch [BRANCH] from the current
  git checkout -- [FD...]                       Reset the file with remote changes
E.G.
  git checkout develop
  git checkout -b fix/auth
  git checkout -- foo.txt


[12] - RESETTING BY UPDATING THE INDEX
----
  git reset [FD...]                             Update the index with remote changes at [FD...]
  --                                            --
  git reset --hard                              Reset index at last commit for all tracked files
  git reset HEAD^                               Reset the last commit
  git reset HEAD~[NUMBER]                       Reset [NUMBER] of last commits at current branch
E.G.
  git reset foo.txt


[13] - MERGING DIFFERENT DEVELOPMENT HISTORIES
----
  git merge [BRANCH]                            Merge the [BRANCH] to the current branch
  --                                            --      
  git merge [BRANCH] -m [MESSAGE]               Merge with a custom message      
E.G.
  git merge fix/auth -m "fix auth"


[14] - RE-APPLYING COMMITS FROM A BRANCH TO THE CURRENT
----
  git rebase [BRANCH]                           Rebase from [BRANCH]
  --                                            --
  git rebase --abort                            Abort the rebase operation and reset HEAD to branch
  git pull -r origin master                     Rebase after fetching
E.G.
  git rebase master


[15] - DOWNLOADING DATA FROM A BRANCH
----
  git fetch [BRANCH]                            Dowmload new data from [BRANCH] 
E.G.
  git fetch origin master


[16] - CLEANING THE WORKING DIRECTRY BY SAVING MODIFICATIONS TO APPLY THEM LATER
----
  git stash                                     Save all the modifications in a stash
  --                                            --
  git stash -u                                  Stash all untracked files too
  git stash branch [BRANCH]                     Create a new [BRANCH], then move into,
                                                then stash applied and drop
  git stash save [MESSAGE]                      Create a stash with a custom message
  git stash show [NUMBER]                       Show insertions and deletions of files of stash
  git stash list                                List all saved stashs
  git stash apply [NUMBER]                      Put back files modification from the stash to the
                                                working tree   
  git stash pop [NUMBER]                        Like `apply`, but remove the stash from the list
  git stash drop [NUMBER]                       Remove the [NUMBER] stash from the list
  git stash clear                               Remove all the stashs from the list
E.G.
  git stash 
  git stash save "foo stash"-u
  git stash pop stash@{1}
(if [NUMBER] not provided, use last stash as default)

[17] - CREATING, EDITING, DELETING TAGS IN GIT
----
  git tag [TAG]                                 Create a tag with [TAG] name
  --                                            --
  git tag -a [ANNOTED_TAG]                      Add an annotation to the tag
  git tag -a [ANNOTED_TAG] [COMMITID]           Add an annotation to the tag and point a commit 
                                                using [COMMITID]
  git tag -a [ANNOTED_TAG] -f [COMMITID]        Add an annotation to the tag and replace a commit
                                                existing tag at [COMMITID]
  git tag [TAG] -m [MESSAGE]                    Idem but in one line
  git tag --list                                List all the TAGS
  git tag --delete [TAG]                        Delete [TAG]
  git show [TAG]                                Output the logs for the tag
  git push [REPOSITORY] [BRANCH] --tags         Push any missing tag to the remote repository
  git push [REPOSITORY] :[TAG]                  Delete the [TAG] from remote repository
E.G.
  git tag alpha
  git tag -a v0.1.0
  git show v0.1.0 


"origin" is a shorthand name for the remote repository that a project was originally cloned from. 


 ------------------------------------------------------------------------------------------------
|                                  GIT COMMAND LINE CHEATSHEET                                   |
|                                                                                                |
|                                by Alexandre Delaloy - @blyndusk                                |
 ------------------------------------------------------------------------------------------------