require "application_system_test_case"

class BookGenresTest < ApplicationSystemTestCase
  setup do
    @book_genre = book_genres(:one)
  end

  test "visiting the index" do
    visit book_genres_url
    assert_selector "h1", text: "Book genres"
  end

  test "should create book genre" do
    visit book_genres_url
    click_on "New book genre"

    fill_in "Book", with: @book_genre.book_id
    fill_in "Genre", with: @book_genre.genre_id
    click_on "Create Book genre"

    assert_text "Book genre was successfully created"
    click_on "Back"
  end

  test "should update Book genre" do
    visit book_genre_url(@book_genre)
    click_on "Edit this book genre", match: :first

    fill_in "Book", with: @book_genre.book_id
    fill_in "Genre", with: @book_genre.genre_id
    click_on "Update Book genre"

    assert_text "Book genre was successfully updated"
    click_on "Back"
  end

  test "should destroy Book genre" do
    visit book_genre_url(@book_genre)
    click_on "Destroy this book genre", match: :first

    assert_text "Book genre was successfully destroyed"
  end
end
