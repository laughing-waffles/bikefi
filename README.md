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




# Affiliate management
# Shareasale
https://shareasale.com/r.cfm?b=65889&u=3182058&m=11037&urllink=cambriabike%2Ecom%2Fcollections%2Fdemo%2Dbikes%2Fproducts%2Fsanta%2Dcruz%2Dnomad%2Dcc%2Dx01%2Dpike%2Dkit%2Dgreen%2Dlarge%2Ddemo%2D1&afftrack=

https://shareasale.com/r.cfm?b=1954161&u=3182058&m=121334&urllink=newurtopia%2Ecom%2Fpages%2Fe%2Dbike&afftrack=

https://www.shareasale.com/r.cfm?b=65889&u=3182058&m=11037

Best I can tell, each provider has their own url params (the `b=` and `m=` are unique across the same site, but different between sites. Then, to link to a specific page, you have to URL encode the link and append it via `&urllink=` 

`&afftrack=` is available if we wanted tracking back to a specific link (I suppose if we ran google ads, we could populate that parameter to see which ad the sale originated from, or something like that)

# Awin
Embed their script and it auto generates affiliate links
`<script src="https://www.dwin2.com/pub.1107513.min.js"></script>`
