import scrapy
from scrapy.crawler import CrawlerProcess

class jensonusa(scrapy.Spider):
    name = 'jensonusa'
    allowed_domains = ['jensonusa.com']
    start_urls = ['https://jensonusa.com/']

    def parse(self, response):
        pass

class trekbikes(scrapy.Spider):
    name = 'trekbikes'
    allowed_domains = ['trekbikes.com']
    start_urls = ['https://www.trekbikes.com/us/en_US/']


process = CrawlerProcess(settings={
    "FEEDS": {
        "items.json": {"format": "json"},
    },
})

process.crawl(MySpider)
process.start() # the script will block here until the crawling is finished