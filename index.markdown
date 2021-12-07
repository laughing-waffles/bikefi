---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---


{% for collection in site.collections %}
{% assign name = collection.label %}
<section>
  <h1 class="text-white">{{ name }}</h1>
  {% for page in site.[name] %}
  <article>
	<h2 class="text-white">{{ page.title }}</h2>
	<p class="text-white">{{ page.content | markdownify }}</p>
  </article>
  {% endfor %}
</section>
{% endfor %}