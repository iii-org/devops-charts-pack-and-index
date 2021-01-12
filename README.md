# devops-charts
Charts for iii-devops

## Helm與Chart相關資料 Helm工具管理charts(package)
* [Helm: The package manager for Kubernetes](https://helm.sh/)

## iii-org 以chart為形式的專案範例
目前由於Serect 修改很大 因此下面專案可能無法通過
* [iii-org/flask-app-pipeline-template](https://github.com/iii-org/flask-app-pipeline-template.git)
* [iii-org/php-mariadb-app-template](https://github.com/iii-org/php-mariadb-app-template.git)
* [iii-org/mariadb10.4-app-example](https://github.com/iii-org/mariadb10.4-app-example.git)
* [iii-org/mariadb10.5-app-example](https://github.com/iii-org/mariadb10.5-app-example.git)
* [iii-org/postgresql-app-pipeline-template](https://github.com/iii-org/postgresql-app-pipeline-template.git)
* [iii-org/spring-app-pipeline-template](https://github.com/iii-org/spring-app-pipeline-template.git)
* [iii-org/php-app-pipeline-template](https://github.com/iii-org/php-app-pipeline-template.git)

## 專案預設採用NodePort
方便使用者進行透過PORT連線

* `helm3 lint ./charts/web-db/0.1.0 -f ./test.yaml`
# 測試前端與資料庫
* `helm install --dry-run --debug ./charts/web-db/0.1.0 -f ./test.yaml  --generate-name`
# 快速測試前端整合
* `helm install --dry-run --debug ./charts/web/0.1.0 -f ./testweb.yaml  --generate-name`
# 快速測試部屬資料庫
* `helm install --dry-run --debug ./charts/db/0.1.0 -f ./testdb.yaml  --generate-name`

