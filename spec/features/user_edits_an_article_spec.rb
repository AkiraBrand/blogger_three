require 'rails_helper'
require 'pry'

describe 'user can edit an existing article' do
  describe 'they link from the articles index' do
    describe 'they edit the title and body' do
      it 'edits the article' do
         article = Article.create!(title: "Title 1", body: "Body 1")

         visit article_path(article)

         click_link "Edit"

         # expect current_path.to eq(edit_article_path)

         fill_in "article[title]", with: "Old Title"
         fill_in "article[body]", with: "Old Body"

         click_on "Update Article"

         expect(page).to have_content "Old Title"
         expect(page).to have_content "Old Body"
         expect(page).to have_content ("Article Old Title was updated")
       end
    end
  end
end
