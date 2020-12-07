# devops-charts
Charts for iii-devops


## 專案預設採用NodePort
方便使用者進行透過PORT連線

* `helm3 lint ./charts/web-db/0.1.0 -f ./test.yaml`
# 測試前端與資料庫
* `helm install --dry-run --debug ./charts/web-db/0.1.0 -f ./test.yaml  --generate-name`
# 快速測試前端整合
* `helm install --dry-run --debug ./charts/web/0.1.0 -f ./test.yaml  --generate-name`

## 專案進度
* [php AppVersion:0.2.0] -> 測試正常
* []
