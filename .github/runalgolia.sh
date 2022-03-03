echo 'Starting Jekyll build'
chmod -R a+w /github/workspace
ALGOLIA_API_KEY='$1' bundle exec jekyll algolia