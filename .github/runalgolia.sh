echo 'Starting Jekyll build'
chmod -R a+w /github/workspace
ALGOLIA_API_KEY='${{ secrets.ALGOLIA_API_KEY }}' bundle exec jekyll algolia