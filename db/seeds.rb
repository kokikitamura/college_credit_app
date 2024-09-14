user = User.create!(email: "aaaa@aaa.com",
                    password: "aaaaaa",
                    password_confirmation: "aaaaaa")

category_1 = user.categories.create!(name: "主専攻", credits: 48)
category_1_1 = category_1.children.create!(name: "学部科目の講義", credits: 24, user_id: user.id)
category_1_2 = category_1.children.create!(name: "基礎演習、基礎ゼミ", credits: 4, user_id: user.id)
category_1_3 = category_1.children.create!(name: "演習", credits: 4, user_id: user.id)
category_1_4 = category_1.children.create!(name: "残り", credits: 16, user_id: user.id)
category_2 = user.categories.create!(name: "副専攻", credits: 20)
category_3 = user.categories.create!(name: "外国語", credits: 24)
category_4 = user.categories.create!(name: "自由科目", credits: 32)
category_5 = user.categories.create!(name: "入門科目", credits: 4)
