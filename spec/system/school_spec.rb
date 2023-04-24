require 'rails_helper'
RSpec.describe '塾管理機能', type: :system do
  let!(:user2) { FactoryBot.create(:user2, :executive) }
  let!(:user) { FactoryBot.create(:user, :general) }
  let!(:school) { FactoryBot.create(:school, user: user2) }

  describe '新規作成機能' do
    context '経営者が塾を新規作成した場合' do
      it '作成した塾が表示される' do
        visit new_user_session_path
        fill_in "user_email", with: "b@gmail.com"
        fill_in "user_password", with: "password2"
        click_button "ログイン", match: :first
        visit new_school_path
        fill_in 'school_name', with:'田中塾'
        fill_in 'school_prefecture', with:'兵庫県'
        fill_in 'school_city', with:'神戸市'
        fill_in 'school_phone', with:'090888777'
        fill_in 'school_overview', with:'個人経営'
        attach_file 'school_image', "#{Rails.root}/spec/fixtures/test_image.jpg"
        click_on '登録する'
        expect(page).to have_content '田中塾'
        expect(page).to have_content '兵庫県'
        expect(page).to have_content '神戸市'
        expect(page).to have_content '090888777'
        expect(page).to have_content '個人経営'
      end
    end
  end

  describe '塾編集機能' do
    context '投稿者が塾の情報を編集した時' do
      it '変更内容が反映させる' do
        visit new_user_session_path
        fill_in "user_email", with: "b@gmail.com"
        fill_in "user_password", with: "password2"
        click_button "ログイン"
        visit user_path(user)
        click_button "編集"
        fill_in 'school_name', with:'田中塾'
        fill_in 'school_prefecture', with:'兵庫県'
        fill_in 'school_city', with:'神戸市'
        fill_in 'school_phone', with:'090888777'
        fill_in 'school_overview', with:'個人経営'
        attach_file 'school_image', "#{Rails.root}/spec/fixtures/test_image.jpg"
        click_button "更新する"
        expect(page).to have_content "School was successfully updated."
        visit school_path(school)
        expect(page).to have_content '田中塾'
        expect(page).to have_content '兵庫県'
        expect(page).to have_content '神戸市'
        expect(page).to have_content '090888777'
        expect(page).to have_content '個人経営'
        expect(page).to have_selector("img[src$='test_image.jpg']")
      end
    end
  end

  describe '塾削除機能' do
    context '投稿者が塾の情報を削除した時' do
      it '塾情報が削除される' do
        visit new_user_session_path
        fill_in "user_email", with: "b@gmail.com"
        fill_in "user_password", with: "password2"
        click_button "ログイン"
        visit user_path(user)
        click_button "削除"
        page.driver.browser.switch_to.alert.accept 
        expect(page).to have_content "School was successfully destroyed."
        expect(School.exists?(school.id)).to be_falsey
      end
    end
  end

  describe '検索機能' do
    context '塾名で検索する場合' do
      it'検索結果に該当する塾が表示される' do 
        visit new_user_session_path
        fill_in "user_email", with: "b@gmail.com"
        fill_in "user_password", with: "password2"
        click_button "ログイン"
        visit schools_path
        fill_in 'q_name_cont', with: 'test_name'
        click_button '検索'
        expect(page).to have_content 'test_name'
      end
    end
    context '県名で検索する場合' do
      it '県名に完全一致するタスクが絞り込まれる' do
        visit new_user_session_path
        fill_in "user_email", with: "b@gmail.com"
        fill_in "user_password", with: "password2"
        click_button "ログイン"
        visit schools_path
        fill_in 'q_prefecture_cont', with: 'test_prefecture'
        click_button '検索'
        expect(page).to have_content 'test_prefecture'
      end
    end
    # context '科目で検索する場合' do
    #   it '科目と完全一致するタスク絞り込まれる' do
    #     visit new_user_session_path
    #     fill_in "user_email", with: "b@gmail.com"
    #     fill_in "user_password", with: "password2"
    #     click_button "ログイン"
    #     visit schools_path
    #     fill_in 'q_subjects_id_eq_any_1', with: '科目1'
    #     click_button '検索'
    #     expect(page).to have_content '科目1'
    #   end
    # end
  end
end