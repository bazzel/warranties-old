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
end
