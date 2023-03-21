def replace_text_in_file(txt, search_str, new_str=None, move=0, replace_line=None):
    with open(txt, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    found_line = -1
    for i in range(len(lines)):
        if search_str in lines[i]:
            found_line = i
            break

    if found_line >= 0:
        if replace_line == 'LINE':
            lines[found_line + move] = new_str + '\n' if new_str is not None else '\n'
        else:
            if new_str is not None:
                lines[found_line] = lines[found_line].replace(search_str, new_str)
            elif replace_line is not None:
                lines[found_line] = replace_line + '\n'

    with open(txt, 'w', encoding='utf-8') as f:
        f.writelines(lines)

# ------------------------------------------------------------

replace_text_in_file("app/Providers/AppServiceProvider.php", 'use Illuminate\Support\ServiceProvider;', 'use Illuminate\Support\Facades\Schema;',1,'LINE')
replace_text_in_file("app/Providers/AppServiceProvider.php", 'public function boot()', '        Schema::defaultStringLength(191);',2,'LINE')

replace_text_in_file(".env", 'DB_DATABASE', 'DB_DATABASE=laraveldemo',0,'LINE')

replace_text_in_file("config/app.php", '\'locale\' =>', "    'locale' => 'zh_TW',",0,'LINE')
# ------------------------------------------------------------
