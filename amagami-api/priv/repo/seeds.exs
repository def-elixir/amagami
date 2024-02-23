# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Amagami.Repo.insert!(%Amagami.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Amagami.Characters

character_data = [
  %{
    name: "絢辻 詞",
    cv: "名塚佳織",
    class: "2年A組",
    club: nil,
    blood_type: "AB型",
    age: 17,
    birthday: "10月8日",
    sign: "天秤座",
    like: "勉強・テスト・読書・貯金・自分を高める行為・自分のプラン",
    dislike: "昆虫や爬虫類・意地っ張りな自分・鏡・家族（特に姉）・自分の品位を下げる行為・自分のプランを邪魔する者",
    description: "クラス委員と創設祭実行委員を掛け持ちする、絵に描いたような優等生。文武両道で、クラスメイトのみならず教師からも一目置かれる存在。面倒見もよく、彼女の周りにはいつも人の輪ができている。静かな場所を好み、放課後は図書室によくいる模様。",
  },
  %{
    name: "桜井 梨穂子",
    cv: "新谷良子",
    class: "2年B組",
    club: "茶道部",
    blood_type: "A型",
    age: 17,
    birthday: "4月12日",
    sign: "牡羊座",
    like: "人の笑顔・甘い物・世間話・歌を歌うこと・ラジオを聞くこと",
    dislike: "数学・運動・悪口・怒ること",
    description: "自作の鼻歌を歌ったりして、いつもぼーっとしているのんびり屋。文系・理系共に梅原と最下位争いをするほど成績は悪く、運動神経も全ヒロイン中一番悪い。かなりのドジっ子でもあるが、どんな時も笑顔を絶やさず、男子に人気がある。",
  },
  %{
    name: "棚町 薫",
    cv: "佐藤利奈",
    class: "2年A組",
    club: nil,
    blood_type: "B型",
    age: 17,
    birthday: "8月1日",
    sign: "獅子座",
    like: "明るい雰囲気・恋愛の話・悪ノリ・甘い物・炭酸飲料・掃除洗濯・新発売や季節限定など目新しいもの",
    dislike: "暗い雰囲気・退屈・ノリの悪い人・カエル・中学時代のあだ名・試験やテストなど試されること・あやふやな物言い・勉強",
    description: "主人公とは中学校からの腐れ縁で、ツッコミ役。サバサバした男勝りな性格で、誰にでも分け隔てなく接するので友人が多い。詞とは、クラスの男子達の間で人気を二分している。流行、おしゃべり、イベントが大好きで、何にでも首を突っ込むトラブルメーカー。",
  },
  %{
    name: "中多 紗江",
    cv: "今野宏美",
    class: "1年B組",
    club: nil,
    blood_type: "A型",
    age: 15,
    birthday: "2月14日",
    sign: "水瓶座",
    like: "誠実で頼れる人物・牛乳・甘い物・穏やかな空間と時間・手紙・美也",
    dislike: "地震・香水・辛い物・人を傷つける嘘",
    description: "最近転校してきた1年生で、美也や逢のクラスメイト。出版社社長の令嬢として厳格な家に育ち、今時の女子高生にしては珍しく素直で礼儀正しい。反面、世間知らずなところがあり、極度の人見知り。",
  },
  %{
    name: "七咲 逢",
    cv: "ゆかな",
    class: "1年B組",
    club: "水泳部",
    blood_type: "O型",
    age: 15,
    birthday: "2月21日",
    sign: "魚座",
    like: "海・部活・夜（静かだから）・弟",
    dislike: "うるさい場所や人・病院・数学",
    description: "美也や紗江のクラスメイト。普段はポーカーフェイスで口数も少なく、クールな態度を取る。実際は温和で、人情深く面倒見がいい。共働きの両親を手伝って夕食を作ったり、年の離れた弟の面倒を見たりと家庭的な一面も見せている。料理上手。",
  },
  %{
    name: "森島 はるか",
    cv: "伊藤静",
    class: "3年A組",
    club: nil,
    blood_type: "O型",
    age: 18,
    birthday: "9月22日",
    sign: "乙女座",
    like: "動物・植物・かわいいものや人・誰かの面倒を見ること",
    dislike: "暗いところ・雷・機械の扱い・香草系の香りの強いもの・ホラーやスプラッタ全般",
    description: "魅惑の笑顔と長身のパーフェクトボディで、学校中の男子の視線を釘付けにする3年生。創設祭のミスサンタコンテストで2年連続優勝を果たしている。主人公や梅原にとっても憧れの存在であり、高嶺の花と思われている。",
  },
]

Enum.each(character_data, fn(data) ->
  Characters.create_character(data)
end)
