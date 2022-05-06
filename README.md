# bikefi.net

### Pull data

`./.github/pulldata.sh ${{ secrets.AIRTABLE_KEY }}`  is the script to pull down airtable data into the jekyll for page auto-gen.

it has a new variable available, `./.github/pulldata.sh ${{ secrets.AIRTABLE_KEY }} fast`  (append fast after your key) and it will only load 1 row from each table (1 bike shop, 1 bike, presently).

This is applied on the `fast` branch as well - so if you need to test something with shorter build times, merge into the fast branch. that branch does not push the site anywhere (it just builds and then finishes)

### Build
`bundle exec jekyll build`

### Serve
`bundle exec jekyll serve --livereload`

## Theme

Built with Bootstrap and the Coach theme: https://codescandy.com/coach/index.html

## Favico Generation

I made the initial favicon.ico using https://gauger.io/fonticon/. selecting the "advanced" download opens this service, which generated variations for all device and code generation: https://realfavicongenerator.net/
