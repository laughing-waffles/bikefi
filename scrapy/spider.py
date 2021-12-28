import scrapy


class SpiderSpider(scrapy.Spider):
    name = 'spider'
    allowed_domains = ['jensonusa.com']
    start_urls = ['https://jensonusa.com/']

    def parse(self, response):
        pass
