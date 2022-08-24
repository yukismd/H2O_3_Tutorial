### H2O-3 R Demo
# - H2O-3の起動
# - データのインポート
# - データ分割
# - モデルのあてはめ(GBM)
# - 機械学習の解釈可能性（Glogal、Local（1オブザベーション）なモデルの解釈）
# - スコアリング（予測値、SHAP）
# - モデルの保存とロード
# - ハイパーパラメータチューニング
# - AutoML
# - H2O-3の終了

# ドキュメント: https://docs.h2o.ai/h2o/latest-stable/h2o-docs/index.html
# R API Reference: https://docs.h2o.ai/h2o/latest-stable/h2o-r/docs/reference/index.html


library(h2o)

## H2O-3 Clustorの開始（ローカルで起動）
h2o.init()

## h2oライブラリのバージョン
h2o.getVersion()

## データのインポート
frame_CreditCard <- h2o.importFile('https://h2oai-jpn-public.s3.amazonaws.com/sample-data/uci-credit-card/UCI_Credit_Card3.csv')

class(frame_CreditCard)

head(frame_CreditCard)
dim(frame_CreditCard)
#nrow(frame_CreditCard)
#ncol(frame_CreditCard)

summary(frame_CreditCard)

## データ型の確認
str(frame_CreditCard)
# ターゲット変数の型変換（num -> Factor）
frame_CreditCard['default_payment_next_month'] <- as.factor(frame_CreditCard['default_payment_next_month'])


## カラムの役割を指定
y_col <- 'default_payment_next_month'
X_cols <- names(frame_CreditCard)[2:ncol(frame_CreditCard)-1]


## データ分割
split_frame <- h2o.splitFrame(frame_CreditCard, ratios = 0.75)
frame_train <- split_frame[[1]]
dim(frame_train)
frame_test <- split_frame[[2]]
dim(frame_test)


## モデル学習（GBM）
mod_gbm <- h2o.gbm(y=y_col, x=X_cols, training_frame=frame_train, validation_frame=frame_test)


## 結果の確認
mod_gbm
str(mod_gbm)
# モデルの設定
mod_gbm@parameters
# ハイパーパラメータ
mod_gbm@allparameters
# モデル精度
mod_gbm@model$training_metrics
mod_gbm@model$validation_metrics



h2o.varimp(mod_gbm)
#h2o.varimp_heatmap(mod_gbm)
h2o.varimp_plot(mod_gbm)



## H2O-3 Clustorの終了
h2o.shutdown()

