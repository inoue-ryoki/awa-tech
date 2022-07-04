require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
  end

    context 'ツイート投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('教室の掲載したい人はこちら')
      # 投稿ページに移動する
       visit new_post_path
      # フォームに情報を入力する

       image_path = Rails.root.join('public/images/test_image.png')
       attach_file('post[image]', image_path, make_visible: true)
       fill_in '記事内容', with: @post.text
      # 送信するとpostモデルのカウントが1上がることを確認する



       expect{
         find('input[name="commit"]').click
          }.to change { Post.count }.by(1)
      # トップページに遷移する
      visit root_path
       execute_script('window.scrollBy(0,10000)')
      # トップページには先ほど投稿した記事が存在することを確認する（画像）
       expect(page).to have_selector('img')
      # トップページには先ほど投稿した記事が存在することを確認する（テキスト）
       expect(page).to have_content (@post.text)

    end
  end
  context '記事投稿ができないとき'do
    it 'ログインしていないと記事投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('教室の掲載したい人はこちら')
       # ログインページに遷移する
         visit new_user_session_path
    end
  end


end
