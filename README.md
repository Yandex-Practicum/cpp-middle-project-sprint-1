# cpp-middle-project-sprint-1 <!-- omit in toc -->

- [Начало работы](#начало-работы)
- [Сборка проекта и запуск тестов](#сборка-проекта-и-запуск-тестов)
  - [Команды для сборки проекта](#команды-для-сборки-проекта)
  - [Команды для запуска приложения](#команды-для-запуска-приложения)
  - [Команда для запуска тестов](#команда-для-запуска-тестов)


Шаблон репозитория для практического задания 1 спринта «Мидл разработчик С++»

## Начало работы

1. Нажмите зелёную кнопку `Use this template` и затем `Create a new repository`
2. Дайте имя вашему репозиторию. При выборе названия воспользуйтесь рекомендациями с сайта https://dongtienvietnam.com/github-repository-name-convention/
3. Склонируйте созданный репозиторий командой `git clone your-repository-name`
4. Создайте новую ветку командой `git switch -c development`
5. Откройте проект в `VisualStudio Code`
6. Нажмите `F1` и откройте проект в dev-контейнере командой `Dev Containers: Reopen in Container`

## Сборка проекта и запуск тестов

Данный репозиторий использует 2 инструмента:

- conan — свободный менеджер пакетов с открытым исходным кодом (MIT), разработанный для C и C++. Позволяет настраивать процесс сборки программ, скачивать и устанавливать сторонние зависимости и необходимые инструменты. Для ознакомления с основами этого инструмента, вы можете прочитать следующие статьи:
  - https://habr.com/ru/articles/884464/
  - https://docs.conan.io/2.0/tutorial/consuming_packages/build_simple_cmake_project.html
  - https://docs.conan.io/2.0/tutorial/consuming_packages/the_flexibility_of_conanfile_py.html
- cmake - генератор систем сборки, разработанный для C и C++. Позволяет создавать проекты, которые могут компилироваться на различных платформах и с различными компиляторами. Для ознакомления с основами этого инструмента, вы можете прочитать следующие статьи:
  - https://dzen.ru/a/ZzZGUm-4o0u-IQlb
  - https://neerc.ifmo.ru/wiki/index.php?title=CMake_Tutorial
  - https://cmake.org/cmake/help/book/mastering-cmake/cmake/Help/guide/tutorial/index.html

### Команды для сборки проекта

```bash
mkdir build ; cd build

# Вызывается один раз перед сборкой проекта, чтобы скачать и установить все необходимые зависимости
conan install --settings=build_type=Debug --build=missing ..

# Вызывается каждый раз, когда необходимо собрать проект
conan build --settings=build_type=Debug ..
```

### Команды для запуска приложения

```bash
echo "Hello OpenSSL crypto world!" > input.txt

./CryptoGuard -i input.txt     -o encrypted.txt -p 1234 --command encrypt
./CryptoGuard -i encrypted.txt -o decrypted.txt -p 1234 --command decrypt

./CryptoGuard -i input.txt     --command checksum
./CryptoGuard -i decrypted.txt --command checksum
```

### Команда для запуска тестов

```bash
cd build
ctest
```
