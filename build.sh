#!/bin/bash

# Customisable data
now="`date +'%Y-%m-%d %H:%M:%S'`"
message="Gh Page update ($now)"
directory=dist
branch=gh-pages
build_command() {
  cp -a img/ dist/
  cp -a js/ dist/
  cp -a styles/ dist/
  cp index.html dist/
  cp sw.js dist/
  cp manifest.webmanifest dist/
}

# setup
echo -e "\033[0;32mDeleting old content...\033[0m"
rm -rf $directory

# create worktree on dist folder and check out gh-pages branch
echo -e "\033[0;32mChecking out $branch....\033[0m"
git worktree add $directory $branch

# build process
echo -e "\033[0;32mGenerating site...\033[0m"
build_command

# commit change on the gh-page branch
echo -e "\033[0;32mDeploying $branch branch...\033[0m"
cd $directory
git add --all
git commit -m "$message"

# deploying on GH
git push origin $branch

# cleanup
echo -e "\033[0;32mCleaning up...\033[0m"
cd ../
git worktree remove $directory
