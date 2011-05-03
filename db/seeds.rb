# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

City.create([{
    :name => 'Moscow',
    :latitude => '55.755790',
    :longitude => '37.617630'
  }, {
    :name => 'Bangkok',
    :latitude => '13.723420',
    :longitude => '100.476230'
}])

Cost.create([{
    :origin_id => 1,
    :destination_id => 2,
    :depart_date => '2011-05-01',
    :return_date => '2011-05-10',
    :value => '1000'
  }, {
    :origin_id => 1,
    :destination_id => 2,
    :depart_date => '2011-05-01',
    :return_date => '2011-05-15',
    :value => '1500'
}])

