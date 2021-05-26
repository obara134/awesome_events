# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book,'モデルに関するテスト',type::model do
  describe 'モデルのテスト' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:event)).to be_valid
    end
  end
  context"空白のバリデーションチェック" do
    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      event = Event.new(name:"",introduction:'hoge')
      expect(event).to be_invalid
      expect(event.errors[:name]).to include("cant be blank")
    end
    it "introductionが空白の場合にバリデーションチェックされ空白のエラーメッセージが表示されるか" do
      event = Event.new(name:"hoge",introduction:'')
      expect(event).to be_invalid
      expect(event.errors[:introduction]).to include("cant be blank")
    end
  end
end

