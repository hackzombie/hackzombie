# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Status.create(:name=>'idea')
Status.create(:name=>'hacking')
Status.create(:name=>'launched')
Status.create(:name=>'backburner')
Status.create(:name=>'adopt me?')
Status.create(:name=>'fund me?')

Platform.create(:name=>'Android')
Platform.create(:name=>'iOS')
Platform.create(:name=>'Mobile web')
Platform.create(:name=>'Web')
Platform.create(:name=>'Other')
