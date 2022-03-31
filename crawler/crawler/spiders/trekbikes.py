import scrapy


class TrekbikesSpider(scrapy.Spider):
    name = 'trekbikes'
    allowed_domains = ['trekbikes.com']
    start_urls = [
            'https://www.trekbikes.com/us/en_US/bikes/hybrid-bikes/electric-hybrid-bikes/c/B550/',
        ]

    def parse(self, response):
        for product in response.css('li.productListItem'):
            yield {
                'image': product.xpath('//img/src()').get(default='NILL'),
                'title': product.css('h3.product-tile__title::text').get(),
                'price': product.css('span.product-tile__saleprice::text').get(),
            }
