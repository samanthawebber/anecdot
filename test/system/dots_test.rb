require "application_system_test_case"

class DotsTest < ApplicationSystemTestCase
  setup do
    @dot = dots(:first)
  end

  # When we visit #Dots#index page
  # We expect to see a title with the text "Dots"
  test "Creating new dot" do
    visit dots_path
    assert_selector "h1", text: "Dots"
  end

  # When we click on the link with text "New dot"
  # we expect to land on a page with the title "New dot"
  click_on "New dot"
  assert_selector "h1", text: "New dot"


  # When we fill in the name input with "Capybara name"
  # and click on "Create dot"
  fill_in "Name", with: "Capybara name"
  click_on "Create dot"
  # expect to be on page with title "Dots"
  # and see "Capybara name" added to the list
  assert_selector "title", text: "Dots"
  assert_text "Capybara name"
end

test "Showing a dot" do
  visit dots_path
  click_link @dot.name

  assert_selector "h1", text: @dot.name
end

test "Updating a dot" do
  visit dots_path
  assert_selector "h1", text: "Dots"

  click_on "Edit", match: :first
  assert_selector "h1", text: "Edit dot"

  fill_in "Name", with: "Updated name"
  click_on "Update dot"

  assert_selector "h1", text: "Dots"
  assert_text "Updated name"
end

test "Destroying a dot" do
  visit dots_path
  assert_text @dot.name

  click_on "Delete", match: :first
  assert_no_text @dot.name
end
