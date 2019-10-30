require "rails_helper"


describe "ユーザー管理機能", type: :system do

  describe "新規登録機能" do
    before do
      # 登録ページへ移動
      fill_in "メールアドレス" , with: email_name
    end
    context "メールアドレスが入力されていない場合" do

      # パスワードを入力
      it "登録ページに戻りエラーを表示する" do

      end
    end
    context "データベースに同じメールアドレスが登録されている場合" do

      email_nameをセット
      fill_in "パスワード"
      登録ボタンを押す
      ログアウト
      登録ページへ移動
      fill_in "メールアドレス", with: 同じアドレス
      fill_in "パスワード"
      登録ボタンを押す


      it "エラー文を表示する" do
        # 「そのメールアドレスは別のアカウントで使用されています」と表示される
      end
    end

    context "パスワードが未入力の場合" do
      # メールアドレスを入力
      it "登録ページに戻りエラーを表示する" do
        # 登録ページへ戻り、「パスワードを入力してください」と表示される
      end
    end

    context "パスワードとパスワードの確認がマッチしていない場合" do
      # メールアドレスを入力
      it "登録ページに戻りエラーを表示する" do
        # 登録ページへ戻り、「パスワード確認が間違っています」と表示される
      end
    end

  end


# ここから下、必要か？　手動でいいかも
#   describe "編集機能" do
#
#   end
#
#   describe "退会機能" do
#
#   end


end
