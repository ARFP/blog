---
title: "VueJS : Emit"
date: 2024-07-24 09:30:00 +0000 
categories: vuejs
tags: web js frontend 
author: mdevoldere
--- 

Vue.js est un framework JavaScript utilisé pour la création d’applications web SPA (Single Page Application) et MPA (Multi Pages Application). L’une de ses fonctionnalités les plus puissantes de VueJS est **emit**, qui permet aux composants de remonter des événements vers leurs parents. 

Ce guide détaillé vous expliquera comment utiliser VueJS emit dans votre projet VueJS.

## Qu'est-ce que VueJs emit ?

`$emit` est une méthode de communication entre les composants VueJs. Il vous permet de faire remonter des événements d'un composant enfant vers son parent. Cela signifie que vous pouvez déclencher une action dans un composant parent à partir d’un composant enfant.

## Pourquoi l'utiliser ?

L’utilisation de `$emit` est utile lorsqu'il est nécessaire de faire remonter des informations ou des événements d’un composant enfant vers le composant parent. Par exemple, si vous avez un formulaire dans un composant enfant et que vous voulez envoyer les données du formulaire au composant parent pour traitement, vous pouvez utiliser `$emit`.

## Comment l'utiliser VueJs emit ?

L’utilisation de `$emit` est relativement simple. Tout d’abord, vous devez déclarer un événement dans votre composant enfant en utilisant la méthode `$emit()`:

```js
this.$emit('eventName', data);
```

- `eventName`: le nom de l’événement
- `data`: les données transmises avec l’événement.

Ensuite, vous pouvez écouter l’événement dans le composant parent en utilisant la directive `v-on`:

```vue
<ChildComponent v-on:eventName="eventHandler"/>
```

- `eventHandler` est la méthode déclenchée dans le parent lorsque l’événement est déclenché par le composant enfant.

## Exemple complet d'utilisation de $emit

Voici un exemple complet montrant comment utiliser `$emit` dans votre code VueJs :

```js
// ParentComponent.vue 
<template>
  <div>
    <ChildComponent @eventName="eventHandler"/>
  </div>
</template>

<script>
import ChildComponent from './ChildComponent.vue'

export default {
  components: {
    ChildComponent
  },
  methods: {
    eventHandler (data) {
      console.log(data)
    }
  }
}
</script>
```

```js
// ChildComponent.vue
<template>
  <button @click="sendData">Envoyer les données</button>
</template>

<script>
export default {
    methods: {
        sendData () {
            this.$emit('eventName', 'Données transmises depuis le composant enfant')
        }
    }
}
</script>
```

Dans le code précédent, un composant parent `ParentComponent` inclut un composant enfant `ChildComponent`. 

Lors d'un clic sur le bouton dans le composant enfant, l’événement `eventName` est déclenché avec les données `‘Données transmises depuis le composant enfant‘`. Le composant parent écoute cet événement en utilisant la directive `@eventName` et appelle la méthode `eventHandler` lorsque l’événement est déclenché.

## Conclusion

`$emit` est une fonctionnalité puissante de VueJs permettant de faire remonter des événements d’un composant enfant vers un composant parent. Il est facile à utiliser et peut être un outil précieux pour la communication entre les composants dans votre application.
