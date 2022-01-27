# setup
rm -rf dist
mkdir dist

# build process
cp -a img/ dist/
cp -a js/ dist/
cp -a styles/ dist/
cp index.html dist/
cp sw.js dist/
cp manifest.webmanifest dist/
