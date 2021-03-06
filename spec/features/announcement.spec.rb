require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
    background do
      User.create!(name: "k", email: 'meddy@gmail.Com',  password: '123456', admin: 'true')
      visit  root_path
      fill_in  'Email' ,  with: 'meddy@gmail.Com'
      fill_in  'Password' ,  with: '123456'
      click_on  'Log in'
    end
    scenario "Test announcement list" do
        visit announcements_path
        click_link "Post a new announcement"
        fill_in 'タイトル' , with: 'job1'
        fill_in '本文' , with: 'jobs'
        click_on  '登録する'
        click_on  'submit'
        expect(page).to have_text 'job1'   
     end  
     scenario "Test announcement creation" do
        visit announcements_path
        click_link "Post a new announcement"
        fill_in 'タイトル' , with: 'job1'
        fill_in '本文' , with: 'jobs'
        click_on  '登録する'
        click_on  'submit'
        expect(page).to have_text 'You have created new announcement!' 
      end
      scenario "Test announcement creation" do
        User.create!(name: "k", email: 'med@gmail.Com',  password: '123456', admin: 'true')
        user=User.last
        visit announcements_path
        Announcement.create!(title: "job1", text: 'jobs', user_id: user.id )
        announcement=Announcement.last
        visit announcement_path(id: announcement.id)
        expect(page).to have_text 'job1' 
      end
      scenario "Test announcement deletion" do
        visit announcements_path
        click_link "Post a new announcement"
        fill_in 'タイトル' , with: 'job1'
        fill_in '本文' , with: 'jobs'
        click_on  '登録する'
        click_on  'submit'
        click_on 'Delete'
        expect(page).to have_text 'You have deleted the announcement!'
      end
       
end