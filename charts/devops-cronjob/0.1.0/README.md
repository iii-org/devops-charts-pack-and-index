
## 申請rancher API 說明
![image](https://github.com/iii-org/devops-charts/blob/main/charts/devops-cronjob/0.1.0/img/rancher_api_1.PNG)
![image](https://github.com/iii-org/devops-charts/blob/main/charts/devops-cronjob/0.1.0/img/rancher_api_2.PNG)

## cronjob排程號碼說明

```
┌───────────── minute (0 - 59)
│ ┌───────────── hour (0 - 23)
│ │ ┌───────────── day of the month (1 - 31)
│ │ │ ┌───────────── month (1 - 12)
│ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
│ │ │ │ │                                   7 is also Sunday on some systems)
│ │ │ │ │
│ │ │ │ │
* * * * * <command to execute>
```
