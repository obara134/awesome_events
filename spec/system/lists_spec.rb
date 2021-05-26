# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:event) { create(:event,name:'hoge',introduction:'introduction') }
  describe 'トップ画面(top_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面(root_path)に一覧ページへのリンクが表示されているか' do
        expect(page).to have_link"", href: books_path
      end
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end

  describe "一覧画面のテスト" do
    before do
      visit events_path
    end
    context '一覧の表示とリンクの確認' do
      it 'eventの一覧が表示されているか' do
        expect(page).to have_selector 'card'
      end
      it 'evntのタイトルと詳細が表示されているか' do
        (1..5)each do |i|
          Book.create(name:'hoge'+ i.to_s,introduction:'body'+i.to_s)
        end
      end
    end
  end

  describe '詳細画面のテスト' do
    before do
      visit event_path(event)
    end
    context '表示の確認' do
      it 'イベントの名前と詳細が表示されること' do
        expect(page).to have_content event.name
        expect(page).to have_content event.introduction
      end
      it '編集リンクが表示される' do
        edit_link = find_all('a')[0]
        expect(edit_link.native.inner_text).to match(/edit/i)
      end
    end
    context 'リンクの遷移先の確認' do
      it 'イベントを編集するの遷移先は編集画面か' do
        edit_link = find_all('a')[0]
        edit_link.click
        expect(current_path).to eq('/events/' + event.id.to_s + '/edit')
      end
    end
  end


