#!/bin/sh

REPO_NAME=cogutils
DEB_NAME=opencog-cogutils

# You can find this in cogutils/opencog/util/cogutil.h
VERSION=2.0.3

DATE=`date "+%Y%m%d"`
GIT_HASH=`cd $REPO_NAME && git rev-parse --short=7 HEAD`
DEB_DIR_NAME=$DEB_NAME-$VERSION~git$DATE.$GIT_HASH
DEB_ARCHIVE_NAME=$DEB_NAME\_$VERSION~git$DATE.$GIT_HASH

rm -rf ~/.cache/guile

cd $REPO_NAME && git fetch upstream && git merge upstream/master && cd ..
cp -R $REPO_NAME $DEB_DIR_NAME

cd $DEB_DIR_NAME && rm -rf .git && find . -type f -name .gitignore -exec rm {} \; && cd ..

tar -cvjSf $DEB_ARCHIVE_NAME.orig.tar.bz2 $DEB_DIR_NAME

cp -R ../opencog-debian/cogutils/debian $DEB_DIR_NAME

cd $DEB_DIR_NAME && dch -v $VERSION~git$DATE.$GIT_HASH-1 && cd ..

cp $DEB_DIR_NAME/debian/changelog ../opencog-debian/$REPO_NAME/debian

