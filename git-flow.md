

#### Develop and Master Branches

- **Master**
  - The master branch stores the **official release** history
- **Develop**
  - the develop branch serves as an integration branch for **features**

~~~sh
## set up your username/email in the git config
git --version
git config --list
git config --global user.name "yourname"
git config --global user.email "youremail"
git config --global push.default current
git branch -a                              # list all the branches


git pull origin master
git push origin master

git branch develop                          # adding develop branch
git push -u origin develop

git branch new-feature-name                 # create a new branch
git checkout new-feature-name               # switch to working on this branch
git branch                                  # list which branch you are currently on

git push -u origin new-feature-name         # push changes to Branch to Remote

git checkout master                         # developer switch to local master
git pull origin master                      # developer pull Master updates from Remote
git branch --merged                         # list the branch that already merged, so for only master, because nothing from branch merged
git merge new-feature-name                  # this will merge the Branch to Master
git push origin master                      # then after merge, push to the master 
git branch --merged                         # make sure listed the merged branch
# OR
git merge --squash new-feature-name         # merge the last commit of branch to master
# OR -> rebase - branch
git checkout new-feature-name
git rebase master
# OR -> rebase - master
git checkout master
git rebase new-feature-name


git branch -d new-feature-name              # delete branch, because it is merged to master, this branch no longer needed -> this command only deleted locally
git branch -a                               # make sure the branch is gone locally, but still on remote
git push origin --delete new-feature-name   # delete the branch from remote
git branch -a                               # check again, both local and remote branch gone

######### quick example #########

git clone [project-url...]
git branch                  # you will see the result below
#   develop
# * master

git checkout develop        # all branch goes from 'develop'

git branch [new-feature]    # create new branch, can be based on features or developer
git checkout [new-feature]
# change your code on reqirement, after you've done, or for everyday commit, do this:
git status
git add .
git commit - m "comments..."
git push -u origin [new-feature]    # please remember add the branch-name

# this is used for merge branch to the master/develop
git checkout master
git pull origin master
git merge [new-feature]
git push origin master


~~~