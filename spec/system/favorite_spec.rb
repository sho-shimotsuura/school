require 'rails_helper'
RSpec.describe "お気に入り機能", type: :system do
  let!(:user) { FactoryBot.create(:user, :general) }
  let!(:user2) { FactoryBot.create(:user2, :executive) }
  let!(:user3) { FactoryBot.create(:user3, :general) }
  let!(:school) { FactoryBot.create(:school, user: user) }
  let!(:favorite) { FactoryBot.create(:favorite, school: school, user: user) }


  describe 'お気に入り機能' do
    context '一般ユーザーがお気に入り登録した場合' do
      it '登録できる' do
        visit new_user_session_path
        fill_in "user_email", with: "c@gmail.com"
        fill_in "user_password", with: "password3"
        click_button "ログイン"
        visit school_path(school)
        #expect(page).to have_selector("button", text: "お気に入りする")
        click_link "お気に入りする"
        #expect(page).to have_selector("link", text: "お気に入り登録しました")
        visit school_path(school)
        expect(page).to have_link "お気に入り解除する"
      end
    end
    context 'マイページで確認した時' do
      it 'お気に入りしたものが表示される' do
        visit new_user_session_path
        fill_in "user_email", with: "c@gmail.com"
        fill_in "user_password", with: "password3"
        click_button "ログイン"
        visit school_path(school)
        click_link "お気に入りする"
        visit user_path(user)
        #binding.pry
        expect(page).to have_content school.name
      end
    end  
    context '経営者がお気に入り登録した場合' do
      it '登録できない' do
        visit school_path(school)
        expect(page).not_to have_button "お気に入りする"
      end
    end
  end

  describe 'お気に入り解除機能' do
    context 'お気に入りを解除した時' do
      it 'マイページから表示がなくなる' do
        visit new_user_session_path
        fill_in "user_email", with: "c@gmail.com"
        fill_in "user_password", with: "password3"
        click_button "ログイン"
        visit school_path(school)
        click_link "お気に入りする"
        visit school_path(school)
        #binding.pry
        click_link "お気に入り解除する"
        expect(page).to have_content "お気に入り解除しました"
        visit user_path(user)
        expect(page).not_to have_content school.name
      end
    end
  end
end
