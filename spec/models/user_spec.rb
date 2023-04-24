require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザーの名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name: '', email: '失敗テスト')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: '失敗テスト', email: '')
        expect(user).not_to be_valid
      end
    end
  end
end
