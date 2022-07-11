## Scoring Examples by Java

[**Document(Productionizing H2O)**](https://docs.h2o.ai/h2o/latest-stable/h2o-docs/productionizing.html)  

***

h2o-genmodel.jar：依存ライブラリ

***

Scoring code example ([Scoring.java](Scoring.java))
```bash
% javac -cp h2o-genmodel.jar Scoring.java
% java -cp .:h2o-genmodel.jar Scoring 
```
> default_payment_next_month (1=yes; 0=no): 1  
> default_payment_next_month class probabilities: 0.2858380795342591,0.7141619204657409
