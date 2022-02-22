from scrapy.spiders import CrawlSpider, Rule
from scrapy.linkextractors import LinkExtractor

class SpiderSpider(CrawlSpider):
    name = 'spider'
    allowed_domains = ['jensonusa.com']
    start_urls = ['https://www.jensonusa.com/']
    base_url = 'https://www.jensonusa.com/'

    rules = [Rule(LinkExtractor(allow='https://www.jensonusa.com/', deny='='),
        callback='parse_filter_bike', follow=True)]

    def parse_filter_bike(self, response):
        exists = response.xpath('//div[@class="breadcrumb"]/div/span/span[3]/a[@href="/complete-bikes"]').get()
        if exists:

            # GET Product Data
            id = response.xpath('//span[@itemprop="productId"]/text()').get()
            url_relative = response.xpath('//div[@class="breadcrumb"]/div/span/span[last()]/a/@href').get()
            url = response.urljoin(url_relative)
            category = response.xpath('//div[@class="breadcrumb"]/div/span/span[position()<7]/a/span/text()').getall()
            brand_logo_relative = response.xpath('//div[@class="product-brand-icon visible-lg visible-md pull-left"]/a/img/@src').get()
            brand_logo = response.urljoin(brand_logo_relative)
            colors = response.xpath('//div[contains(@class, "color")]/@data-attr-color').getall()
            title = response.xpath('//div[@class="product-name"]/h1/text()').get()
            star_rating = response.xpath('//meta[@itemprop="ratingValue"]/@content').get()
            price_current = response.xpath('//span[@id="price"]/text()').get()
            price_msrp = response.xpath('//span[@class="msrp "]/span/text()').get()
            price_discount = response.xpath('//span[@class="prcoff bright "]/text()').get()
            availability = response.xpath('//span[@itemprop="availability"]/text()').get().strip()
            description = response.xpath('//section[@id="product-description"]/p/text()').getall()
            make = response.xpath('//div[@class="product-brand-icon visible-lg visible-md pull-left"]/a/img/@alt').get()
            model = response.xpath('//span[@class="seProductBrandName"]/following-sibling::span/text()').get()
            images = response.xpath('//div[contains(@class, "product-main-image")][1]/div/a/@href').getall()
            video = response.xpath('//div[contains(@class, "is-video")]/p/iframe/@src').get()
            #sizes = response.xpath('//a[@class="prod-attsel-size"]/text()').getall()
            attribute_rows = response.css('table.spec tbody tr')
            attributes = {}
            for row in attribute_rows:
                key_column = row.css('th ::text').get()
                value_column = row.css('td ::text').get()
                attributes[key_column.strip()] = value_column.strip()

            # GET Metadata
            meta_description = response.xpath('//meta[@name="Description"]/@content').get().strip()
            meta_keywords = response.xpath('//meta[@name="Keywords"]/@content').getall()

            # GET Open Graph Data
            og_description = response.xpath('//meta[@property="og:description"]/@content').get()
            og_title = response.xpath('//meta[@property="og:title"]/@content').get()
            og_type = response.xpath('//meta[@property="og:type"]/@content').get()
            og_url = response.xpath('//meta[@property="og:url"]/@content').get()
            og_image = response.xpath('//meta[@property="og:image"]/@content').get()
            og_audio = response.xpath('//meta[@property="og:audio"]/@content').get()
            og_determiner = response.xpath('//meta[@property="og:determiner"]/@content').get()
            og_locale = response.xpath('//meta[@property="og:locale"]/@content').get()
            og_locale_alternate = response.xpath('//meta[@property="og:locale:alternate"]/@content').get()
            og_site_name = response.xpath('//meta[@property="og:site_name"]/@content').get()
            og_video = response.xpath('//meta[@property="og:video"]/@content').get()
            og_image = response.xpath('//meta[@property="og:image"]/@content').get()
            og_image_secure_url = response.xpath('//meta[@property="og:image:secure_url"]/@content').get()
            og_image_type = response.xpath('//meta[@property="og:image:type:"]/@content').get()
            og_image_width = response.xpath('//meta[@property="og:image:width"]/@content').get()
            og_image_height = response.xpath('//meta[@property="og:image:height"]/@content').get()
            og_image_alt = response.xpath('//meta[@property="og:image_alt"]/@content').get()
            og_video = response.xpath('//meta[@property="og:video"]/@content').get()
            og_video_secure_url = response.xpath('//meta[@property="og:video:secure_url"]/@content').get()
            og_video_type = response.xpath('//meta[@property="og:video:type"]/@content').get()
            og_video_width = response.xpath('//meta[@property="og:video:width"]/@content').get()
            og_video_height = response.xpath('//meta[@property="og:video:height"]/@content').get()
            og_audio = response.xpath('//meta[@property="og:audio"]/@content').get()
            og_audio_secure_url = response.xpath('//meta[@property="og:audio:secure_url"]/@content').get()
            og_audio_type = response.xpath('//meta[@property="og:audio:type"]/@content').get()

            # GET Twitter Data
            twitter_card = response.xpath('//meta[@name="twitter:card"]/@content').get()
            twitter_site = response.xpath('//meta[@name="twitter:site"]/@content').get()
            twitter_creator = response.xpath('//meta[@name="twitter:creator"]/@content').get()
            twitter_image = response.xpath('//meta[@property="twitter:image"]/@content').get()
            twitter_title = response.xpath('//meta[@property="twitter:title"]/@content').get()
            
            yield {
                    # Yield Product Data
                    'id': id,
                    'url': url,
                    'category': category,
                    'make': make,
                    'model': model,
                    'brand_logo': brand_logo,
                    'title': title,
                    'star_rating': star_rating,
                    'price_current': price_current,
                    'price_msrp': price_msrp,
                    'price_discount': price_discount,
                    'availability': availability,
                    'content': description,
                    'images': images,
                    #'sizes': sizes,
                    'video': video,
                    'colors': colors,
                    'attributes': attributes,

                    # Yield meta data
                    'description': meta_description,
                    'tags': meta_keywords,

                    # Yield Open Graph Data
                    'og_description': og_description,
                    'og_title': og_title,
                    'og_type': og_type,
                    'og_url': og_url,
                    'og_image': og_image,
                    'og_audio': og_audio,
                    'og_determiner': og_determiner,
                    'og_locale': og_locale,
                    'og_locale_alternate': og_locale_alternate,
                    'og_site_name': og_site_name,
                    'og_video': og_video,
                    'og_image': og_image,
                    'og_image_secure_url': og_image_secure_url,
                    'og_image_type': og_image_type,
                    'og_image_width': og_image_width,
                    'og_image_height': og_image_height,
                    'og_image_alt': og_image_alt,
                    'og_video': og_video,
                    'og_video_secure_url': og_video_secure_url,
                    'og_video_type': og_video_type,
                    'og_video_width': og_video_width,
                    'og_video_height': og_video_height,
                    'og_audio': og_audio,
                    'og_audio_secure_url': og_audio_secure_url,
                    'og_audio_type': og_audio_type,

                    # Yield Twitter Data
                    'twitter_card': twitter_card,
                    'twitter_site': twitter_site,
                    'twitter_creator': twitter_creator,
                    'twitter_image': twitter_image,
                    'twitter_title': twitter_title
            }
        
        else:
            print(response.url)