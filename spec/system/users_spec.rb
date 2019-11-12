require "rails_helper"


describe "ユーザー管理機能", type: :system do


  describe "新規登録機能" do
    before do
      visit new_admin_user_path
      fill_in "名前", with: "ユーザーA"
      fill_in "メールアドレス" , with: email_name
      fill_in "パスワード", with: "password"
      fill_in "パスワード（確認）", with: "password"
      click_button "登録する"
    end
    context "メールアドレスが入力されていない場合" do
      let(:email_name) {""}
      it "登録ページに戻りエラーを表示する" do
          expect(page).to have_content "blank"
      end
    end
    context "データベースに同じメールアドレスが登録されている場合" do
      let(:email_name) {"a@example.com"}
      before do
        visit logout_path
        visit new_admin_user_path
        fill_in "メールアドレス" , with: "a@example.com"
        fill_in "パスワード", with: "password"
        fill_in "パスワード（確認）", with: "password"
        click_button "登録する"
      end
      it "エラー文を表示する" do
        expect(page).to have_content "Email has already been taken"# 「そのメールアドレスは別のアカウントで使用されています」と表示される
      end
    end

#     context "パスワードが未入力の場合" do
#       # メールアドレスを入力
#       it "登録ページに戻りエラーを表示する" do
#         # 登録ページへ戻り、「パスワードを入力してください」と表示される
#       end
#     end
#
#     context "パスワードとパスワードの確認がマッチしていない場合" do
#       # メールアドレスを入力
#       it "登録ページに戻りエラーを表示する" do
#         # 登録ページへ戻り、「パスワード確認が間違っています」と表示される
#       end
#     end
#
#   end
#
#
# # ここから下、必要か？　手動でいいかも
# #   describe "編集機能" do
# #
# #   end
# #
# #   describe "退会機能" do
# #
  end


end
