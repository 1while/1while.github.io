call jekyll build
cd _site
git add -A
git commit -m "publish"
git push -u origin master
cd ..