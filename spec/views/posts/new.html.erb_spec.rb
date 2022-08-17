require 'rails_helper'

RSpec.describe 'posts/new', type: :view do
  before(:each) do
    assign(:post, Post.new(
                    user: nil,
                    title: 'MyString',
                    text: 'MyText',
                    comments_counter: 1,
                    posts_counter: 1
                  ))
  end

  it 'renders new post form' do
    render

    assert_select 'form[action=?][method=?]', posts_path, 'post' do
      assert_select 'input[name=?]', 'post[user_id]'

      assert_select 'input[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[text]'

      assert_select 'input[name=?]', 'post[comments_counter]'

      assert_select 'input[name=?]', 'post[posts_counter]'
    end
  end
end
