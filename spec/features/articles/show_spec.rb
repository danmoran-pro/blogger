require 'rails-helper'

RSpec.describe "user sees one article" do
   describe "they link from the articles index" do
     it "displays information for one article" do
       article_1 = Article.create!(title: "Title 1", body: "New Body")
       article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit articles_path

      click_link(article_1.title)

      expect(page).to have_content("#{article_1.title}")
      expect(page).to have_content(article_1.body)
     end
   end
end
