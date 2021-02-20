###

## 版本說明
* `0.1.0`: 初始版本(非web-db)
> 主要用於測試在Rancher圖形介面上直接的部屬
* `0.2.0`: 測試版本
> 主要用於測試在pipeline上進行直接的部屬，因為rancher在部屬上仍有嚴重的issue，需註記為v1才可編譯

## 全部iiidevops-web變數(包含預設值)
`git.repoName`: ""
`git.branch`: ""
`git.commitID`: ""
`web.type`: "php"
`web.port`: 80
`web.image`: ""
`web.tag`: "latest"
`web.extraEnv`: []
`checkmarx.enabled`: false
`newman.enabled`: false
`replicaCount`: 1
`service.type`: NodePort

## (0.1.0)chart用checkmarx必須參數
git.url: ${CICD_GIT_URL}

## 啟用newman必須參數 
git.url: ${CICD_GIT_URL}
git.branch: ${CICD_GIT_BRANCH}
git.commitID: ${CICD_GIT_COMMIT}
git.repoName: ${CICD_GIT_REPO_NAME}

## 基礎固定設定
* 資源限制管理

## 目前已完成整合(模擬通過)
* `service.db.enabled`: 選擇您是否希望部屬資料庫
  * 可選型態`true`、`false`
  * 預設: `false`
  > 說明: 若選擇`true`則會將所選的資料庫鏡像進行部屬，若`false`則僅部屬使用者前端使用
* `service.db.type`: 選擇您的希望部屬的後端伺服器服務
  * 可選型態: `mysql`、`mariadb`、`postgresql`、`mongodb`
  * 預設: `mysql`
  > 說明: 若選擇`mysql`則自動部屬`mysql`所需要的3306 port在deployment與service
* `service.db.gui`: (service.db.enabled為true的前提下)是否要額外啟動資料庫網頁管理介面
  * 可選型態: `true`、`false`
  * 預設: `false` 
## (入侵檢測系統和入侵防禦系統下使用-整合防火牆管理)
* `service.type`: 使用者可選擇網路部屬形式，可選型態`NodePort`、`ClusterIP`、`LoadBalancer`

## 處理中的整合方案(模擬測試)
* `service.web.type`: 選擇希望部屬的前端伺服器服務，可選型態`php`、`flask`、`uwsgi-nginx-flask`、`spring`
* `service.web.port`: 在前端與後端可自由定義對外port，新增`custom`型態
* `image.registry`: 使用者簡易說明鏡像的儲存位置，可選型態`harbor-63`、`pipeline`
* [判斷機制]: 若使用者無sql資料，但是希望提供資料庫功能的話，使用者會幫其建立空的全新的資料庫(未提供資料庫鏡像目前會報錯，因目前機制是強制需要有.sql檔案才可通過Docker Image編譯)
* 精簡化冗餘參數: 例如RELEASE NAME與GIT整合
* 說明資料庫連線的帳號與密碼(HOST尚須處理)
* `mysql`與`mariadb`使用者若選擇要後端網頁管理時可以選擇要哪一種網頁管理介面是xampp或wampp的`phpmyadmin`或是`adminer`
* `判斷db enable image是否為空`->用bitnami
* ``

## 注意
* 方案選擇處理: 目前設計為使用者僅可使用最多一個資料庫，例如使用者要開發智慧物聯網服務，可能會需要非關聯的mongodb儲存原始感測器數據+mariadb儲存關聯性資料。
* 方案選擇處理: 目前設計上為了速度提升將鏡像上傳到

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
