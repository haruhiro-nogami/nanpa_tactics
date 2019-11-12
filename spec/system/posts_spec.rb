require "rails_helper"

describe "投稿管理機能", type: :system do
  let(:user_a) { FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com") }# let ユーザーAの作成準備
  let(:user_b) { FactoryBot.create(:user, name: "ユーザーB", email: "b@example.com") }# let ユーザーBの作成準備
  let!(:post_a) { FactoryBot.create(:post, title: "テスト投稿A", user: user_a) }# let! ユーザーAの投稿を必ず作成

  before do
    visit login_path
    fill_in "メールアドレス", with: login_user.email
    fill_in "パスワード", with: login_user.password
    click_button "ログインする"# 共通化：誰かでログインする
  end

  shared_examples_for "ユーザーAが作成した投稿が表示される" do
    it { expect(page).to have_content "テスト投稿"}# 作成した投稿のタイトルが表示されていることを確認
  end

  describe "一覧表示機能" do
    context "ユーザーAがログインしている時" do
      let(:login_user) {user_a}# ユーザーAを作成してログイン let
      it_behaves_like "ユーザーAが作成した投稿が表示される"
    end

    context "ユーザーBがログインしている時" do
      let(:login_user) {user_b}  # ユーザーBを作成してログインlet
      it "ユーザーAが作成した投稿が表示されない" do
        expect(page).to have_no_content "テスト投稿"# 表示されていないことを確認
      end
    end
  end

  describe "詳細表示機能" do
    context "ユーザーAがログインしている時" do
      let(:login_user) {user_a}# ユーザーAを作成してログイン let
      before do
        visit post_path(post_a)
      end
      it_behaves_like "ユーザーAが作成した投稿が表示される"
    end
  end

  describe "新規作成機能" do
    let(:login_user) {user_a}# ユーザーAを作成してログイン let

    before do
      visit new_post_path
      fill_in "post_title", with: post_title
      click_button "Create Post"
    end

    context "新規作成でタイトルを入力" do
      let(:post_title) { "新規作成テスト" }# post_nameにタイトルを入れる
      it "正常に登録" do
        expect(page).to have_selector ".alert-success",  text: "投稿に成功しました"
        expect(page).to have_content "新規作成テスト"# 登録されたことを確認
      end
    end

    context "新規作成でタイトルが未入力" do
      let(:post_title) { "" }# post_nameに何も入れない
      it "エラーになる" do
        within "#error_explanation" do
          expect(page).to have_content "blank"# エラー文が表示されている
        end
      end
    end
  end

  describe "投稿編集機能" do
    let(:login_user) {user_a}# ユーザーAを作成してログイン let
    before do
      visit post_path(post_a) #edit_post_pathだとidをどう指定していいのかわからず、苦肉の策
      click_link "編集"
      fill_in "post_title", with: "編集機能テスト"
      fill_in "post_description", with: "編集しました"
      click_button "Update Post"
    end

    context "詳細に一文を追加" do
      before do
        visit post_path(post_a)
      end
      it "正常に更新" do
        expect(page).to have_content "編集機能テスト"# 編集されたことを確認　成功しましたの一文認証とか
        expect(page).to have_content "編集しました"

      end
    end
  end
  #
  # describe "投稿削除機能" do
  #   let(:login_user) {user_a}# ユーザーAを作成してログイン let
  #   before do
  #     click_link "テスト投稿A"
  #     click_link "削除"
  #     click_button "OK" ここがうまくいかない
  #   end
  #
  #   it "正常に削除" do
  #     expect(page).to have_no_content "テスト投稿A"
  #   end
  #
  # end
#
#   describe "投稿検索機能" do
#     # ユーザーAでログイン
#
#     before do
#       # search_post_pathに移動
#       fill_in "タイトル検索" , with: search_name
#       click_button "Search"
#     end
#     context "「サンプル」で検索した場合" do
#       # search_nameにサンプルと入れる
#       it "タイトルに「サンプル」を含まない投稿が表示されない" do
#
#       end
#     end
#     context "詳細検索で複数の条件を入れた場合" do
#       # search_nameを入力
#       # 他の検索要素を入力
#       it "指定した条件に合わない投稿が表示されない" do
#
#       end
#     end
#     context "該当する投稿が一件もない場合" do
#       # search_nameを入力
#       # ありえない検索要素を入力
#       it "「該当する投稿が見つかりません」と表示されている" do
#
#       end
#     end
#
#   end
#
end
