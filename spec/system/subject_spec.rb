require 'rails_helper'
RSpec.describe '科目管理機能', type: :system do
  let!(:user2) { FactoryBot.create(:user2, :executive) }
  let!(:user) { FactoryBot.create(:user, :general) }
  let!(:school) { FactoryBot.create(:school, user: user2) }
  let!(:subject) {FactoryBot.create(:subject)}
  let!(:handling) { FactoryBot.create(:handling, school: school, subject: subject) }


  describe '新規作成機能' do
    context '塾を科目付きで新規作成した場合' do
      it '作成した塾に科目付きで表示される' do
        visit new_user_session_path
        fill_in "user_email", with: "b@gmail.com"
        fill_in "user_password", with: "password2"
        click_button "ログイン"
        visit new_school_path
        fill_in 'school_name', with:'田中塾'
        fill_in 'school_prefecture', with:'兵庫県'
        fill_in 'school_city', with:'神戸市'
        fill_in 'school_phone', with:'090888777'
        fill_in 'school_overview', with:'個人経営'
        attach_file 'school_image', "#{Rails.root}/spec/fixtures/test_image.jpg"
        check "科目1"
        click_on '登録する'
        expect(page).to have_content '田中塾'
        expect(page).to have_content '兵庫県'
        expect(page).to have_content '神戸市'
        expect(page).to have_content '090888777'
        expect(page).to have_content '個人経営'
        expect(page).to have_content '科目1'
      end
    end
  end

  describe '検索機能' do
    context '科目のみで検索した場合' do
      it '科目を含む塾で絞り込まれる' do
        visit new_user_session_path
        fill_in "user_email", with: "b@gmail.com"
        fill_in "user_password", with: "password2"
        click_button "ログイン"
        visit schools_path
        subject1 = Subject.find_by(name: '科目1')
        check "q_subjects_id_eq_any_#{subject1.id}"
        click_button '検索'
        expect(page).to have_content '科目1'
      end
    end
  end  
end