@echo off
REM 後續命令使用的是：UTF-8編碼
chcp 65001
set a="laravel09"
rem 數據庫名稱PY檔也要改成一樣的否則會出錯
set dbname="laraveldemo"
set  username="root"
set  password=""


echo "執行之前先確認幾點，否則會產生錯誤"
echo "1.專案名稱還未建立"
echo "2.mysql數據庫還未建立:" %dbname%
echo "3.python環境變數已經建立"
pause

@rem 數據庫檢查
@rem set  username="root"
@rem set  password=""
@rem mysql -u %username% -p %password%  -e "use laraveldemo;" >nul 2>&1
mysql -u %username%  -e "use %dbname%;" >nul 2>&1

if %errorlevel% neq 0 (
    mysql -u %username%  -e "CREATE DATABASE %dbname% CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    echo 数据库已创建。
) else (
    echo 数据库已存在。
     rem goto :end
)

@rem pause



echo 執行建立LARAVEL專案
@REM 備註:10版本會讓套件無法安裝->
@REM laravel-shift/blueprint:1.0
@REM jasonmccreary/laravel-test-assertions:2.1 phpunit/phpunit:9.0
@REM laracasts/generators

call composer create-project laravel/laravel:^9.*  %a%
@REM call composer create-project laravel/laravel:^9.*  %a%1
@REM call composer create-project laravel/laravel:^9.*  %a%2
echo 執行建立完成

call cd %a%
@REM call python3.10.exe ../modifly_py1.py
echo 執行modifly_py1
call python.exe ../modifly_py1.py





::下載語言套件
echo 下載語言套件
call composer require laravel-lang/lang

@REM call xcopy /s /i /d /y  vendor\laravel-lang\lang\locales\zh_TW resources\lang\zh-TW 
@REM call copy resources\lang\zh-TW\zh_TW.json resources\lang\zh-TW.json
call xcopy /s /i /d /y  vendor\laravel-lang\lang\locales\zh_TW resources\lang\zh_TW 
call copy resources\lang\zh-TW\zh_TW.json resources\lang\zh_TW.json


@REM ::執行jetstream
@REM echo 執行jetstream
@REM call composer require laravel/jetstream
@REM :: blade
@REM call php artisan jetstream:install livewire
@REM rem call php artisan jetstream:install inertia
@REM echo 執行npm install
@REM call npm install
@REM echo 執行npm run dev
@REM call npm run dev
@REM echo 執行php artisan migrate
@REM call php artisan migrate
@REM :: blade
@REM call php artisan vendor:publish --tag=jetstream-views
@REM rem call npm run dev



rem # require Backpack using Composer
rem call composer require backpack/crud:"^5.0"
rem call composer require --dev backpack/generators

rem # run the installation command
rem call php artisan backpack:install


rem # 安装 blueprint 与相依套件
call composer require backpack/crud --no-interaction
call php artisan backpack:install --no-interaction
echo laravel-shift/blueprint:^1.0
call composer require --dev laravel-shift/blueprint
echo jasonmccreary/laravel-test-assertions:^2.1 phpunit/phpunit:^9.0
call composer require --dev jasonmccreary/laravel-test-assertions 
call echo '/draft.yaml' >> .gitignore
call echo '/.blueprint' >> .gitignore
rem # 安装 generators
echo backpack/generators
call composer require --dev backpack/generators
echo laracasts/generators
call composer require --dev laracasts/generators


rem # 添加bashboard項目
call php artisan backpack:publish base/dashboard

rem # base 項目
call php artisan backpack:publish base/inc/alerts
@REM call php artisan backpack:publish base/inc/head
@REM call php artisan backpack:publish base/inc/menu
rem call php artisan backpack:publish base/inc/sidebar_content
rem call php artisan backpack:publish base/inc/topbar_left_content
rem call php artisan backpack:publish base/inc/topbar_right_content
@REM call php artisan backpack:publish base/layouts/top_left
call php artisan backpack:publish base/blank

rem # crud list edit
call php artisan backpack:publish crud/edit
call php artisan backpack:publish crud/list
call xcopy /s /i /d /y vendor\backpack\crud\src\resources\lang\zh-Hant vendor\backpack\crud\src\resources\lang\zh_TW



rem if 
echo 執行測試伺服器
call php artisan serve

:end
pause

