### H2O-3 R API Demo
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
X_cols <- names(frame_CreditCard)[2:(ncol(frame_CreditCard)-1)]


## データ分割
split_frame <- h2o.splitFrame(frame_CreditCard, ratios = 0.8)
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
mod_gbm@model$training_metrics      # 学習データ（training_frameへ指定）に対する結果
mod_gbm@model$validation_metrics    # テストデータ（validation_frameへ指定）にたいする結果

# 変数重要度
h2o.varimp(mod_gbm)
#h2o.varimp(mod_gbm)[1:10,]
h2o.varimp_plot(mod_gbm, num_of_features=15)


## 機械学習の解釈可能性
mli_gbm <- h2o.explain(mod_gbm, newdata=frame_train)
mli_gbm

# 個別で出力する場合
mli_gbm$confusion_matrix
mli_gbm$varimp
mli_gbm$pdp
mli_gbm$shap_summary

# オブザベーションの説明
mli_obs_gbm <- h2o.explain_row(mod_gbm, newdata=frame_test, row_index=1)
mli_obs_gbm
# 個別で出力する場合
mli_obs_gbm$ice
mli_obs_gbm$shap_explain_row


## スコアリング
# 予測値
pred_gbm_test <- h2o.predict(mod_gbm, newdata=frame_test)
dim(pred_gbm_test)
pred_gbm_test
# Shaply
h2o.predict_contributions(mod_gbm, newdata=frame_test)


## モデルの保存とロード
# モデルオブジェクト（mojo）をローカルにDL
dl_name <- h2o.download_mojo(mod_gbm, path="../tmp")
dl_name   # DLしたファイルの名前
# モデルをMOJOからロード
loaded_model <- h2o.import_mojo(paste0("../tmp/", dl_name))
class(loaded_model)


## ハイパーパラメータチューニング（グリッドサーチ）
# 探索するハイパーパラメータ（GBM:https://docs.h2o.ai/h2o/latest-stable/h2o-r/docs/reference/h2o.gbm.html）
list_hparams <- list(ntrees=c(40,60), max_depth=c(4,6))
# グリッドサーチの実行
mod_grid <- h2o.grid(algorithm="gbm", 
                     y=y_col, x=X_cols, 
                     training_frame=frame_train, validation_frame=frame_test,
                     hyper_params=list_hparams)
class(mod_grid)
str(mod_grid)
mod_grid   # デフォルトではlogloss順で表示

# AUC順で表示
h2o.getGrid(grid_id=mod_grid@grid_id, sort_by="auc")

# loglossが一番低くなったモデルを取得。取得したいモデルIDを指定
mod_grid_1st <- h2o.getModel(mod_grid@model_ids[[1]])
mod_grid_1st


## AutoML
mod_aml <- h2o.automl(y=y_col, x=X_cols,
                      training_frame=frame_train, 
                      nfolds=3,    # k分割交差検証法を指定。よってvaridation_frameの指定はなし
                      max_models=3)
class(mod_aml)
#str(mod_aml)
mod_aml

# Leaderboardの表示。デフォルトではk分割交差検証法の結果がAUC順で表示
lb <- h2o.get_leaderboard(mod_aml, extra_columns='ALL')
lb

# ベストモデルの取得
mod_aml_1st <- h2o.getModel(lb[1,'model_id'])
class(mod_aml_1st)
mod_aml_1st

mod_aml_1st@algorithm   # "stackedensemble"
mod_aml_1st@parameters
mod_aml_1st@parameters$metalearner_algorithm   # "glm"：stackedensembleのアルゴリズム


## H2O-3 Clustorの終了
h2o.shutdown()

