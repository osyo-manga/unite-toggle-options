scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


" see http://www15.ocn.ne.jp/~tusr/vim/options.html
let s:toggle_options = [
\	['allowrevins', '挿入モードとコマンドラインモードで、CTRL-_を使うことを認める。'],
\	['altkeymap', 'デフォルトの第２言語(Farsi/ヘブライ)'],
\	['antialias', 'MacOSX:フォントを滑らかに表示する。'],
\	['autochdir', '現在編集中のファイルのディレクトリに変更する'],
\	['arabic', 'デフォルトでアラビア語を2番目の言語にする'],
\	['arabicshape', 'アラビア文字を整える'],
\	['autoindent', '直前の行から新しい行のインデントを得る'],
\	['autoread', 'vim以外でファイル変更した時に自動再読み込みする'],
\	['autowrite', '変更があったら、自動的に書き出す'],
\	['autowriteall', '"autowrite"と同様だが、より多くのコマンドと連動'],
\	['backup', '上書きした時にバックアップを作成する。'],
\	['ballooneval', 'バルーン評価のON/OFF'],
\	['binary', 'バイナリモードで、読み/書き/編集する'],
\	['bioskey', 'MS-DOS専用:文字入力にbiosコールを使う'],
\	['bomb', 'ファイルの先頭にBOMを付加する'],
\	['buflisted', 'バッファリストにバッファを表示するかどうか'],
\	['cindent', 'Ｃ言語用のインデントを行う'],
\	['compatible', '可能な限りVi互換で動く'],
\	['confirm', '未保存ファイル、リードオンリファイルの確認方法'],
\	['conskey', 'コンソールからの直接キー検出(MS-DOSのみ)'],
\	['copyindent', '"autoindent"がすでにあるインデントを参考にする'],
\	['cscoperelative', 'cscope.outのディレクトリパスをプレフィックスとして使う'],
\	['cscopetag', 'タグコマンドでcscopeを使う'],
\	['cscopeverbose', 'cscopeデータベースに追加時にメッセージを表示'],
\	['cursorbind', 'カーソルを移動させたときに他のウィンドウ内でもカーソルを移動させる'],
\	['cursorcolumn', 'カーソルがある桁を強調表示する'],
\	['cursorline', 'カーソルがある行を強調表示する'],
\	['delcombine', '合成文字の削除時に構成要素を全て消す'],
\	['diff', 'そのウインドウでdiffモードを使う'],
\	['digraph', '挿入モードで二重字の入力を有効にする'],
\	['edcompatible', '|:substitute|のフラグを切替える'],
\	['endofline', 'ファイル末尾に<EOL>を書く'],
\	['equalalways', 'ウインドウを自動で同じ大きさに調整する'],
\	['errorbells', 'エラー表示時にベルを鳴らす'],
\	['esckeys', '挿入モードでファンクションキーを有効にする'],
\	['expandtab', '<Tab>入力でスペースを入力する'],
\	['exrc', 'カレントディレクトリの.vimrcと.exrcを読み込む'],
\	['fkmap', 'ペルシア語のキーボードマッピング'],
\	['foldenable', '全ての折畳みの開閉を設定する'],
\	['fsync', 'ファイルを書き込んだ後にfsync()を呼ぶかどうか'],
\	['gdefault', '|:substitute|で"g"を既定で有効にする'],
\	['guifontset', 'GUI:マルチバイト用のフォント'],
\	['guiheadroom', 'GUI:ウインドウ装飾用の余地。ピクセル単位'],
\	['guipty', 'GUI:|:!|でpseudo-ttyの使用を試みる'],
\	['hidden', 'バッファが|abandon|(捨て)られても破棄しない'],
\	['hlsearch', '最後に検索したパターンを強調表示する'],
\	['hkmap', 'ヘブライ語のキーボードマッピング'],
\	['hkmapp', '発音に即したヘブライ語のキーボードマッピング'],
\	['icon', 'Vimのアイコン表示でテキストを変更するようにする'],
\	['ignorecase', '検索パターンで大文字と小文字を区別しない'],
\	['imactivatekey', 'Xのインプットメソッドを有効にするキー'],
\	['imcmdline', 'コマンドライン入力時にIMを有効にする'],
\	['imdisable', 'IMを使わない'],
\	['incsearch', '検索パターン入力中にその文字を強調表示する'],
\	['infercase', 'キーワード補完で大文字小文字を調整する'],
\	['insertmode', '挿入モードで編集を開始する'],
\	['joinspaces', '行連結時にピリオドの後に空白を2つ入れる'],
\	['lazyredraw', 'マクロ実行中に表示を更新しない'],
\	['linebreak', '長い行を空白で折り返す'],
\	['lisp', 'Lisp用自動インデント'],
\	['list', '<Tab>や<EOL>を表示する'],
\	['loadplugins', '起動時にプラグインスクリプトを読み込む'],
\	['magic', '検索パターン内の特殊文字を変更する'],
\	['modeline', 'ファイルの先頭や末尾のモードラインを許可する'],
\	['modifiable', 'ファイルの変更許可'],
\	['modified', 'バッファが変更されているか'],
\	['more', 'スクリーンを埋めるような出力で一時停止するか'],
\	['mousefocus', 'マウスの移動でキーボードのフォーカスを移動する'],
\	['mousehide', '入力時にマウスポインタを非表示にする'],
\	['mzquantum', 'MzSchemeスレッドに切り替える間隔'],
\	['number', '行番号を表示する'],
\	['opendevice', 'MS-Windows上でデバイスの読み書きを許可する'],
\	['osfiletype', 'サポートされていない'],
\	['paste', 'Pasteモードに移行'],
\	['preserveindent', '再インデント時にインデントの構造を保つ'],
\	['previewwindow', 'プレビューウインドウかどうか'],
\	['printencoding', '印刷で使う文字コード'],
\	['printexpr', '|:hardcopy|でPostScriptを印刷するための式'],
\	['printmbcharset', '|:hardcopy|に使われるCJK文字集合'],
\	['printmbfont', '|:hardcopy|の出力に使われるフォント名'],
\	['readonly', 'バッファの書き込みを制限する'],
\	['relativenumber', '相対行番号を表示する'],
\	['remap', '再帰的マッピングを有効にする'],
\	['restorescreen', 'Win32:終了時スクリーンを更新する'],
\	['revins', '挿入モードで入力方向が逆になる'],
\	['rightleft', '"右から左"指向のウインドウ'],
\	['ruler', 'ステータスラインにカーソルが位置する場所を表示する'],
\	['scrollbind', '他のウインドウと同期してスクロールする'],
\	['secure', 'カレントディレクトリの.vimrcを安全に読む'],
\	['shellslash', 'シェルで使うファイルのパス区切りに使う'],
\	['shelltemp', 'シェルコマンドに一時ファイルを使うかどうか'],
\	['shelltype', 'Amiga:シェルの使い方に影響する'],
\	['shiftround', 'インデントを"shiftwidth"の倍数に丸める'],
\	['shortname', 'MS-DOS以外:ファイル名が8.3形式であると仮定する'],
\	['showcmd', '(未完の)コマンドをステータス行に表示する'],
\	['showfulltag', 'タグで補完する時完全なタグのパターンを表示する'],
\	['showmatch', '括弧入力時に対応する括弧を知らせる'],
\	['showmode', 'ステータスラインに現在のモードを表示する'],
\	['smartcase', 'パターンが大文字を含むときは文字の大小を区別する'],
\	['smartindent', 'C言語用の高度な自動インデント'],
\	['smarttab', '<Tab>入力時に"shiftwidth"を使う'],
\	['spell', 'スペルチェッキングを有効にする'],
\	['splitbelow', 'ウインドウの横分割で新規ウィンドウを下に作る'],
\	['splitright', 'ウインドウの縦分割で新規ウィンドウを右に作る'],
\	['startofline', 'カーソル移動コマンドで行の最初の非空白へ移動する'],
\	['swapfile', 'スワップファイルを使うかどうか'],
\	['tagbsearch', 'タグファイル内の検索にバイナリサーチを使う'],
\	['tagrelative', 'タグファイル内のファイル名が相対的になる'],
\	['tagstack', 'タグスタックにタグをプッシュする'],
\	['termbidi', 'ターミナルが双方向性を持っている'],
\	['terse', 'いくつかのメッセージを省略する'],
\	['textauto', '廃止。今は"fileformats"を使う'],
\	['textmode', '廃止。今は"fileformat"を使う'],
\	['tildeop', '"~"がオペレータのように振舞う'],
\	['timeout', 'マッピングやキーコード入力の時間制限'],
\	['title', 'ウインドウのタイトルを変更するようにする'],
\	['ttimeout', 'マッピング入力の時間制限'],
\	['ttybuiltin', '外部のtermcapの前に組込みのtermcapを探す'],
\	['ttyfast', '高速ターミナル接続を行う'],
\	['ttymouse', 'マウスコードの種類'],
\	['undofile', 'アンドゥ情報をファイルに保存する'],
\	['visualbell', 'ビープの代わりにvisualベル(画面フラッシュ)を使用'],
\	['warn', 'バッファ変更済み時にシェル使用で警告する'],
\	['weirdinvert', '変な強調表示方法を持つターミナル用'],
\	['wildignorecase', 'ファイル名を補完するときに大文字と小文字を無視する'],
\	['wildmenu', 'コマンドラインで補完候補をメニュー表示する'],
\	['winfixheight', 'ウィンドウの高さをキープする'],
\	['winfixwidth', 'ウィンドウの幅をキープする'],
\	['wrap', '長い行を折り返して表示する'],
\	['wrapscan', '検索がファイル末尾まで進んだら先頭から再検索'],
\	['write', 'ファイルへの保存を許可する'],
\	['writeany', 'ファイルへの保存時は"!"がなくても上書きする。'],
\	['writebackup', '上書きする時にはバックアップを作る。'],
\]


