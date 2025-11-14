#!/bin/bash
flutter build web --release --base-href="/$REPO_NAME/"
git checkout gh-pages
cp -r build/web/* .
git add .
git commit -m "Update demo"
git push origin gh-pages
git checkout main

# chmod +x deploy.sh
# ./deploy.sh