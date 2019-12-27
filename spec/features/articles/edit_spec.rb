require "rails_helper"

describe "user edits exisiting article" do
  describe "they fill in edited portion" do
    it "edits a exisiting article" do
      article_1 = Article.create!(title: "Title 1", body: "New Body")

      visit "/articles/#{article_1.id}"
      click_on "Edit"

      expect(current_path).to eq("/articles/#{article_1.id}/edit")

      expect(page).to have_field("article[title]")
      expect(page).to have_field("article[body]")

      fill_in "article[title]", with: "Edited Title!"
      fill_in "article[body]",  with: "New Body!"


      click_on "Update Article"
      expect(current_path).to eq(article_path(article_1))

      expect(page).to have_content("Edited Title!")
      expect(page).to have_content("Article 'Edited Title!' was updated.")

    end
  end
end
