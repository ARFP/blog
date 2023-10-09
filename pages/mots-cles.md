---
title: "Mots clés"
permalink: /mots-cles/
---

<section class="flex cards">
{% for tag in site.tags %}
<article id="tag-{{ tag[0] }}">
    <h2>{{ tag[0] }}</h2>
    <ul>
        {% for post in tag[1] %}
      <li><a href="{{ post.url | absolute_url }}">{{ post.title }}</a></li>
        {% endfor %}
    </ul>
</article>
{% endfor %}
</section>
