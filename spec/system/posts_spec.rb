require "rails_helper"

describe "投稿管理機能", type: :system do
  # let ユーザーAの作成準備
  # let ユーザーBの作成準備
  # let! ユーザーAの投稿を必ず作成

  before do
    #ユーザーAの作成を実行 let
    #ユーザーAの投稿を作成
    # 共通化：誰かでログインする
  end

  shared_examples_for "ユーザーAが作成した投稿が表示される" do
    # 作成した投稿のタイトルが表示されていることを確認
  end

  describe "一覧表示機能" do


    context "ユーザーAがログインしている時" do
      # ユーザーAを作成してログイン let

      it_behaves_like "ユーザーAが作成した投稿が表示される"

    end

    context "ユーザーBがログインしている時" do
        # ユーザーBを作成してログインlet

      it "ユーザーAが作成した投稿が表示されない" do
        # 表示されていないことを確認
      end

    end

  end

  describe "詳細表示機能" do
    context "ユーザーAがログインしている時" do
      # ユーザーAを作成してログイン
      before do
        # 投稿を作成してアクセスvisit post_path(ポストA)
      end

      it_behaves_like "ユーザーAが作成した投稿が表示される"

    end

  end

  describe "新規作成機能" do
    # ユーザーAでログイン

    before do
      visit new_post_path
      fill_in "title", with: post_name
      click_button "Create"
    end

    context "新規作成でタイトルを入力" do
      # post_nameにタイトルを入れる
      it "正常に登録" do
        # 登録されたことを確認
      end
    end

    context "新規作成でタイトルが未入力" do
      # post_nameに何も入れない
      it "エラーになる" do
        # エラー文が表示されている
      end
    end
  end

  describe "投稿編集機能" do
    # ユーザーAでログイン

    before do
      visit edit_post_path
      fill_in "title", with: "編集"
      fill_in "description", with: post_description
      click_button "Update"
    end

    context "詳細に一文を追加" do
      post_descriptionに一文を入れる
      it "正常に更新" do
        # 編集されたことを確認　成功しましたの一文認証とか
      end
    end
  end

  # describe "投稿削除機能" do　必要ないか？
  #   # ユーザーAでログイン
  #   before do
  #     visit destroy_post_path
  #     fill_in "description", with: post_description
  #     click_button "削除"
  #   end
  #
  #   it "正常に削除" do
  #
  #   end
  #
  # end

  describe "投稿検索機能" do
    # ユーザーAでログイン

    before do
      # search_post_pathに移動
      fill_in "タイトル検索" , with: search_name
      click_button "Search"
    end
    context "「サンプル」で検索した場合" do
      # search_nameにサンプルと入れる
      it "タイトルに「サンプル」を含まない投稿が表示されない" do

      end
    end
    context "詳細検索で複数の条件を入れた場合" do
      # search_nameを入力
      # 他の検索要素を入力
      it "指定した条件に合わない投稿が表示されない" do

      end
    end
    context "該当する投稿が一件もない場合" do
      # search_nameを入力
      # ありえない検索要素を入力      
      it "「該当する投稿が見つかりません」と表示されている" do

      end
    end

  end

end
