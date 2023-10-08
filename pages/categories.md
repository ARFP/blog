---
title: "Catégories"
permalink: /categories/
---

<section class="flex cards">
{% for cat in site.categories %}
<article id="cat-{{ tag[0] }}">
    <h2>{{ cat[0] }}</h2>
    <ul>
        {% for post in cat[1] %}
      <li><a href="{{ post.url | absolute_url }}">{{ post.title }}</a></li>
        {% endfor %}
    </ul>
</article>
{% endfor %}
</section>
