# H20-3 Example Jupyter Notebooks

[**Document**](https://docs.h2o.ai/h2o/latest-stable/h2o-docs/index.html)  
[**Python API Reference**](https://docs.h2o.ai/h2o/latest-stable/h2o-py/docs/index.html)


***
## H2O.ai Self-Paced Coursesの内容
公式チュートリアル：[H2O.ai Self-Paced Courses](https://h2oai.github.io/tutorials/)  

#### [LearningCenter_1_H2O-3_Classification_Tutorial.ipynb](./LearningCenter_1_H2O-3_Classification_Tutorial.ipynb)
- [Introduction to Machine Learning with H2O-3 - Classification](https://h2oai.github.io/tutorials/introduction-to-machine-learning-with-h2o-3-classification/#0)に沿った内容
- 2値分類モデル作成のステップ（データのロード、データ分割、モデル学習、結果の確認、スコアリング）の詳細、ドキュメントへのリンク
- GLM, Random Forest, Gradient Boosting Machine
- 上記モデルのハイパーパラメータチューニング（ランダムサーチ、グリッドサーチ）

#### [LearningCenter_2_H2O-3_Regression_Tutorial.ipynb](./LearningCenter_2_H2O-3_Regression_Tutorial.ipynb)
- [Introduction to Machine Learning with H2O-3 - Regression](https://h2oai.github.io/tutorials/introduction-to-machine-learning-with-h2o-3-regression/#0)に沿った内容  
- 回帰モデルの作成
- XGBoost, Deep Learning (Neural Network)
- 上記モデルのハイパーパラメータチューニング（ランダムサーチ、グリッドサーチ）

#### [LearningCenter_3_H2O-3_AutoML_Tutorial.ipynb](./LearningCenter_3_H2O-3_AutoML_Tutorial.ipynb)
- [Introduction to Machine Learning with H2O-3 - AutoML](https://h2oai.github.io/tutorials/introduction-to-machine-learning-with-h2o-3-automl/#0)に沿った内容
- 2値分類モデル、回帰モデルの作成
- AutoMLの詳細


***
## 教師なし学習と異常検知

#### [IsolationForest.ipynb](./IsolationForest.ipynb)
- Isolation Forestによる異常検知実施例
- 不均衡なラベルありデータに対し教師なし学習（Isolation Forest）を実施、精度検証。代理モデルを用い特徴量の貢献度を分析（GLM,決定木を、Isolation Forestのスコアリング結果をターゲット変数としてあてはめ）
- H2O Flow(GUI操作)による実施例: [../docs/IsolationForest_Flow.pdf](../docs/IsolationForest_Flow.pdf)

#### [Autoencoder.ipynb](./Autoencoder.ipynb)
- Autoencoderによる異常検知

#### [H2O-3_Unsupervised_Clustering.ipynb](./H2O-3_Unsupervised_Clustering.ipynb)
- k-means

***
## テキストデータ

#### [word2vec.ipynb](./word2vec.ipynb)
- 日本語テキストに対するWord2vec
- テキストのトークン化、ストップワード除去、分散表現の実施（Word2vec）、分散表現を特徴量として教師あり学習（GBM）を実施


***
## 他
#### [Quick_Demo.ipynb](./Quick_Demo.ipynb)
- デモ用Notebook - 教師あり学習の実施プロセスと機能紹介
  - H2O-3の起動
  - データのロード
  - データ分割
  - モデルのあてはめ(GBM)
  - 機械学習の解釈可能性（Glogal,Local）
  - スコアリング（予測値,SHAP）
  - モデルの保存とロード
  - ハイパーパラメータチューニング
  - AutoML
  - H2O-3の終了

#### [Feature_Engineering_Deep_Dive.ipynb](./Feature_Engineering_Deep_Dive.ipynb)
- 手組みでの各種Feature Engineering（変数変換や結合、Target Encoding）の実施、効果の比較
- AutoML

