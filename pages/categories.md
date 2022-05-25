---
title: Categories
layout: page
sitemap: true
permalink: categories
---

<div class="row">
  {% assign cat_pages = site.pages | where: "isCat", "true" %}
  {% for item in cat_pages %}
  <div class="col-sm-6 mb-3">
    <div class="card bg-light text-white">
      <img src="{{ item.image }}" class="card-img" alt="...">
      <div class="card-img-overlay" style="background:linear-gradient(180deg, rgba(78, 78, 78, 0.4) 0%, rgba(0, 0, 0, 0.7) 90.16%)">
        <h2 class="card-title text-white">{{ item.title }}</h2>
        <p class="card-text text-white lead">{{ item.content | truncate: 150 }}</p>
        <a href="{{ item.url | absolute_url }}" class="btn btn-outline-light">View products</a>
      </div>
    </div>
  </div>
  {% endfor %} 
</div>