function! unite#sources#toggle_options#define()
	return s:source
endfunction


let s:source = {
\	"name" : "toggle-options",
\	"description" : "set toggle options",
\	"default_action" : "toggle",
\	"action_table" : {
\		"toggle" : {
\			"description" : "set {option}!",
\			"is_selectable" : 1,
\			"is_invalidate_cache" : 1,
\			"is_quit" : 0
\		},
\		"set_on" : {
\			"description" : "set {option}",
\			"is_selectable" : 1,
\			"is_invalidate_cache" : 1,
\			"is_quit" : 0
\		},
\		"set_off" : {
\			"description" : "set no{option}",
\			"is_selectable" : 1,
\			"is_invalidate_cache" : 1,
\			"is_quit" : 0
\		},
\		"set_default" : {
\			"description" : "set {option}&",
\			"is_selectable" : 0,
\			"is_invalidate_cache" : 1,
\			"is_quit" : 0
\		},
\		"help" : {
\			"description" : "help {option}",
\			"is_selectable" : 0,
\			"is_invalidate_cache" : 1,
\			"is_quit" : 0
\		},
\		"preview" : {
\			"description" : "help {option}",
\			"is_selectable" : 1,
\			"is_invalidate_cache" : 1,
\			"is_quit" : 0
\		},
\	},
\	"toggle_options" : s:toggle_options
\}

