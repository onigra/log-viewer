source 'https://rubygems.org'
 
gem 'rails', '3.2.13'
gem 'rake'
gem 'mysql2'
 
# Bootstrap
gem 'less-rails'
gem 'twitter-bootstrap-rails'
 
# Compress/Sassy-Buttons/Zurui-design
gem 'sass-rails'
gem 'compass-colors'
gem 'compass-rails'
gem 'sassy-buttons'
gem 'zurui-sass-rails'
 
# Font Awesome
gem 'font-awesome-rails'
 
# Form Builders
gem 'simple_form'
gem 'country_select'
 
# jQuery/json
gem 'jquery-rails', '~> 3.0.1'
gem 'jquery-cookie-rails', :git => "https://github.com/RyanScottLewis/jquery-cookie-rails.git"
gem 'json'
 

gem 'active_decorator' # Presenter
gem 'rails_config'     # 定数管理
gem 'nokogiri'         # スクレイピング
gem 'kaminari'         # ページャ
gem 'ransack'          # 検索機能
# gem 'seed-fu'        # Seed管理
gem 'quiet_assets'     # asset取得系のログを出力しない
gem 'turnout'          # メンテナンス画面表示支援
 
group :assets do
  gem 'coffee-rails'
  gem 'jquery-ui-rails'
  gem 'therubyracer', "~> 0.10.2"
  gem 'uglifier'
  gem 'libv8', '~> 3.3.10'
end
 
group :development do
  gem 'yard'                        # ドキュメント生成
  gem 'better_errors'               # エラー画面をわかりやすく整形してくれる
  gem 'binding_of_caller'           # better_errorsの画面上にirb/pry(PERL)を表示する
  gem 'rails-footnotes', '>= 3.7.9' # フッターにデバック情報を表示
  gem 'bullet'                      # N+1問題の警告を出力
  gem 'pry-rails'
  gem 'sextant'                     # ブラウザ上でルーティングが確認できる
  gem 'mail_view'                   # ブラウザ上で送信メールを確認できる
  gem 'letter_opener'               # 開発環境のメールの送信を抑制できる
end
 
group :development, :test do
  gem 'powder'
  gem 'rails3-generators'
end

group :deployment do
  gem 'capistrano'
  # gem 'capistrano-ext' # capistrano拡張
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
 
# To use Jbuilder templates for JSON
# gem 'jbuilder'
 
# Use unicorn as the app server
# gem 'unicorn'
 
# To use debugger
# gem 'debugger'
