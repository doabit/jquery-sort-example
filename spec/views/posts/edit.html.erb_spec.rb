require 'spec_helper'

describe "posts/edit.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :new_record? => false,
      :title => "MyString",
      :body => "MyText",
      :position => 1
    ))
  end

  it "renders the edit post form" do
    render

    rendered.should have_selector("form", :action => post_path(@post), :method => "post") do |form|
      form.should have_selector("input#post_title", :name => "post[title]")
      form.should have_selector("textarea#post_body", :name => "post[body]")
      form.should have_selector("input#post_position", :name => "post[position]")
    end
  end
end
