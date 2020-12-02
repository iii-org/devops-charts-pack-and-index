###

## 版本說明
* `0.1.0`: 初始版本(非web-db)
> 主要用於測試在Rancher圖形介面上直接的部屬
* `0.2.0`: 測試版本
> 主要用於測試在pipeline上進行直接的部屬，因為rancher在部屬上仍有嚴重的issue，需註記為v1才可編譯

## 基礎設定
* 

## 目前已完成整合(模擬通過)
* `service.db.enabled`: 選擇您是否希望部屬資料庫，可選型態`true`、`false`
* `service.db.type`: 選擇您的希望部屬的後端伺服器服務，可選型態`mysql`、`mariadb`、`postgresql`、`mongodb`
* ``

## 處理中的整合方案(模擬通過)
* `service.db.gui`: (service.db.enabled為true的前提下)是否要額外啟動資料庫網頁管理介面，可選型態`true`、`false`
* `service.web.type`: 選擇希望部屬的前端伺服器服務，可選型態`php`、`flask`、`uwsgi-nginx-flask`、`spring`
* `service.web.port`: 在前端與後端可自由定義對外port，新增`custom`型態
* `image.registry`: 使用者簡易說明鏡像的儲存位置，可選型態`harbor-63`、`pipeline`

## 統合計畫
web: 整合flask、php、spring、custom  
db: 整合mysql、mariadb、monodb  
dbadmin: adminer、mongoadmin

## 需申請測試
ingress controler  
coredns  

## 資料庫統一採用bitnami
* [mysql](https://hub.docker.com/r/bitnami/mysql/)
* [mariadb](https://hub.docker.com/r/bitnami/mariadb)
* [postgresql](https://hub.docker.com/r/bitnami/postgresql)
* [mongodb](https://hub.docker.com/r/bitnami/mongodb)
* [adminer](https://hub.docker.com/_/adminer)
* [mongo-express](https://hub.docker.com/_/mongo-express)