require 'spec_helper'

describe TwitterBootstrapHelper do
  describe "tb_navbar" do
    it "returns structure for navbar" do
      helper.tb_navbar.should have_selector('div', :class => 'navbar') do |navbar|
        navbar.should have_selector('div', :class => 'navbar-inner') do |navbar_inner|
          navbar_inner.should have_selector('div', :class => 'container')
        end
      end
    end

    it "yields block" do
      content = "foo bar"
      tb_navbar = helper.tb_navbar {content}
      tb_navbar.should have_selector('div', :text => content, :class => 'container')
    end

    it "uses given tag for outer element" do
      tb_navbar = helper.tb_navbar(:nav)
      tb_navbar.should have_selector('nav', :class => 'navbar')
    end

    it "uses provided options in outer element" do
      tb_navbar = helper.tb_navbar(:nav, :id => 'action-bar')
      tb_navbar.should have_selector('nav', :class => 'navbar', :id => 'action-bar')
    end
  end

  describe "tb_popover" do
    it "returns an element formatted for Twitter Bootstrap hover popup" do
      tb_popover = helper.tb_popover("Content")
      tb_popover.should have_css("div[rel='popover']")
    end

    it "transforms into HTML" do
      tb_popover = helper.tb_popover("Foo\nBar\n\nBaz")
      tb_popover.should have_css("[data-content='<p>Foo\n<br />Bar</p>\n\n<p>Baz</p>']")
    end

    it "contains an optional title" do
      tb_popover = helper.tb_popover("Content", :title => "Title")
      tb_popover.should have_css("div[title='Title']")
    end

    it "uses given tag for element" do
      tb_popover = helper.tb_popover("Content", :tag => :strong, :title => "Title")
      tb_popover.should have_css("strong[title='Title']")
    end

    it "uses given classname for element" do
      tb_popover = helper.tb_popover("Content", :class => 'icon-info-sign', :title => "Title")
      tb_popover.should have_css("div.icon-info-sign[title='Title']")
    end

    it "truncates" do
      tb_popover = helper.tb_popover("x"*10000)
      tb_popover.should have_css("[data-content='<p>#{"x"*797}...</p>']")
    end
  end
end
