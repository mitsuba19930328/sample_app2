require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]",signup_path
  end
  
  
  def setup
    @user = users(:michael)
  end

  test "layout links after logged in user" do
    log_in_as(@user) #userでログイン
    get root_path #root_path
    assert_template 'static_pages/home' #ホームにたどり着いてるかチェック
    assert_select "a[href=?]", root_path, count: 2 #ホームへのアクセスチェック
    assert_select "a[href=?]", help_path #ヘルプへのアクセスチェック
    assert_select "a[href=?]", users_path #ユーザー一覧へのアクセスチェック
    assert_select "a[href=?]", user_path(@user) #ユーザー詳細ページへのチェック
    assert_select "a[href=?]", edit_user_path(@user) #特定のユーザーアップデートページへのチェック
    assert_select "a[href=?]", logout_path #ログアウト
  end
  
end