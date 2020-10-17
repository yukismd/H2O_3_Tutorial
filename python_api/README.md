## H2O-3 Python APIチュートリアル  
  
[公式Document](https://docs.h2o.ai/h2o/latest-stable/h2o-docs/index.html)  
[公式Python API Document](https://docs.h2o.ai/h2o/latest-stable/h2o-py/docs/index.html)
  
***
### ファイルの読み書きや、H2OFrameとPandas DataFrameの連携に関して
[**H2OFrame_and_Pandas_DataFrame.ipynb**](./H2OFrame_and_Pandas_DataFrame.ipynb)
  
***
### Python APIによる分類問題に関するチュートリアル  
[**H2O-3 Classification Tutorial.ipynb**](./H2O-3%20Classification%20Tutorial.ipynb)
- [H2O-3 Tutorials](https://training.h2o.ai/h2o3-tutorials)の[1A. Introduction to Machine Learning with H2O-3 - Classification](https://training.h2o.ai/products/1a-introduction-to-machine-learning-with-h2o-3-classification)に沿った内容  
- ローカルWindows環境で実施
  
***
### Python APIによる回帰問題に関するチュートリアル
[**H2O-3 Regression Tutorial.ipynb**](./H2O-3%20Regression%20Tutorial.ipynb)
- [H2O-3 Tutorials](https://training.h2o.ai/h2o3-tutorials)の[1B. Introduction to Machine Learning with H2O-3 - Regression](https://training.h2o.ai/products/1b-introduction-to-machine-learning-with-h2o-3-regression)に沿った内容  
- AWS Amazon Linux環境で実施（H2OXGBoostEstimatorはWindowsではサポートされていない）
  
***
### Python APIによるAutoMLに関するチュートリアル
[**H2O-3 AutoML Tutorial**](./H2O-3%20AutoML%20Tutorial.ipynb)
- [H2O-3 Tutorials](https://training.h2o.ai/h2o3-tutorials)の[1C. Introduction to Machine Learning with H2O-3 - AutoML](https://training.h2o.ai/products/1c-introduction-to-machine-learning-with-h2o-3-automl)に沿った内容  
AWS Amazon Linux環境で実施（注：AutoMLにH2OXGBoostEstimatorを含める場合Windows以外の環境を利用）
  
***
### Feature Engineeringに関するチュートリアル
[**Feature_Engineering_Deep_Dive.ipynb**](./Feature_Engineering_Deep_Dive.ipynb)
- 変数作成の練習
- Feature Engineeringの例
- Feature Engineeringの効果の確認
  
***
H2O-3の特徴
- 欠損処理の自動化
- カテゴリ変数のEncoding処理の自動化
- 独自のアルゴリズム実装と詳細なハイパーパラメーターの指定
- 詳細な予測結果(精度指標等)の表示
- Error発生時における、対応法など詳細なメッセージ
- AutoMLの使いやすさ
