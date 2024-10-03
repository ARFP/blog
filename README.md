# arfp.github.blog

Project DEV local installation on Windows

1. clone repository
2. install Ruby 2.7.x with DevKit
    - [https://rubyinstaller.org/](https://rubyinstaller.org/)
3. Open terminal, install Jekyll & bundler

```sh
    gem install jekyll -v3.9.3
    gem install bundler -v 2.4.22
```

4. Open terminal into project directory and type :

```sh
    bundler install
```
5. Test site locally : `bundler exec jekyll serve` 