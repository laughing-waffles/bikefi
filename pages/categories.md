---
title: Categories
layout: page
permalink: categories
---

<div class="row">
  {% for item in site.data.categories %}
  <div class="col-md-6 mb-5">
    <div
      class="p-5 text-white rounded-3"
      style="background-image: url('{{ item.image }}'); background-size: cover; background-position: center;"
    >
      <h2 class="text-white">{{ item.title }}</h2>
      <p>
        Swap the background-color utility and add a `.text-*` color utility to
        mix up the jumbotron look. Then, mix and match with additional component
        themes and more.
      </p>
      <a href="{{ item.permalink | absolute_url }}" class="btn btn-outline-light">View products</a>
    </div>
  </div>
  {% endfor %}
</div>