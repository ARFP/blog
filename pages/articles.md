---
title: "Derniers articles"
permalink: /articles/
---

<section class="flex cards">
{% for post in site.posts %}
<article class="post-article">
  <h2><a href="{{ post.url | absolute_url }}">{{ post.title }}</a></h2>
  <section>
  {{ post.excerpt }}
  </section>
</article>
{% endfor %}
</section>
