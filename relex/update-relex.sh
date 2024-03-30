
#!/bin/sh

REPO_NAME=relex
DEB_NAME=opencog-relex

# You can find this in README.md
VERSION=1.6.3

DATE=`date "+%Y%m%d"`
GIT_HASH=`cd $REPO_NAME && git rev-parse --short=7 HEAD`
DEB_DIR_NAME=$DEB_NAME-$VERSION~git$DATE.$GIT_HASH
DEB_ARCHIVE_NAME=$DEB_NAME\_$VERSION~git$DATE.$GIT_HASH

cd $REPO_NAME && git fetch upstream && git merge upstream/master && git push && cd ..
cp -R $REPO_NAME $DEB_DIR_NAME

cd $DEB_DIR_NAME && rm -rf .git && find . -type f -name .gitignore -exec rm {} \; && cd ..

tar -cJf $DEB_ARCHIVE_NAME.orig.tar.xz $DEB_DIR_NAME

cp -R debian $DEB_DIR_NAME

cd $DEB_DIR_NAME && dch -D mhatta-unstable --force-distribution -v $VERSION~git$DATE.$GIT_HASH-1 "New upstream snapshot." && cd ..

cp $DEB_DIR_NAME/debian/changelog debian
