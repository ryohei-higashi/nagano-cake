# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'test@test.com',
  password: '123456'
)
Customer.create!(
  email: 'test@test',
  password: '123456',
  last_name: 'てすと',
  first_name: 'てすと',
  last_name_kana: 'テスト',
  first_name_kana: 'テスト',
  postal_code: '123456',
  address: '日本東京',
  telephone_number: '123456',
  is_active: 'true',
)