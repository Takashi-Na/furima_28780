require 'rails_helper'

require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録がうまく行くとき'
      it "nickname,email,password,password_confirmation,family_name,first_name,kana_family_name,kana_first_name,birthdayが存在すれば登録できる" do
      end
      it "emailが＠を含んでいれば登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
      it "passwordが英数混合であれば登録できる" do
      end
      it "family_nameが漢字orひらがなorカタカナなら登録できる" do
      end
      it "first_nameが漢字orひらがなorカタカナなら登録できる" do
      end
      it "kana_family_nameがカタカナなら登録できる" do
      end
      it "kana_first_nameがカタカナなら登録できる" do
      end
    end

    context '新規登録がうまくいかないとき'
      it "nicknameが空だと登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "emailが重複していると登録できない" do
      end
      it "emailが＠が含まれていなければ登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordが6文字以下だと登録できない" do
      end
      it "passwordが英数混ざっていなければ登録できない" do
      end
      it "passwordがconfirmationにも同じものがないと登録できない" do
      end
      it "family_nameが空では登録できない" do
      end
      it "family_nameが漢字orひらがなorカタカナ以外だと登録できない" do
      end
      it "first_nameが空では登録できない" do
      end
      it "first_nameが漢字orひらがなorカタカナ以外だと登録できない" do
      end
      it "kana_family_nameが空では登録できない" do
      end
      it "kana_family_nameがカタカナ以外だと登録できない" do
      end
      it "kana_first_nameが空では登録できない" do
      end
      it "kana_first_nameがカタカナ以外だと登録できない" do
      end
      it "birthdayが空では登録できない" do
      end
    end
  end
end
