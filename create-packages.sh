#! /bin/bash
mkdir -p ~/builds/custom-packages
rm ~/repo-packages/custom-packages/*.pkg.tar.xz*
n=0
while read gitURL; do 
    git clone $gitURL ~/builds/custom-packages/$n
    pushd ~/builds/custom-packages/$n
    makepkg -s --noconfirm
    cp ~/builds/custom-packages/$n/*.pkg.tar.xz* ~/repo-packages/custom-packages/
    popd
    n=$n+1
done < package-git-urls
rm -rf ~/builds/custom-packages/*
