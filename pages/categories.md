---
title: Categories
layout: page
permalink: categories
---

<div class="row">
  {% for item in site.categories_pages %}
  <div class="col-sm-6 mb-3">
    <div class="card bg-light text-white">
      <img src="{{ item.image }}" class="card-img" alt="...">
      <div class="card-img-overlay" style="background:linear-gradient(180deg, rgb(0 0 0 / 40%) 0%, rgb(149 149 149 / 40%) 90.16%);">
        <h2 class="card-title text-white">{{ item.title }}</h2>
        <p class="card-text text-white">{{ item.content }}</p>
        <a href="{{ item.permalink | absolute_url }}" class="btn btn-outline-light">View products</a>
      </div>
    </div>
  </div>
  {% endfor %}
</div>