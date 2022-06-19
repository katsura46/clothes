# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create([
    { name: 'アウター(MENS)' },
    { name: 'トップス(MENS)' },
    { name: 'パンツ(MENS)'},
    { name: 'シューズ(MENS)'},
    { name: 'アイテム(MENS)'},

    { name: 'アウター(WOMENS)' },
    { name: 'トップス(WOMENS)' },
    { name: 'ワンピース(WOMENS)' },
    { name: 'パンツ(WOMENS)'},
    { name: 'スカート(WOMENS)' },
    { name: 'シューズ(WOMENS)'},
    { name: 'アイテム(WOMENS)'},

    { name: 'その他'},

    ])


  User.create(
    name: "管理者",
    email: 'admin@admin',
    password: 'adminadmin',
    admin: true
    )