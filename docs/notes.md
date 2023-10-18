# Apache benchmarks params

|Param                        |Description                                                                            |
|-----------------------------|---------------------------------------------------------------------------------------|
|**-r (flag)**                |Indicate that the connection (socket) it is not close when it received an error        |
|**-k (KeepAlive)**           |It does multiply requests inside a HTTP session, natural functionality of the browser  |
|**-n (requests)**            |Total number of requests to execute                                                    |
|**-c (concurrency)**         |Quentity of concurrencies connections                                                  |
|**-p (file.json)**           |JSON that sending in the body of the request                                           |
|**-T (application/json)**    |Specifing the data struct of body                                                      |