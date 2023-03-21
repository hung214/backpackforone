# backpackforone

本專案是以backpack for laravel9為基礎做一個WINDOWS批次檔來方便建立安裝backapck後台，並利用modifly_py1.py去修改必要的文件，減少設定。

在開始使用之前需要設定兩個檔案內容：

1. start_laravel9 - backpack.bat 設定

```bash
rem 設定專案的名稱
set a="laravel09"
rem 數據庫名稱PY檔也要改成一樣的否則會出錯
rem 資料庫名稱
set dbname="laraveldemo"
rem 資料庫的帳號密碼
set username="root"
set password=""
```

2. modifly_py1.py 設定

```python
replace_text_in_file(".env", 'DB_DATABASE', 'DB_DATABASE=laraveldemo',0,'LINE')
//DB_DATABASE= 是資料庫名稱，必須要跟bat檔的資料庫名稱一致否則會出錯
```

------

## 環境：

作者使用wamp的開發環境，php版本必須符合laravel9的要求

## 開始安裝：

開始執行開始執行 start_laravel9 - backpack.bat 就會開始自動建立專案。