function! s:source.action_table.toggle.func(candidates)
	for candidate in a:candidates
		execute "set ".candidate.action__option."!"
	endfor
endfunction

function! s:source.action_table.set_on.func(candidates)
	for candidate in a:candidates
		execute "set no".candidate.action__option
	endfor
endfunction

function! s:source.action_table.set_off.func(candidates)
	for candidate in a:candidates
		execute "set ".candidate.action__option
	endfor
endfunction

function! s:source.action_table.set_default.func(candidates)
	for candidate in a:candidates
		execute "set ".candidate.action__option."&"
	endfor
endfunction

function! s:source.action_table.help.func(candidates)
	execute "help ".candidate.action__option
endfunction

function! s:source.action_table.preview.func(candidates)
	execute "help ".candidate.action__option
endfunction

function! s:source.gather_candidates(args, context)
	return map(copy(self.toggle_options),  '{
\		"word" : self.word(get(v:val, 0), get(v:val, 1)),
\		"action__option" : get(v:val, 0),
\	}')
endfunction

function! s:source.word(option, description)
	let space = join(map(range(15-len(a:option)), "' '"), "")
	return "[".(self.is_on(a:option) ? "x" : " ")."] ".a:option.space." : ".a:description
endfunction

function! s:source.is_on(option)
	execute "let result = &".a:option
	return result
endfunction
let &cpo = s:save_cpo
unlet s:save_cpo
