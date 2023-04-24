require 'rails_helper'
RSpec.describe 'ログイン機能', type: :system do
  let!(:user2) { FactoryBot.create(:user2) }
  let!(:user) { FactoryBot.create(:user) }

  describe 'ユーザー登録機能' do
    context 'ユーザーを新規登録した場合' do
      it 'ユーザーページが表示される' do
        visit new_user_registration_path
        fill_in "user_name", with: "User3"
        fill_in "user_email", with: "c@gmail.com"
        fill_in "user_password", with: "password1"
        fill_in "user_password_confirmation", with: "password1"
        user_role "user_role", with: "executive"
        click_on "新規登録"
        expect(page).to have_content "c@gmail.com"
      end
    end
  end

  describe 'セッション機能' do
    context 'ログインした場合' do
      it 'ユーザーページが表示される' do
        visit new_user_session_path
        fill_in "user_email", with: "a@gmail.com"
        fill_in "user_password", with: "password1"
        click_on "ログイン"
        expect(page).to have_content "a@gmail.com"
      end
    end
    context 'ログアウトしようとした場合' do
      it 'ログアウトできること' do
        visit new_user_session_path
        fill_in "user_email", with: "a@gmail.com"
        fill_in "user_password", with: "password1"
        click_on "ログイン"
        click_link "ログアウト"
        expect(page).to have_content 'ログアウトしました'
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe '管理者機能' do
    context '管理ユーザが管理画面にアクセス使用とした場合' do
      it 'アクセスできること' do
        visit new_user_session_path
        fill_in "user_email", with: "b@gmail.com"
        fill_in "user_password", with: "password2"
        click_on "ログイン"
        expect(page).to have_content 'b@gmail.com'
        click_on "管理者ページ"
        expect(page).to have_content '管理者ページ'
      end
    end
  end

  describe 'マイページ機能' do
    context 'ログインユーザーがマイページにアクセス使用とした場合' do
      it 'アクセスできること' do
        visit new_user_session_path
        fill_in "user_email", with: "b@gmail.com"
        fill_in "user_password", with: "password2"
        click_on "ログイン"
        expect(page).to have_content 'b@gmail.com'
        visit schools_path
        click_on "マイページ"
        expect(page).to have_content 'b@gmail.com'
      end
    end
  end

  describe 'お気に入り機能' do
    context 'ログインユーザーがマイページにアクセス使用とした場合' do
      it 'アクセスできること' do
        visit new_user_session_path
        fill_in "user_email", with: "b@gmail.com"
        fill_in "user_password", with: "password2"
        click_on "ログイン"
        expect(page).to have_content 'b@gmail.com'
        visit schools_path
        click_on "マイページ"
        expect(page).to have_content 'b@gmail.com'
      end
    end
  end

