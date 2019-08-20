require 'rails_helper'

describe 'user deletes an article' do
  describe 'they link from the show page' do
    it 'shows all the articles except the one you deleted' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit articles_path

      click_link 'Delete'

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to_not have_content(article_1.title)

    end
  end
end
