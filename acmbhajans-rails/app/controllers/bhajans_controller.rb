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
    Deity.create(:name => "Ganesha")
    Deity.create(:name => "Guru")
    Deity.create(:name => "Kali")
    Deity.create(:name => "Krishna")
    Deity.create(:name => "Philosophical")
    Deity.create(:name => "Rama")
    Deity.create(:name => "Sarasvathi")
    Deity.create(:name => "Shiva")
    Bhajan.create(:name => "")
    Bhajan.create(:name => "Aareyanareyanishtam", :deity_id => Deity.find_by(name: "Krishna").id, :beat => "6")
    Bhajan.create(:name => "Adi Shakthi Mahalayankari")
    Bhajan.create(:name => "Ambapaluku", :deity_id => Deity.find_by(name: "Amma").id, :beat => "6")
    Bhajan.create(:name => "Amma Amma Enu Mandiram", :deity_id => Deity.find_by(name: "Amma").id, :beat => "6", :language_id => Language.find_by(name: "Tamil").id)
    Bhajan.create(:name => "Amma Ki Chaya", :deity_id => Deity.find_by(name: "Amma").id, :speed => "Slow", :beat => "6")
    Bhajan.create(:name => "Amma Nanum")
    Bhajan.create(:name => "Amma Ni Nidu", :deity_id => Deity.find_by(name: "Amma").id, :beat => "6")
    Bhajan.create(:name => "Amma Nin Rupam", :deity_id => Deity.find_by(name: "Amma").id, :speed => "Slow", :beat => "6")
    Bhajan.create(:name => "Amme Bhagavathi", :deity_id => Deity.find_by(name: "Amma").id, :beat => "6")
    Bhajan.create(:name => "Amritamaye Anandamayi", :deity_id => Deity.find_by(name: "Amma").id, :beat => "8")
    Bhajan.create(:name => "Amritanandamayi Ma Tujhko", :deity_id => Deity.find_by(name: "Amma").id, :speed => "Medium", :beat => "8")
    Bhajan.create(:name => "Amritesvari Vandanam")
    Bhajan.create(:name => "Ananda Janani")
    Bhajan.create(:name => "Andela Ravati")
    Bhajan.create(:name => "Annai Endrathume", :deity_id => Deity.find_by(name: "Amma").id, :beat => "6", :language_id => Language.find_by(name: "Tamil").id)
    Bhajan.create(:name => "Anupama Guna Nilaye", :deity_id => Deity.find_by(name: "Amma").id, :beat => "8")
    Bhajan.create(:name => "Anutabam Valarinnu")
    Bhajan.create(:name => "Arati", :deity_id => Deity.find_by(name: "Amma").id, :raga_id => Raga.find_by(name: "Yamunakalyani").id, :beat => "8")
    Bhajan.create(:name => "Arati Kunjavihari")
    Bhajan.create(:name => "Arikil Undekillum")
    Bhajan.create(:name => "Atalarase")
    Bhajan.create(:name => "Aya He Sara")
    Bhajan.create(:name => "Ayiram Dipangal")
    Bhajan.create(:name => "Bandalo")
    Bhajan.create(:name => "Bandham Illa", :deity_id => Deity.find_by(name: "Philosophical").id, :speed => "Slow", :raga_id => Raga.find_by(name: "Cakravakam").id, :beat => "7", :language_id => Language.find_by(name: "Malayalam").id)
    Bhajan.create(:name => "Barayya Siva", :deity_id => Deity.find_by(name: "Shiva").id, :beat => "6")
    Bhajan.create(:name => "Belli Bettadodeya Shivanu", :deity_id => Deity.find_by(name: "Shiva").id, :beat => "6")
    Bhajan.create(:name => "Bhagavane Bhagavane")
    Bhajan.create(:name => "Chaitam Skalitham")
    Bhajan.create(:name => "Chilangai Katti", :deity_id => Deity.find_by(name: "Krishna").id, :beat => "6")
    Bhajan.create(:name => "Chinna Chinna")
    Bhajan.create(:name => "Chintannai")
    Bhajan.create(:name => "Chod De Manase", :deity_id => Deity.find_by(name: "Philosophical").id, :speed => "Slow", :raga_id => Raga.find_by(name: "Misraranjini").id, :beat => "8", :language_id => Language.find_by(name: "Hindi or Sanskrit").id)
    Bhajan.create(:name => "Chotti Chotti")
    Bhajan.create(:name => "De Darshan Ma")
    Bhajan.create(:name => "Devi Maheswariye", :deity_id => Deity.find_by(name: "Devi").id, :speed => "Fast", :beat => "6")
    Bhajan.create(:name => "Dhinom Ke Dukha")
    Bhajan.create(:name => "Eli Elelo", :deity_id => Deity.find_by(name: "Rama").id)
    Bhajan.create(:name => "Ellam Ariyunnor Amme", :deity_id => Deity.find_by(name: "Amma").id, :speed => "Slow", :raga_id => Raga.find_by(name: "Ritigaula").id, :beat => "6", :language_id => Language.find_by(name: "Malayalam").id)
    Bhajan.create(:name => "Entamme Nin Makkale", :deity_id => Deity.find_by(name: "Guru").id, :speed => "Medium", :beat => "6")
    Bhajan.create(:name => "Ente Kannunir", :speed => "Slow", :raga_id => Raga.find_by(name: "Mayamalavagaula").id, :beat => "8")
    Bhajan.create(:name => "Enthinu Sokam", :raga_id => Raga.find_by(name: "Pantuvarali").id, :beat => "8")
    Bhajan.create(:name => "Gajanana He", :deity_id => Deity.find_by(name: "Ganesha").id, :speed => "Medium", :raga_id => Raga.find_by(name: "Madhyamavati").id, :beat => "8")
    Bhajan.create(:name => "Gam Ganapathaye", :deity_id => Deity.find_by(name: "Ganesha").id, :raga_id => Raga.find_by(name: "Hamsadhvani").id, :beat => "8")
    Bhajan.create(:name => "Ganapathi Gunanidhi", :deity_id => Deity.find_by(name: "Ganesha").id, :beat => "6")
    Bhajan.create(:name => "Ganesha Namah Om")
    Bhajan.create(:name => "Govinda Govinda")
    Bhajan.create(:name => "Govinda Madhava")
    Bhajan.create(:name => "Govinda jaya jaya")
    Bhajan.create(:name => "Guru Charanam", :deity_id => Deity.find_by(name: "Guru").id, :raga_id => Raga.find_by(name: "Sankarabharanam").id, :beat => "8")
    Bhajan.create(:name => "Hare Murare", :deity_id => Deity.find_by(name: "Krishna").id, :speed => "148 bpm", :raga_id => Raga.find_by(name: "Abheri").id, :beat => "5")
    Bhajan.create(:name => "Hare Panduranga")
    Bhajan.create(:name => "Hariyuva Nadiya", :deity_id => Deity.find_by(name: "Shiva").id, :beat => "8")
    Bhajan.create(:name => "Hrdaya Me Lavo")
    Bhajan.create(:name => "Hridayanjali")
    Bhajan.create(:name => "In The Still", :deity_id => Deity.find_by(name: "Guru").id, :speed => "Slow", :beat => "8", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "In the still of the night")
    Bhajan.create(:name => "Isvari Jagadisvari")
    Bhajan.create(:name => "Jago Ma Kali", :deity_id => Deity.find_by(name: "Kali").id, :speed => "Medium", :beat => "6")
    Bhajan.create(:name => "Jai Ambe")
    Bhajan.create(:name => "Jai Ganesha Jai", :deity_id => Deity.find_by(name: "Ganesha").id, :beat => "8")
    Bhajan.create(:name => "Jai Jagadambe Durge Ma")
    Bhajan.create(:name => "Jai Ma Ambe")
    Bhajan.create(:name => "Jai Mata Di")
    Bhajan.create(:name => "Jai Radha Madhav", :deity_id => Deity.find_by(name: "Krishna").id, :speed => "Slow", :beat => "8")
    Bhajan.create(:name => "Jaya Jaya Devi Dayala Hari", :deity_id => Deity.find_by(name: "Devi").id)
    Bhajan.create(:name => "Jhilam Jhilam")
    Bhajan.create(:name => "Kahan Ho Kanha")
    Bhajan.create(:name => "Kala Bhairava")
    Bhajan.create(:name => "Kala Murali", :deity_id => Deity.find_by(name: "Krishna").id, :raga_id => Raga.find_by(name: "Sankarabharanam").id)
    Bhajan.create(:name => "Kalam Kanalum")
    Bhajan.create(:name => "Kali karunakari")
    Bhajan.create(:name => "Kamesha Vamakshi", :beat => "6")
    Bhajan.create(:name => "Karlo Naiyya")
    Bhajan.create(:name => "Karuna Sagara Sri Rama", :deity_id => Deity.find_by(name: "Rama").id)
    Bhajan.create(:name => "Karuna Sindho Bhairavi", :raga_id => Raga.find_by(name: "Sindhubhairavi").id, :beat => "8/6")
    Bhajan.create(:name => "Katinnu Katai", :beat => "6")
    Bhajan.create(:name => "Kotha Thumi")
    Bhajan.create(:name => "Kottaiyendre", :deity_id => Deity.find_by(name: "Shiva").id)
    Bhajan.create(:name => "Krishna Mukunda Madhava", :deity_id => Deity.find_by(name: "Krishna").id, :raga_id => Raga.find_by(name: "Suddhasaveri").id)
    Bhajan.create(:name => "Krishna Ninne Bala", :deity_id => Deity.find_by(name: "Krishna").id, :raga_id => Raga.find_by(name: "Suddhadhanyasi").id, :beat => "8")
    Bhajan.create(:name => "Le Lo Sharanam")
    Bhajan.create(:name => "Mama Janani")
    Bhajan.create(:name => "Manasa Chora")
    Bhajan.create(:name => "Manikya Chilaye", :raga_id => Raga.find_by(name: "Madhyamavati").id)
    Bhajan.create(:name => "Mariyamma Mariyamma")
    Bhajan.create(:name => "Me Khadi")
    Bhajan.create(:name => "Mere Jhoppidi De")
    Bhajan.create(:name => "Mere Sunle Araj")
    Bhajan.create(:name => "Morning Song", :deity_id => Deity.find_by(name: "Krishna").id, :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Mother Nature")
    Bhajan.create(:name => "Murali Ganam")
    Bhajan.create(:name => "Muralikayil Oru Ganam", :raga_id => Raga.find_by(name: "Mohanam").id)
    Bhajan.create(:name => "Nache tu")
    Bhajan.create(:name => "Narayana Narayana")
    Bhajan.create(:name => "Navinte tumbil nin")
    Bhajan.create(:name => "Nilavanna")
    Bhajan.create(:name => "Nilayilla Ulakil", :deity_id => Deity.find_by(name: "Philosophical").id, :speed => "Medium", :beat => "8/5")
    Bhajan.create(:name => "O Lord of Vrndavan")
    Bhajan.create(:name => "Om Guru Mata")
    Bhajan.create(:name => "Om Namah Shivaya")
    Bhajan.create(:name => "Om Shakthi", :deity_id => Deity.find_by(name: "Devi").id, :beat => "6")
    Bhajan.create(:name => "Omkara Pankaja")
    Bhajan.create(:name => "Omkareshwara", :deity_id => Deity.find_by(name: "Shiva").id, :beat => "5", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "One Tiny Atom")
    Bhajan.create(:name => "Only Love", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Parasahasra Hridayangalil", :beat => "8")
    Bhajan.create(:name => "Pelava Kaiviral")
    Bhajan.create(:name => "Pyare Kanha")
    Bhajan.create(:name => "Sakalakala Devate", :deity_id => Deity.find_by(name: "Sarasvathi").id, :beat => "6")
    Bhajan.create(:name => "Sambo Sankara Umapathe", :deity_id => Deity.find_by(name: "Shiva").id, :speed => "Fast", :beat => "8")
    Bhajan.create(:name => "Sarasi Nayana")
    Bhajan.create(:name => "Shankar Sut Ho Tum", :deity_id => Deity.find_by(name: "Ganesha").id, :beat => "8")
    Bhajan.create(:name => "Sita Ram")
    Bhajan.create(:name => "Sneha Sudhamayi")
    Bhajan.create(:name => "Sri Chakram", :deity_id => Deity.find_by(name: "Devi").id, :raga_id => Raga.find_by(name: "Mohanam").id, :beat => "6")
    Bhajan.create(:name => "Sri Krishna Saranam", :deity_id => Deity.find_by(name: "Krishna").id, :speed => "Medium", :beat => "8")
    Bhajan.create(:name => "Sri Raghavam", :deity_id => Deity.find_by(name: "Rama").id)
    Bhajan.create(:name => "Suni He Galiya", :deity_id => Deity.find_by(name: "Krishna").id, :beat => "6")
    Bhajan.create(:name => "Taaye Mahamaye")
    Bhajan.create(:name => "Take Me Away", :beat => "8", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Taraka nama")
    Bhajan.create(:name => "Teach Me the Language", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Thakutiyilla Ennakum Oru", :language_id => Language.find_by(name: "Tamil").id)
    Bhajan.create(:name => "Trilok Matr Rupini", :deity_id => Deity.find_by(name: "Devi").id, :speed => "Fast", :beat => "8")
    Bhajan.create(:name => "Udayaval Umayennu", :deity_id => Deity.find_by(name: "Devi").id, :beat => "8")
    Bhajan.create(:name => "Unni Ganapathiye")
    Bhajan.create(:name => "Vani Mani Mathe")
    Bhajan.create(:name => "Vedambike", :beat => "6")
    Bhajan.create(:name => "Vedana Kondoru")
    Bhajan.create(:name => "Venkata Ramana")
    Bhajan.create(:name => "Vilvattal Archittom", :deity_id => Deity.find_by(name: "Shiva").id)
    Bhajan.create(:name => "Viswa Vimohini")
    Bhajan.create(:name => "Vizhittuduval Maname")
    Bhajan.create(:name => "Vraj Me Aisa")
    Bhajan.create(:name => "We Are All Beads", :beat => "6", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "Where Did You Run", :deity_id => Deity.find_by(name: "Krishna").id, :raga_id => Raga.find_by(name: "Harikambhoji").id, :beat => "6", :language_id => Language.find_by(name: "English").id)
    Bhajan.create(:name => "tataykalai nikitum")
    Event.create(:name => "practice")
    Event.create(:name => "satsang")
    Weekend.create(:name => "3/30/2019")
    Weekend.create(:name => "4/13/2019")
    Weekend.create(:name => "4/20/2019")
    Weekend.create(:name => "4/27/2019")
    Weekend.create(:name => "4/6/2019")
    Weekend.create(:name => "5/11/2019")
    Weekend.create(:name => "5/18/2019")
    Weekend.create(:name => "5/25/2019")
    Weekend.create(:name => "5/4/2019")
    Weekend.create(:name => "5/5/2019")
    Weekend.create(:name => "6/1/2019")
    Weekend.create(:name => "6/15/2019")
    Weekend.create(:name => "6/22/2019")
    Weekend.create(:name => "6/29/2019")
    Weekend.create(:name => "6/8/2019")
    Weekend.create(:name => "7/13/2019")
    Weekend.create(:name => "7/20/2019")
    Weekend.create(:name => "7/27/2019")
    Weekend.create(:name => "7/6/2019")
    Weekend.create(:name => "8/10/2019")
    Weekend.create(:name => "8/17/2019")
    Weekend.create(:name => "8/3/2019")
    Person.create(:name => "Alisha")
    Person.create(:name => "Arun Ganesan", :phone => "734-358-4745", :email => "arunganesan123@gmail.com")
    Person.create(:name => "Chad Kymal", :phone => "734-604-6552", :email => "ckymal@omnex.com")
    Person.create(:name => "Chidanand Wordeman", :phone => "510-545-2971", :email => "henfetchit@gmail.com")
    Person.create(:name => "Dhanya Menon", :phone => "616-745-6578", :email => "menondha@gmail.com")
    Person.create(:name => "Ganesan Kandasamy", :phone => "734-276-6594")
    Person.create(:name => "Gauri Anil", :email => "None")
    Person.create(:name => "Gayatri Krishna", :phone => "586-489-6229", :email => "gayatripadmarao@gmail.com")
    Person.create(:name => "Group")
    Person.create(:name => "Jay Puthran", :phone => "734-995-0029", :email => "jputhran@yahoo.com")
    Person.create(:name => "Jennifer")
    Person.create(:name => "Krishna Kumar", :phone => "248-455-9813", :email => "kk_amma@yahoo.com")
    Person.create(:name => "Kumar Krishnaswamy", :phone => "734-277-4072")
    Person.create(:name => "Madhavi Mai", :phone => "734-330-3051", :email => "madhavimai@gmail.com")
    Person.create(:name => "Matt Fillion", :phone => "248-840-0629", :email => "matt.fillion713@gmail.com")
    Person.create(:name => "Minni Kumar", :phone => "734-717-6615", :email => "minni_kumar@adp.com")
    Person.create(:name => "Naren Nathan", :phone => "734-578-2225", :email => "narennathan11@gmail.com")
    Person.create(:name => "Nayana Kamath", :phone => "313-674-2646", :email => "nans351@gmail.com")
    Person.create(:name => "Nikhil Unnikrishnan", :phone => "972-408-7036", :email => "nikhilu5000@gmail.com")
    Person.create(:name => "Niranjan Nair", :phone => "413-474-0968", :email => "S.niranjan.nair@gmail.com")
    Person.create(:name => "Paru Krishna", :phone => "734-546-4031", :email => "parukrishna98@gmail.com")
    Person.create(:name => "Prasanth Ganesan", :phone => "734-358-4746", :email => "prasanth123@gmail.com")
    Person.create(:name => "Prema Puthran", :phone => "734-223-6061", :email => "premabhakthi@gmail.com")
    Person.create(:name => "Raji Sankaran", :phone => "810-733-1356", :email => "rajisankaran1@yahoo.com")
    Person.create(:name => "Ramakrishna Kamath", :phone => "586-506-6206", :email => "ramakrishnakamath123@gmail.com")
    Person.create(:name => "Ratna Paula Stone", :phone => "248-982-9620", :email => "gemston66@gmail.com")
    Person.create(:name => "Rupashree (Antoinette) Malone", :phone => "313-212-9354", :email => "tonimalone757@gmail.com")
    Person.create(:name => "Sanjith Puthran", :email => "None")
    Person.create(:name => "Saswat Ramakrishna")
    Person.create(:name => "Senthil Nathan", :email => "sennathan16@hotmail.com")
    Person.create(:name => "Shambavi (Susan) Witt", :phone => "989-390-8371", :email => "siswitt@gmail.com")
    Person.create(:name => "Shreeja Rucker", :email => "shreejarucker@gmail.com")
    Person.create(:name => "Sita Keane", :phone => "734-717-2302", :email => "amritasai@yahoo.com")
    Person.create(:name => "Soundary Ganesan", :phone => "734-780-2157", :email => "soundary_samy@yahoo.com")
    Person.create(:name => "Sudarshan Varaprath", :phone => "989-284-6361", :email => "s.varaprath@gmail.com")
    Person.create(:name => "Sumathy Nathan", :phone => "734-858-7264", :email => "sumathynathan@hotmail.com")
    Person.create(:name => "Sundari Murthy", :phone => "734-657-4183", :email => "smurthy48187@yahoo.com")
    Person.create(:name => "Vishnu Anil", :email => "None")
    Person.create(:name => "Vyshnavi Krishna", :phone => "248-520-8974", :email => "vg.vaish@gmail.com")
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Raji Sankaran")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C#", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Ganesha Namah Om").id, :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Raji Sankaran"), Person.find_by(name: "Sumathy Nathan")]
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Madhavi Mai")]
    obj.backup += [Person.find_by(name: "Chidanand Wordeman"), Person.find_by(name: "Sumathy Nathan")]
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Sumathy Nathan")]
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Soundary Ganesan"), Person.find_by(name: "Sumathy Nathan")]
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Soundary Ganesan")]
    obj.backup += [Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Sumathy Nathan")]
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :weekend_id => Weekend.find_by(name: "4/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Soundary Ganesan")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :bhajan_id => Bhajan.find_by(name: "Govinda Madhava").id, :weekend_id => Weekend.find_by(name: "6/29/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Amma Nanum").id, :weekend_id => Weekend.find_by(name: "6/29/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "6/29/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Prema Puthran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "6/29/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Soundary Ganesan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Viswa Vimohini").id, :weekend_id => Weekend.find_by(name: "6/29/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "A#", :weekend_id => Weekend.find_by(name: "6/29/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "6/29/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Madhavi Mai")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "6/29/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Omkara Pankaja").id, :weekend_id => Weekend.find_by(name: "6/29/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Pyare Kanha").id, :weekend_id => Weekend.find_by(name: "6/29/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Vyshnavi Krishna"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "A", :bhajan_id => Bhajan.find_by(name: "Taaye Mahamaye").id, :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Vyshnavi Krishna")]
    obj.backup += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C#", :bhajan_id => Bhajan.find_by(name: "Me Khadi").id, :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Naren Nathan")]
    obj.backup += [Person.find_by(name: "Vyshnavi Krishna"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :bhajan_id => Bhajan.find_by(name: "Jai Mata Di").id, :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Krishna Kumar")]
    obj.backup += [Person.find_by(name: "Vyshnavi Krishna"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Vyshnavi Krishna")]
    obj.backup += [Person.find_by(name: "Krishna Kumar")]
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += [Person.find_by(name: "Prema Puthran"), Person.find_by(name: "Vyshnavi Krishna")]
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Naren Nathan")]
    obj.backup += [Person.find_by(name: "Jennifer"), Person.find_by(name: "Chidanand Wordeman")]
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += [Person.find_by(name: "Prema Puthran"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Vyshnavi Krishna"), Person.find_by(name: "Prema Puthran")]
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Soundary Ganesan")]
    obj.backup += [Person.find_by(name: "Sumathy Nathan"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Atalarase").id, :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Sumathy Nathan"), Person.find_by(name: "Vyshnavi Krishna")]
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Prema Puthran")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Jay Puthran")]
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Vyshnavi Krishna")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Sumathy Nathan")]
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Jai Ma Ambe").id, :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Vyshnavi Krishna")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Om Namah Shivaya").id, :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Minni Kumar"), Person.find_by(name: "Vyshnavi Krishna"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/25/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Minni Kumar"), Person.find_by(name: "Vyshnavi Krishna"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "6/22/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "6/22/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "6/22/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Matt Fillion")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "6/22/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Prema Puthran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Chintannai").id, :weekend_id => Weekend.find_by(name: "6/22/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sundari Murthy")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :weekend_id => Weekend.find_by(name: "6/22/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ratna Paula Stone")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "6/22/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Hrdaya Me Lavo").id, :weekend_id => Weekend.find_by(name: "6/22/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :weekend_id => Weekend.find_by(name: "6/22/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Madhavi Mai")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Chad Kymal")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "G#", :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Rupashree (Antoinette) Malone")]
    obj.backup += [Person.find_by(name: "Chad Kymal"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C#", :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Chad Kymal")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Arati Kunjavihari").id, :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Chad Kymal")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C#", :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Chad Kymal"), Person.find_by(name: "Sumathy Nathan")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Mere Jhoppidi De").id, :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "A#", :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += [Person.find_by(name: "Chad Kymal"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Jai Jagadambe Durge Ma").id, :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Naren Nathan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Prasanth Ganesan")]
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Dhinom Ke Dukha").id, :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan")]
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Prasanth Ganesan")]
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Chad Kymal")]
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Chinna Chinna").id, :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Chad Kymal")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Rupashree (Antoinette) Malone")]
    obj.backup += [Person.find_by(name: "Chidanand Wordeman")]
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Jai Ambe").id, :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Niranjan Nair")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Prasanth Ganesan")]
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Kalam Kanalum").id, :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Sumathy Nathan"), Person.find_by(name: "Chad Kymal")]
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Mama Janani").id, :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Prasanth Ganesan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Chad Kymal")]
    obj.save
    obj = Rendition.create(:order => "10", :shruti => "", :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Chad Kymal"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "11", :shruti => "", :weekend_id => Weekend.find_by(name: "6/8/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Chad Kymal"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "D#", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Chad Kymal")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Chad Kymal")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "G", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Chad Kymal")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "G#", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Rupashree (Antoinette) Malone")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Chad Kymal")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += [Person.find_by(name: "Raji Sankaran"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Madhavi Mai")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Chad Kymal")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Paru Krishna")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ratna Paula Stone")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Niranjan Nair")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :weekend_id => Weekend.find_by(name: "5/11/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Rupashree (Antoinette) Malone")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Pelava Kaiviral").id, :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Nayana Kamath")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Arikil Undekillum").id, :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Ayiram Dipangal").id, :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Hridayanjali").id, :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += [Person.find_by(name: "Chidanand Wordeman"), Person.find_by(name: "Minni Kumar")]
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Mere Sunle Araj").id, :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Minni Kumar")]
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Minni Kumar")]
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Bandalo").id, :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Jay Puthran"), Person.find_by(name: "Prema Puthran")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += [Person.find_by(name: "Nayana Kamath"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Rupashree (Antoinette) Malone")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :weekend_id => Weekend.find_by(name: "7/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Sanjith Puthran"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Minni Kumar"), Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Nayana Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Jay Puthran"), Person.find_by(name: "Prema Puthran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Prasanth Ganesan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Naren Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Gayatri Krishna")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Matt Fillion")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Krishna Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Senthil Nathan"), Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "4/13/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Nayana Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "A", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Jay Puthran"), Person.find_by(name: "Prema Puthran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C#", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Prasanth Ganesan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Soundary Ganesan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Madhavi Mai")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "4/20/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "C", :bhajan_id => Bhajan.find_by(name: "Navinte tumbil nin").id, :weekend_id => Weekend.find_by(name: "7/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :bhajan_id => Bhajan.find_by(name: "tataykalai nikitum").id, :weekend_id => Weekend.find_by(name: "7/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Taraka nama").id, :weekend_id => Weekend.find_by(name: "7/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "C", :bhajan_id => Bhajan.find_by(name: "Govinda Govinda").id, :weekend_id => Weekend.find_by(name: "7/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :bhajan_id => Bhajan.find_by(name: "").id, :weekend_id => Weekend.find_by(name: "7/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :bhajan_id => Bhajan.find_by(name: "In the still of the night").id, :weekend_id => Weekend.find_by(name: "7/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "C", :bhajan_id => Bhajan.find_by(name: "Nache tu").id, :weekend_id => Weekend.find_by(name: "7/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :bhajan_id => Bhajan.find_by(name: "Govinda jaya jaya").id, :weekend_id => Weekend.find_by(name: "7/6/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "E", :bhajan_id => Bhajan.find_by(name: "Kali karunakari").id, :weekend_id => Weekend.find_by(name: "7/6/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "E", :bhajan_id => Bhajan.find_by(name: "Aya He Sara").id, :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :bhajan_id => Bhajan.find_by(name: "Sarasi Nayana").id, :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += [Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Prasanth Ganesan")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :bhajan_id => Bhajan.find_by(name: "O Lord of Vrndavan").id, :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Madhavi Mai")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Sita Keane")]
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Vyshnavi Krishna")]
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += [Person.find_by(name: "Soundary Ganesan"), Person.find_by(name: "Madhavi Mai")]
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sita Keane")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Madhavi Mai")]
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Nayana Kamath"), Person.find_by(name: "Soundary Ganesan")]
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Amritesvari Vandanam").id, :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Naren Nathan")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Vyshnavi Krishna")]
    obj.save
    obj = Rendition.create(:order => "10", :shruti => "", :weekend_id => Weekend.find_by(name: "7/27/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Vyshnavi Krishna")]
    obj.backup += [Person.find_by(name: "Ramakrishna Kamath"), Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Alisha")]
    obj.backup += [Person.find_by(name: "Shreeja Rucker"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Kahan Ho Kanha").id, :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Shreeja Rucker")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Sumathy Nathan"), Person.find_by(name: "Soundary Ganesan")]
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Sumathy Nathan")]
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "C", :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Chad Kymal")]
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "C#", :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Chad Kymal")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "A", :bhajan_id => Bhajan.find_by(name: "Mother Nature").id, :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Madhavi Mai")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Chidanand Wordeman")]
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "B", :bhajan_id => Bhajan.find_by(name: "One Tiny Atom").id, :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Paru Krishna")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Soundary Ganesan")]
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Naren Nathan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Shreeja Rucker")]
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Shreeja Rucker"), Person.find_by(name: "Alisha"), Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Prasanth Ganesan")]
    obj.save
    obj = Rendition.create(:order => "10", :shruti => "", :weekend_id => Weekend.find_by(name: "6/1/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Arun Ganesan")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Shreeja Rucker")]
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "B", :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "C", :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "A", :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Vyshnavi Krishna")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "B", :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Soundary Ganesan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "G", :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Krishna Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Mariyamma Mariyamma").id, :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Krishna Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Hare Panduranga").id, :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Vyshnavi Krishna")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/18/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Manasa Chora").id, :weekend_id => Weekend.find_by(name: "6/15/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += [Person.find_by(name: "Ganesan Kandasamy")]
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "6/15/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += [Person.find_by(name: "Ganesan Kandasamy")]
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "6/15/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += [Person.find_by(name: "Ganesan Kandasamy")]
    obj.lead += [Person.find_by(name: "Gayatri Krishna")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "6/15/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += [Person.find_by(name: "Ganesan Kandasamy")]
    obj.lead += [Person.find_by(name: "Jay Puthran"), Person.find_by(name: "Prema Puthran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Ananda Janani").id, :weekend_id => Weekend.find_by(name: "6/15/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += [Person.find_by(name: "Ganesan Kandasamy")]
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Vraj Me Aisa").id, :weekend_id => Weekend.find_by(name: "6/15/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += [Person.find_by(name: "Ganesan Kandasamy")]
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "6/15/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += [Person.find_by(name: "Ganesan Kandasamy")]
    obj.lead += [Person.find_by(name: "Rupashree (Antoinette) Malone")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :bhajan_id => Bhajan.find_by(name: "Murali Ganam").id, :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Raji Sankaran"), Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C# (lower)", :bhajan_id => Bhajan.find_by(name: "Narayana Narayana").id, :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Soundary Ganesan")]
    obj.backup += [Person.find_by(name: "Raji Sankaran"), Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C#", :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "B", :bhajan_id => Bhajan.find_by(name: "Le Lo Sharanam").id, :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Prasanth Ganesan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "A#", :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Raji Sankaran")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "B", :bhajan_id => Bhajan.find_by(name: "Vedana Kondoru").id, :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Vyshnavi Krishna")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Isvari Jagadisvari").id, :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Minni Kumar")]
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Unni Ganapathiye").id, :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Raji Sankaran"), Person.find_by(name: "Minni Kumar")]
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += [Person.find_by(name: "Raji Sankaran"), Person.find_by(name: "Minni Kumar")]
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Madhavi Mai")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Madhavi Mai")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Minni Kumar")]
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Prema Puthran")]
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Jay Puthran"), Person.find_by(name: "Prema Puthran")]
    obj.backup += [Person.find_by(name: "Minni Kumar")]
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Prasanth Ganesan")]
    obj.backup += [Person.find_by(name: "Vyshnavi Krishna"), Person.find_by(name: "Minni Kumar")]
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Anutabam Valarinnu").id, :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Soundary Ganesan")]
    obj.backup += [Person.find_by(name: "Minni Kumar"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Kotha Thumi").id, :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Naren Nathan")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "10", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Jhilam Jhilam").id, :weekend_id => Weekend.find_by(name: "8/10/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan"), Person.find_by(name: "Kumar Krishnaswamy"), Person.find_by(name: "Nikhil Unnikrishnan"), Person.find_by(name: "Shambavi (Susan) Witt")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += [Person.find_by(name: "Nayana Kamath"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "D#", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "G", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Krishna Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "G#", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Jay Puthran"), Person.find_by(name: "Prema Puthran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Prasanth Ganesan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Gayatri Krishna")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Matt Fillion")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "5/5/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Nikhil Unnikrishnan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ratna Paula Stone")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Nayana Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Jay Puthran"), Person.find_by(name: "Prema Puthran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Soundary Ganesan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ratna Paula Stone")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "10", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Chad Kymal")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "4/6/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Matt Fillion")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Sneha Sudhamayi").id, :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Prasanth Ganesan")]
    obj.backup += [Person.find_by(name: "Naren Nathan")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Naren Nathan"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Vyshnavi Krishna")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "C#", :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Naren Nathan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Krishna Kumar")]
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Prasanth Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Minni Kumar"), Person.find_by(name: "Vyshnavi Krishna")]
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Minni Kumar"), Person.find_by(name: "Vyshnavi Krishna"), Person.find_by(name: "Prasanth Ganesan")]
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Karlo Naiyya").id, :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Vyshnavi Krishna")]
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Prasanth Ganesan")]
    obj.backup += [Person.find_by(name: "Minni Kumar"), Person.find_by(name: "Niranjan Nair")]
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Krishna Kumar")]
    obj.backup += [Person.find_by(name: "Minni Kumar"), Person.find_by(name: "Vyshnavi Krishna")]
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Adi Shakthi Mahalayankari").id, :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Niranjan Nair")]
    obj.backup += [Person.find_by(name: "Minni Kumar"), Person.find_by(name: "Prasanth Ganesan")]
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Vyshnavi Krishna")]
    obj.backup += [Person.find_by(name: "Minni Kumar"), Person.find_by(name: "Prasanth Ganesan")]
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Om Guru Mata").id, :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Minni Kumar")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Vyshnavi Krishna")]
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :weekend_id => Weekend.find_by(name: "8/17/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Krishna Kumar"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Prasanth Ganesan"), Person.find_by(name: "Vyshnavi Krishna"), Person.find_by(name: "Minni Kumar")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Andela Ravati").id, :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Prema Puthran")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Nilavanna").id, :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Prema Puthran")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Saswat Ramakrishna")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Soundary Ganesan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Soundary Ganesan"), Person.find_by(name: "Prema Puthran")]
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Jay Puthran"), Person.find_by(name: "Prema Puthran")]
    obj.backup += [Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Bhagavane Bhagavane").id, :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += [Person.find_by(name: "Nayana Kamath"), Person.find_by(name: "Prema Puthran")]
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ratna Paula Stone")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Chotti Chotti").id, :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Vishnu Anil")]
    obj.backup += [Person.find_by(name: "Gauri Anil"), Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Sita Ram").id, :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Gauri Anil")]
    obj.backup += [Person.find_by(name: "Vishnu Anil"), Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "8", :shruti => "", :bhajan_id => Bhajan.find_by(name: "Kala Bhairava").id, :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.backup += [Person.find_by(name: "Nayana Kamath")]
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :bhajan_id => Bhajan.find_by(name: "De Darshan Ma").id, :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Sudarshan Varaprath")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Arun Ganesan")]
    obj.backup += [Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "10", :shruti => "", :weekend_id => Weekend.find_by(name: "8/3/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += [Person.find_by(name: "Shambavi (Susan) Witt"), Person.find_by(name: "Arun Ganesan")]
    obj.soundsystem += [Person.find_by(name: "Ramakrishna Kamath")]
    obj.lead += [Person.find_by(name: "Group")]
    obj.backup += [Person.find_by(name: "Prema Puthran"), Person.find_by(name: "Sudarshan Varaprath"), Person.find_by(name: "Ramakrishna Kamath")]
    obj.save
    obj = Rendition.create(:order => "5", :shruti => "", :weekend_id => Weekend.find_by(name: "3/30/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sita Keane")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "6", :shruti => "", :weekend_id => Weekend.find_by(name: "3/30/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Jay Puthran"), Person.find_by(name: "Prema Puthran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "1", :shruti => "", :weekend_id => Weekend.find_by(name: "3/30/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Raji Sankaran")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "2", :shruti => "", :weekend_id => Weekend.find_by(name: "3/30/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Madhavi Mai")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "4", :shruti => "", :weekend_id => Weekend.find_by(name: "3/30/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Matt Fillion")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "0", :shruti => "", :weekend_id => Weekend.find_by(name: "3/30/2019").id, :event_id => Event.find_by(name: "practice").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Chidanand Wordeman")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "7", :shruti => "", :weekend_id => Weekend.find_by(name: "3/30/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Ratna Paula Stone")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "9", :shruti => "", :weekend_id => Weekend.find_by(name: "3/30/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sumathy Nathan")]
    obj.backup += []
    obj.save
    obj = Rendition.create(:order => "3", :shruti => "", :weekend_id => Weekend.find_by(name: "3/30/2019").id, :event_id => Event.find_by(name: "satsang").id)
    obj.instrumentalists += []
    obj.soundsystem += []
    obj.lead += [Person.find_by(name: "Sudarshan Varaprath")]
    obj.backup += []
    obj.save
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "3/30/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/6/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/13/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/20/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "4/27/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/4/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/11/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/18/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_practice => "true", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "5/25/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/1/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/8/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/15/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Sita Keane").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/22/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "6/29/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Sita Keane").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/6/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Group").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Sita Keane").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/13/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/20/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "7/27/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/3/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Group").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/10/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Group").id)
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Arun Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Chad Kymal").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Chidanand Wordeman").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Gayatri Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Jay Puthran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Prema Puthran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Krishna Kumar").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Vyshnavi Krishna").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Madhavi Mai").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Matt Fillion").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Minni Kumar").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Naren Nathan").id, :attended_practice => "true", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Nayana Kamath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Ramakrishna Kamath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Nikhil Unnikrishnan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Niranjan Nair").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Paru Krishna").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Prasanth Ganesan").id, :attended_practice => "true", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Raji Sankaran").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Ratna Paula Stone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Rupashree (Antoinette) Malone").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Senthil Nathan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Shreeja Rucker").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Sumathy Nathan").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Sita Keane").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Soundary Ganesan").id, :attended_practice => "false", :attended_satsang => "true")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Sudarshan Varaprath").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Sundari Murthy").id, :attended_practice => "false", :attended_satsang => "false")
    Satsang.create(:weekend_id => Weekend.find_by(name: "8/17/2019").id, :person_id => Person.find_by(name: "Shambavi (Susan) Witt").id, :attended_practice => "false", :attended_satsang => "false")
    
    render :json => {
      'contents': Bhajan.all.order(id: :desc),
      'ragas': Raga.all,
      'deities': Deity.all,
      'languages': Language.all,
    }
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
