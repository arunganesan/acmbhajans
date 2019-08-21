class BhajansController < ApplicationController
    skip_before_action :verify_authenticity_token

  def import_migration 
    Raga.create(:name => "Abheri", :arohanam => "s g1 m1 p n1 s", :avarohanam => "s n1 d2 p m1 g1 r2 s")
    Raga.create(:name => "Cakravakam", :arohanam => "s r1 g2 m1 p d2 n1 s", :avarohanam => "s n1 d2 p m1 g2 r1 s")
    Raga.create(:name => "Hamsadhvani", :arohanam => "s r2 g2 p n2 s", :avarohanam => "s n2 p g2 r2 s")
    Raga.create(:name => "Harikambhoji", :arohanam => "s r2 g2 m1 p d2 n1 s", :avarohanam => "s n1 d2 p m1 g2 r2 s")
    Raga.create(:name => "Madhyamavati", :arohanam => "s r2 m1 p n1 s", :avarohanam => "s n1 p m1 r2 s")
    Raga.create(:name => "Mayamalavagaula", :arohanam => "s r1 g2 m1 p d1 n2 s", :avarohanam => "s n2 d1 p m1 g2 r1 s")
    Raga.create(:name => "Misraranjini")
    Raga.create(:name => "Mohanam", :arohanam => "s r2 g2 p d2 s", :avarohanam => "s d2 p g2 r2 s")
    Raga.create(:name => "Pantuvarali")
    Raga.create(:name => "Ritigaula", :arohanam => "s g1 r2 g1 m1 n1 d2 m1 n1 n1 s", :avarohanam => "s n1 d2 m1 g1 m1 p M1 g1 r2 s")
    Raga.create(:name => "Sankarabharanam", :arohanam => "s r2 g2 m1 p d2 n2 s", :avarohanam => "s n2 d2 p m1 g2 r2 s")
    Raga.create(:name => "Sindhubhairavi", :arohanam => "s r1 g1 m1 p d1 n1 s", :avarohanam => "s n1 d1 p m1 g1 r1 s", :anyasvara => "r2 m2 d2 n2")
    Raga.create(:name => "Suddhadhanyasi", :arohanam => "s g1 m1 p n1 s", :avarohanam => "s n1 p m1 g1 s")
    Raga.create(:name => "Suddhasaveri", :arohanam => "s r2 m1 p d2 s", :avarohanam => "s d2 p m1 r2 s")
    Raga.create(:name => "Yamunakalyani", :arohanam => "s r2 g2 m2 p d2 n2 s", :avarohanam => "s n2 d2 p m2 g2 m1 r2 s", :anyasvara => "m1")
    Language.create(:name => "English")
    Language.create(:name => "Hindi or Sanskrit")
    Language.create(:name => "Malayalam")
    Language.create(:name => "Tamil")
    Deity.create(:name => "Amma")
    Deity.create(:name => "Devi")
    Deity.create(:name => "Ganapathi")
    Deity.create(:name => "Ganesah")
    Deity.create(:name => "Ganesha")
    Deity.create(:name => "Guru")
    Deity.create(:name => "Kali")
    Deity.create(:name => "Krishna")
    Deity.create(:name => "Philosophical")
    Deity.create(:name => "Rama")
    Deity.create(:name => "Sarasvathi")
    Deity.create(:name => "Shiva")
    Bhajan.create(:name => "Aareyanareyanishtam", :deity_id => Deity.find_by(name: "Krishna").id, :beat => "6")
    Bhajan.create(:name => "Ambapaluku", :deity_id => Deity.find_by(name: "Amma").id, :beat => "6")
    Bhajan.create(:name => "Amma Amma Enu Mandiram", :deity_id => Deity.find_by(name: "Amma").id, :beat => "6", :language_id => Language.find_by(name: "Tamil").id)
    Bhajan.create(:name => "Amma Ki Chaya", :deity_id => Deity.find_by(name: "Amma").id, :speed => "Slow", :beat => "6")
    Bhajan.create(:name => "Amma Ni Nidu", :deity_id => Deity.find_by(name: "Amma").id, :beat => "6")
    Bhajan.create(:name => "Amma Nin Rupam", :deity_id => Deity.find_by(name: "Amma").id, :speed => "Slow", :beat => "6")
    Bhajan.create(:name => "Amme Bhagavathi", :deity_id => Deity.find_by(name: "Amma").id, :beat => "6")
    Bhajan.create(:name => "Amritamaye Anandamayi", :deity_id => Deity.find_by(name: "Amma").id, :beat => "8")
    Bhajan.create(:name => "Amritanandamayi Ma Tujhko", :deity_id => Deity.find_by(name: "Amma").id, :speed => "Medium", :beat => "8")
    Bhajan.create(:name => "Annai Endrathume", :deity_id => Deity.find_by(name: "Amma").id, :beat => "6", :language_id => Language.find_by(name: "Tamil").id)
    Bhajan.create(:name => "Anupama Guna Nilaye", :deity_id => Deity.find_by(name: "Amma").id, :beat => "8")
    Bhajan.create(:name => "Arati", :deity_id => Deity.find_by(name: "Amma").id, :raga_id => Raga.find_by(name: "Yamunakalyani").id, :beat => "8")
    Bhajan.create(:name => "Bandham Illa", :deity_id => Deity.find_by(name: "Philosophical").id, :speed => "Slow", :raga_id => Raga.find_by(name: "Cakravakam").id, :beat => "7", :language_id => Language.find_by(name: "Malayalam").id)
    Bhajan.create(:name => "Barayya Siva", :deity_id => Deity.find_by(name: "Shiva").id, :beat => "6")
    Bhajan.create(:name => "Belli Bettadodeya Shivanu", :deity_id => Deity.find_by(name: "Shiva").id, :beat => "6")
    Bhajan.create(:name => "Chaitam Skalitham")
    Bhajan.create(:name => "Chilangai Katti", :deity_id => Deity.find_by(name: "Krishna").id, :beat => "6")
    Bhajan.create(:name => "Chod De Manase", :deity_id => Deity.find_by(name: "Philosophical").id, :speed => "Slow", :raga_id => Raga.find_by(name: "Misraranjini").id, :beat => "8", :language_id => Language.find_by(name: "Hindi or Sanskrit").id)
    Bhajan.create(:name => "Devi Maheswariye", :deity_id => Deity.find_by(name: "Devi").id, :speed => "Fast", :beat => "6")
    Bhajan.create(:name => "Eli Elelo", :deity_id => Deity.find_by(name: "Rama").id)
    Bhajan.create(:name => "Ellam Ariyunnor Amme", :deity_id => Deity.find_by(name: "Amma").id, :speed => "Slow", :raga_id => Raga.find_by(name: "Ritigaula").id, :beat => "6", :language_id => Language.find_by(name: "Malayalam").id)
    Bhajan.create(:name => "Entamme Nin Makkale", :deity_id => Deity.find_by(name: "Guru").id, :speed => "Medium", :beat => "6")
    Bhajan.create(:name => "Ente Kannunir", :speed => "Slow", :raga_id => Raga.find_by(name: "Mayamalavagaula").id, :beat => "8")
    Bhajan.create(:name => "Enthinu Sokam", :raga_id => Raga.find_by(name: "Pantuvarali").id, :beat => "8")
    Bhajan.create(:name => "Gajanana He", :deity_id => Deity.find_by(name: "Ganesha").id, :speed => "Medium", :raga_id => Raga.find_by(name: "Madhyamavati").id, :beat => "8")
    Bhajan.create(:name => "Gam Ganapathaye", :deity_id => Deity.find_by(name: "Ganapathi").id, :raga_id => Raga.find_by(name: "Hamsadhvani").id, :beat => "8")
    Bhajan.create(:name => "Ganapathi Gunanidhi", :deity_id => Deity.find_by(name: "Ganapathi").id, :beat => "6")
    Bhajan.create(:name => "Guru Charanam", :deity_id => Deity.find_by(name: "Guru").id, :raga_id => Raga.find_by(name: "Sankarabharanam").id, :beat => "8")
    Bhajan.create(:name => "Hare Murare", :deity_id => Deity.find_by(name: "Krishna").id, :speed => "148 bpm", :raga_id => Raga.find_by(name: "Abheri").id, :beat => "5")
    Bhajan.create(:name => "Hariyuva Nadiya", :deity_id => Deity.find_by(name: "Shiva").id, :beat => "8")
    Bhajan.create(:name => "In The Still", :deity_id => Deity.find_by(name: "Guru").id, :speed => "Slow", :beat => "8", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Jago Ma Kali", :deity_id => Deity.find_by(name: "Kali").id, :speed => "Medium", :beat => "6")
    Bhajan.create(:name => "Jai Ganesha Jai", :deity_id => Deity.find_by(name: "Ganesha").id, :beat => "8")
    Bhajan.create(:name => "Jai Radha Madhav", :deity_id => Deity.find_by(name: "Krishna").id, :speed => "Slow", :beat => "8")
    Bhajan.create(:name => "Jaya Jaya Devi Dayala Hari", :deity_id => Deity.find_by(name: "Devi").id)
    Bhajan.create(:name => "Kala Murali", :deity_id => Deity.find_by(name: "Krishna").id, :raga_id => Raga.find_by(name: "Sankarabharanam").id)
    Bhajan.create(:name => "Kamesha Vamakshi", :beat => "6")
    Bhajan.create(:name => "Karuna Sagara Sri Rama", :deity_id => Deity.find_by(name: "Rama").id)
    Bhajan.create(:name => "Karuna Sindho Bhairavi", :raga_id => Raga.find_by(name: "Sindhubhairavi").id, :beat => "8/6")
    Bhajan.create(:name => "Katinnu Katai", :beat => "6")
    Bhajan.create(:name => "Kottaiyendre", :deity_id => Deity.find_by(name: "Shiva").id)
    Bhajan.create(:name => "Krishna Mukunda Madhava", :deity_id => Deity.find_by(name: "Krishna").id, :raga_id => Raga.find_by(name: "Suddhasaveri").id)
    Bhajan.create(:name => "Krishna Ninne Bala", :deity_id => Deity.find_by(name: "Krishna").id, :raga_id => Raga.find_by(name: "Suddhadhanyasi").id, :beat => "8")
    Bhajan.create(:name => "Manikya Chilaye", :raga_id => Raga.find_by(name: "Madhyamavati").id)
    Bhajan.create(:name => "Morning Song", :deity_id => Deity.find_by(name: "Krishna").id, :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Muralikayil Oru Ganam", :raga_id => Raga.find_by(name: "Mohanam").id)
    Bhajan.create(:name => "Nilayilla Ulakil", :deity_id => Deity.find_by(name: "Philosophical").id, :speed => "Medium", :beat => "8/5")
    Bhajan.create(:name => "Om Shakthi", :deity_id => Deity.find_by(name: "Devi").id, :beat => "6")
    Bhajan.create(:name => "Omkareshwara", :deity_id => Deity.find_by(name: "Shiva").id, :beat => "5", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Only Love", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Parasahasra Hridayangalil", :beat => "8")
    Bhajan.create(:name => "Sakalakala Devate", :deity_id => Deity.find_by(name: "Sarasvathi").id, :beat => "6")
    Bhajan.create(:name => "Sambo Sankara Umapathe", :deity_id => Deity.find_by(name: "Shiva").id, :speed => "Fast", :beat => "8")
    Bhajan.create(:name => "Shankar Sut Ho Tum", :deity_id => Deity.find_by(name: "Ganesah").id, :beat => "8")
    Bhajan.create(:name => "Sri Chakram", :deity_id => Deity.find_by(name: "Devi").id, :raga_id => Raga.find_by(name: "Mohanam").id, :beat => "6")
    Bhajan.create(:name => "Sri Krishna Saranam", :deity_id => Deity.find_by(name: "Krishna").id, :speed => "Medium", :beat => "8")
    Bhajan.create(:name => "Sri Raghavam", :deity_id => Deity.find_by(name: "Rama").id)
    Bhajan.create(:name => "Suni He Galiya", :deity_id => Deity.find_by(name: "Krishna").id, :beat => "6")
    Bhajan.create(:name => "Take Me Away", :beat => "8", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Teach Me the Language", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Thakutiyilla Ennakum Oru", :language_id => Language.find_by(name: "Tamil").id)
    Bhajan.create(:name => "Trilok Matr Rupini", :deity_id => Deity.find_by(name: "Devi").id, :speed => "Fast", :beat => "8")
    Bhajan.create(:name => "Udayaval Umayennu", :deity_id => Deity.find_by(name: "Devi").id, :beat => "8")
    Bhajan.create(:name => "Vani Mani Mathe")
    Bhajan.create(:name => "Vedambike", :beat => "6")
    Bhajan.create(:name => "Venkata Ramana")
    Bhajan.create(:name => "Vilvattal Archittom", :deity_id => Deity.find_by(name: "Shiva").id)
    Bhajan.create(:name => "Vizhittuduval Maname")
    Bhajan.create(:name => "We Are All Beads", :beat => "6", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Where Did You Run", :deity_id => Deity.find_by(name: "Krishna").id, :raga_id => Raga.find_by(name: "Harikambhoji").id, :beat => "6", :language_id => Language.find_by(name: "English").id)
    
  end
  
  def dummy_database
    for i in 1..10 do
      Language.create(:name => "Language #{i}")
      Raga.create(:name =>"Raga #{i}")
      Deity.create(:name => "Deity #{i}")
      Person.create(:name => "Person #{i}")
      Bhajan.create(:name => "Bhajan #{i}")
      Event.create(:name => "Event #{i}")
      Weekend.create(:name => "Weekend #{i}")
    end
    
    render :json => {
      'contents': Person.all,
      'bhajans': Bhajan.all,
    }
  end

  def edit
    if request.post?
      if params['id'] == ''
        bhajan = Bhajan.new  
      else
        bhajan = Bhajan.find_by(id: params['id'])
      end

      bhajan.name = params['name']
      bhajan.beat = params['beat']
      bhajan.speed = params['speed']
      bhajan.raga_id = params['raga_id']
      bhajan.deity_id = params['deity_id']
      bhajan.language_id = params['language_id']
      bhajan.save!
    end

    
    render :json => {
      'contents': Bhajan.all.order(id: :desc),
      'ragas': Raga.all,
      'deities': Deity.all,
      'languages': Language.all,
    }
  end
end
