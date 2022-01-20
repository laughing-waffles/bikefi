# financing.bike

### Pull data
`.github/pulldata.sh airtablekeyhere`

### Build
`bundle exec jekyll build`

### Serve
`bundle exec jekyll serve --livereload`


## Scraping bike data with Scrapy 

Followed [this tutorial](https://letslearnabout.net/tutorial/scrapy-tutorial/python-scrapy-tutorial-for-beginners-01-creating-your-first-spider/)  


Check that Python3 is installed  
`python3 --version`

If not Python3, then install Python from this url  
`https://www.python.org/downloads/`

Download pip  
`curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py`

Install pip  
`python3 get-pip.py`

Install pipenv  
`pip install pipenv`

Create a new virtual environment _(do this with each restart of terminal if you get an error like `zsh: command not found: scrapy`)_  
`pipenv shell`

Install Scrapy  
`pip install scrapy`

Install html2text  
`pip install html2text`

Crate a Scrapy project at /books/  
`scrapy startproject books`

The following file strucuture will be created:  
```
books/
    scrapy.cfg          <-- Configuration file (DO NOT TOUCH!)
    tutorial/
        __init__.py     <-- Empty file that marks this as a Python folder
        items.py        <-- Model of the item to scrap
        middlewares.py  <-- Scrapy processing hooks (DO NOT TOUCH)
        pipelines.py    <-- What to do with the scraped item
        settings.py     <-- Project settings file
        spiders/        <-- Directory of our spiders (empty by now)
            __init__.py
```

Create a spider by passing it the name and the root URL without ‘www’:  
`scrapy genspider spider google.com`

Run the spider  
`scrapy crawl spider`

Run the spider and save results to json file:   
`scrapy crawl spider -O bikes.json`
_The `-O` will overwrite an existing file. Use `-o` instead to append data to an exisiting file._