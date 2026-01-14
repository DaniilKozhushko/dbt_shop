# dbt_shop

1. Создание venv
2. Установка dbt-postgres
3. Создание docker-compose.yml
4. Запуск БД
5. Инициализация dbt init
6. Проверка dbt debug
7. Инициализация БД init_db.sql в DBeaver
8. Создание seeds categories.csv и statuses.csv
9. Обработка dbt seed
10. Добавление нового статуса в statuses.csv
11. Обновление dbt seed
12. Добавление новых категорий в categories.csv
13. Обновление dbt seed --select categories
14. Изменение лимита символов в таблицах
15. Создание папок иерархии - staging, intermediate, marts
16. Создание raw моделей в staging
17. Добавление документации в raw модели
18. Обновление схемы таблицы order_items
19. Добавление ограничений в таблицы
20. Обновление raw модели stg_shop__order_items.sql
21. Проверка документации dbt docs generate, dbt docs serve
22. Добавление таблицы units_of_measure и её модели
23. Добавление тестов для столбцов и моделей
24. Добавление packages.yml и запуск dbt deps
25. Изменение схемы БД на основе таблицы units_of_measure
26. Добавление полей is_deleted, обновление моделей
27. Создание seed units_of_measure.csv
28. Создание моделей для seeds
29. Создание конфигурационного файла для моделей seeds
30. Рефакторинг конфигурации seeds
31. Разделение на несколько веток разработки: dev, prod, test

TODO написать генерацию данных на python

TODO добавить категории товаров: personal care, pet supplies, baby food, organic & healthy food
TODO добавить номер телефона в схему таблицы пользователей

#### profiles.yml:
```yml
shop:
  target: dev
  outputs:
    prod:
      dbname: shop_db
      host: localhost
      pass: dbt_password
      port: 5433
      schema: analytics
      threads: 4
      type: postgres
      user: dbt_user
    test:
      dbname: shop_db
      host: localhost
      pass: dbt_password
      port: 5433
      schema: analytics_test
      threads: 4
      type: postgres
      user: dbt_user
    dev:
      dbname: shop_db
      host: localhost
      pass: dbt_password
      port: 5433
      schema: analytics_dev
      threads: 4
      type: postgres
      user: dbt_user
```