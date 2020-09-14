### AWS EC2へのH2O-3環境構築メモ
[公式Document](https://docs.h2o.ai/h2o/latest-stable/h2o-docs/downloading.html#download-and-run-from-the-command-line)  

***
環境とバージョン情報：
- AWS EC2 - Amazon Linux 2 AMI (HVM), SSD Volume Type
- Anaconda - Anaconda3-2020.07-Linux-x86_64.sh
- H2O-3 - h2o-3.30.1.2.zip
- Java - jre-8u261-linux-x64.rpm
***
手順：
1. EC2の起動
	- セキュリティグループのインバウンドルールでjupyter(8080)やH2O Flow(54321)のポートにアクセス可能としておく
2. Anacondaのインストール
	- [ダウンロードページ](https://www.anaconda.com/products/individual)
	- インストール
	- 環境変数の追加："/インストール先/anaconda3/bin:/インストール先/anaconda3/condabin"
	- conda仮想環境の作成.Python 3.6（[サポートされるバージョン](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/welcome.html#requirements)）
	- jupyterの設定（コンフィグ(jupyter_notebook_config.py)など）
	- h2oパッケージのインストール([Installing H2O-3](https://docs.h2o.ai/h2o/latest-stable/h2o-py/docs/intro.html#installing-h2o-3))
	- インストールしたh2oパッケージのバージョン確認
3. Javaのインストール
	- [ダウンロードとインストールに関して](https://java.com/ja/download/help/linux_x64rpm_install.xml)
4. H2O-3ファイルのダウンロード
	- Pythonのh2oパッケージと同じバージョンをダウンロード（[最新](http://h2o-release.s3.amazonaws.com/h2o/rel-zeno/2/index.html)、[過去](http://docs.h2o.ai/prior_h2o/index.html?_ga=2.196890543.2009068574.1599859417-221692870.1576473546)）
	- ファイル(h2o-3.30.1.2.zip)を解凍しておく
	- 起動の確認：`$java -jar ./h2o-3.30.1.2/h2o.jar`

***
(参考)  
[AWSにjupyter notebookを構築してリモートで使用する](https://qiita.com/ground0state/items/6d5c96dd14a5cb256f64)  
[【初心者向け】Anacondaで仮想環境を作ってみる](https://qiita.com/ozaki_physics/items/985188feb92570e5b82d)  

