
# [EasyMark]

<div class="center">
  <h4 class="title">Tenha controle sobre suas metas!</h4>
  <h5 class="subtitle">Controle facilmente informações valiosas que te permitirão maximizar os lucros da sua loja</h5>
  <h5 class="subtitle2">Rápido, fácil e intuitivo </h5>
</div>




![ruby](https://img.shields.io/badge/Ruby-2.4.1-red.svg)
![rails](https://img.shields.io/badge/Rails-5.0.1-red.svg)
![docker](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)
[ ![Codeship Status for igormelao/easymark](https://app.codeship.com/projects/f5581220-a26a-0135-436c-7a11b80692af/status?branch=master)](https://app.codeship.com/projects/254702)


# Basic Overview

<p>Um Easy Mark é um aplicativo para proprietários de lojas que necessitam controlar facilmente metas de vendas a serem cumpridas pelo seus vendedores. No aplicativo, o proprietário poderá cadastrar lojas, vendedores e metas de vendas periódicas. O sistema irá automaticamente subdividir as metas em metas diárias, 	permitindo um controle mais preciso. O proprietário irá cadastrar o valor total de cada meta diária e associar quais vendedores irão participar. O proprietário também poderá visualizar o valor total de todas as metas individuais de cada vendedor.</p>


Enjoy it!

# Demo

<a href="https://easymark.herokuapp.com/">Easy Mark</a>

# Require
```
  * Rails 5.0.1
  * Ruby 2.2.3
  * Docker
  * Docker Compose
  * Postgres
  * Devise
  * Materialize
  * FFaker
  * FactoryBot
  * Rspec
  * Capybara
```


# Getting Started

### 1. Do a fork at original repository
```
  git@gitlab.com:igormelao/easymark.git
```

### 2. Clone your fork at a local repository

### 3. Build you project with docker-compose
```
   $ docker-compose build      
```

### 4. Start docker-compose
```
   $ docker-compose up
```

### 4. Run all migrations
```
   $ docker-compose run --rm website rails db:create db:migrate      
```

### 5. How to execute other commands
```
$ docker-compose run --rm website commandName
```

### 6. Install new gems
```
Always when you install a new gem execute step 3
```

### 7. Start APP
```
$ docker-compose up
```

### 8. Test App
```
$ docker-compose run --rm website rails rspec
```

## How to contribute to the project

### 1. Add the remote repository source at your local repositoy
```
$ git remote add upstream git@gitlab.com:igormelao/easymark.git
```

### 2. Sync your repository with the original repository
```
$ git fetch upstream
```

### 3. Update your local repository
```
$ git checkout master
$ git merge upstream/master
```

### 4. Work on it and send your changes
```
$ git push origin master
```

### 5. Do a pull request at your fork on GitHub


\\_o_// HAO! Live long and prosper!
