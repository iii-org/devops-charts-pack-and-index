# (注意)登入權限差異
* 若以使用者自行設定的帳號密碼登入時，僅可看到使用者要求的資料庫
* 備份資料庫若含獨立的`database`則需登入root帳戶才可看到
* 若僅含`database`內的資料，將會預設匯入到使用者要求建立的資料庫名稱內

## 全部iiidevops-web變數(包含預設值)
`git.host`: "10.50.1.53"
`git.repoName`: ""
`git.branch`: ""
`git.commitID`: ""
`git.url`: ""
`web.type`: "php"
`web.port`: 80
`web.image`: ""
`web.tag`: "latest"
`web.extraEnv`: []
`checkmarx.enabled`: false
`newman.enabled`: false
`replicaCount`: 1
`service.type`: NodePort

## 資料庫帳號與密碼設定
* `db.username`: 使用者帳號
* `db.password`: 使用者密碼(亦為root密碼)

## `db.tag` 可用的版本選擇，若不選擇則預設`latest`
* `db.type=mysql`: `8.0`、`5.7`
* `db.type=mariadb`: `10.5`、`10.4`、`10.3`、`10.2`
* `db.type=postgresql`: `13`、`12`、`11`、`10`、`9.6`

## (0.1.0)chart用checkmarx必須參數
git.url: ${CICD_GIT_URL}

## 啟用newman必須參數 
git.url: ${CICD_GIT_URL}
git.branch: ${CICD_GIT_BRANCH}
git.commitID: ${CICD_GIT_COMMIT}
git.repoName: ${CICD_GIT_REPO_NAME}

## 資料庫統一採用bitnami
* [mysql](https://hub.docker.com/r/bitnami/mysql/)
* [mariadb](https://hub.docker.com/r/bitnami/mariadb)
* [postgresql](https://hub.docker.com/r/bitnami/postgresql)
* [mongodb](https://hub.docker.com/r/bitnami/mongodb)
* [adminer](https://hub.docker.com/_/adminer)
* [mongo-express](https://hub.docker.com/_/mongo-express)