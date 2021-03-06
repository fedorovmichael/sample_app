require 'spec_helper'

#auto generated code
#RSpec.describe "StaticPages", type: :request do
#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
#      get static_pages_index_path
#      expect(response).to have_http_status(200)
#    end
#  end
#end

describe "Static pages" do

   subject { page }

   describe "Home page" do   
    before { visit root_path }         
    it {should have_content('Sample App')} 
    it { should have_title(full_title(''))}
   end
    
   describe "Help page" do   
    before { visit help_path }       
    it {should have_content('Help') }    
    it {should have_title(full_title('Help')) }
   end 
   
    describe "About page" do
      before { visit about_path }    
    it { should have_content('About us') }
    it { should have_title(full_title('About us'))}
   end
   
    describe "Contact" do    
     before { visit contact_path }
    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
   end        
    
 end
