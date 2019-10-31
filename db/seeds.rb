# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(admin_flg: true,name: 'adminman', email:'kanrininn@kanri.com', password: 'kannrininn',password_confirmation: "kannrininn")





Category.create(name: 'SF')
Category.create(name: '時代')
Category.create(name: 'ミリタリー')
Category.create(name: '恋愛')
Category.create(name: 'エッセイ')
Category.create(name: '純文学')
Category.create(name: '図鑑')
Category.create(name: 'レシピ')
Category.create(name: '評論')
Category.create(name: '学園もの')
