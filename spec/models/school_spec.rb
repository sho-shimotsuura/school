require 'rails_helper'
RSpec.describe '塾モデル機能', type: :model do
  #let!(:user2) { FactoryBot.create(:user2, :executive) }
  describe 'バリデーションのテスト' do
    context '塾名が空の場合' do
      it 'バリデーションにひっかかる' do
        school = School.new(name: '', prefecture: '失敗テスト', city: '失敗テスト', phone: '失敗テスト', overview: '失敗テスト')
        school.image.attach(io: File.open("#{Rails.root}/spec/fixtures/test_image.jpg"), filename: 'test_image.jpg', content_type: 'image/jpeg')
        expect(school).not_to be_valid
      end
    end
    context '都道府県が空の場合' do
      it 'バリデーションにひっかかる' do
        school = School.new(name: '失敗テスト', prefecture: '', city: '失敗テスト', phone: '失敗テスト', overview: '失敗テスト')
        school.image.attach(io: File.open("#{Rails.root}/spec/fixtures/test_image.jpg"), filename: 'test_image.jpg', content_type: 'image/jpeg')
        expect(school).not_to be_valid
      end
    end
    context '住所が空の場合' do
      it 'バリデーションに引っかかる' do
        school = School.new(name: '失敗テスト', prefecture: '失敗テスト', city: '', phone: '失敗テスト', overview: '失敗テスト')
        school.image.attach(io: File.open("#{Rails.root}/spec/fixtures/test_image.jpg"), filename: 'test_image.jpg', content_type: 'image/jpeg')
        expect(school).not_to be_valid
      end
    end
    context '電話番号が空の場合' do
      it 'バリデーションに引っかかる' do
        school = School.new(name: '失敗テスト', prefecture: '失敗テスト', city: '失敗テスト', phone: '', overview: '失敗テスト')
        school.image.attach(io: File.open("#{Rails.root}/spec/fixtures/test_image.jpg"), filename: 'test_image.jpg', content_type: 'image/jpeg')
        expect(school).not_to be_valid
      end
    end
    context '概要が空の場合' do
      it 'バリデーションに引っかかる' do
        school = School.new(name: '失敗テスト', prefecture: '失敗テスト', city: '失敗テスト', phone: '失敗テスト', overview: '')
        school.image.attach(io: File.open("#{Rails.root}/spec/fixtures/test_image.jpg"), filename: 'test_image.jpg', content_type: 'image/jpeg')
        expect(school).not_to be_valid
      end
    end
    context '画像が空の場合' do
      it 'バリデーションに引っかかる' do
        school = School.new(name: '失敗テスト', prefecture: '失敗テスト', city: '失敗テスト', phone: '失敗テスト', overview: '失敗テスト')
        expect(school).not_to be_valid
        expect(school.errors[:image]).to include("を入力してください")
      end
    end
  end
end
