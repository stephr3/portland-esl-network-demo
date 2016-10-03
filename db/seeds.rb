# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
link_list = [
  [
    "Multnomah County Library Web Resources",
    "https://multcolib.org/learn-english",
    "Multnomah Public Library's links to multiple websites.",
    "learning"
  ],
  [
    "BBC Dance Mat Typing",
    "http://www.bbc.co.uk/guides/z3c6tfr#zgkpn39",
    "Fun, free, interactive typing tutor program.",
    "learning"
  ],
  [
    "Pumarosa",
    "http://www.pumarosa.com/",
    "Fast, fun and free to learn English. It's specially designed to help Spanish-speaking students with difficulties learning, but anyone can use it!",
    "learning"
  ],
  [
    "Portland Literacy",
    "http://www.portlandliteracy.org/",
    "Free resource for beginning Literacy lessons. There are four levels of packets for tutors and for students.",
    "teaching"
  ],
  [
    "C-Span Classroom Deliberations",
    "http://www.c-spanclassroomdeliberations.org/",
    "Designed to engage students in classroom deliberations about current issues being debated in congress.  Lesson plans for teachers.",
    "teaching"
  ],
  [
    "Dave's ESL Cafe",
    "http://www.daveseslcafe.com/",
    "The internet meeting place for ESL and EFL teachers and students from around the world.",
    "teaching"
  ],
  [
    "Refugees from the Democratic Republic of the Congo",
    "http://www.culturalorientation.net/content/download/2701/15651/version/2/file/CAL+Backgrounder+07+-+Congolese+FINAL.pdf",
    "Information about the refugee crisis, life in the DRC and countries of asylum, background characteristics of the refugees, and their resettlement experiences in the U.S., strengths they bring and the challenges they may face.",
    "refugees"
  ],
  [
    "Refugees from Syria",
    "http://www.culturalorientation.net/content/download/3970/21954/version/2/file/CAL+Backgrounder+08+-+Syrians+FINAL.pdf",
    "Information about refugees from Syria, addressing Syria’s modern history, government, economy, and other systems, the different Syrian populations, common beliefs and customs, conditions in first-asylum countries, and implications for resettlement.",
    "refugees"
  ],
  [
    "Darfuri Refugees",
    "http://www.culturalorientation.net/library/publications/refugees-from-darfur-refugee-backgrounder",
    "Information about refugees from the Darfur region of Sudan, particularly those being resettled from Chad, as well as those in Kakuma Refugee Camp in Kenya.",
    "refugees"
  ]
]

link_list.each do |title, url, description, tag|
 Link.create(title: title, url: url, description: description, tag: tag)
end

volunteer_site_list = [
  [
    "Birch Community Services",
    "http://www.birchcommunityservices.org/participate/volunteer/individual-volunteers/",
    "17780 NE San Rafael Street Portland, Oregon 97230",
    "All",
    "Andrew Rowlett: 971.506.5673,  Andrew@BirchCommunityServices.org",
    "Opportunities: Food Sorting, Preparing for classes.  Birch can use individual volunteers on M/W/F from 9 am to 5 pm without prior scheduling.  Please plan to volunteer for at least two hours at a time so that we can make the most out of your travel and time commitments. Scheduling is required at all other times by contacting the office at 503.251.5431."
  ],
  [
    "Unite Oregon",
    "http://www.uniteoregon.org/",
    "12625 SW Broadway, Suite 200   Beaverton, OR 97005  ",
    "All",
    "Beaverton Office:  503-913-6969",
    "Opportunities:  Because UN exists specifically to improve the lives of immigrants and refugees, the volunteer options are limitless. They are a successful organization with a great reputation. "
  ],
  [
    "Consonare Chorale",
    "http://www.consonarechorale.org/",
    "P.O. Box 10739  Portland, Oregon 97296 ",
    "All",
    "music@consonarechorale.org  ",
    "Consonare Chorale is a vibrant community of accomplished musicians dedicated to diverse engaging performances. We entertain, educate and connect with audiences in a refreshingly approachable and intimate experience.Consonare is always in search of volunteers to help with a variety of tasks such as occasional help with organizing and alphabetizing music library or help with a concert."
  ]
]

volunteer_site_list.each do |name, url, address, level, contact, description|
  VolunteerSite.create(name: name, url: url, address: address, level: level, contact: contact, description: description)
end

post_list = [
  [
    "Free English Classes at Bridger Elementary",
    "This fall Rachel Kimbrow is teaching a free series of English Classes for parents (and the public) at Bridger Elementary, using materials provided by Intercambio Uniting Communities. BEGINS: Oct. 5 5:30-7 WHERE: 7910 SE Market Street, Portland QUESTIONS? Contact coordinator Melany Desrochers at 503-502-1485"
  ],
  [
    "Open Forum: Refugees in Portland",
    "Oregon folks, you are welcome to join Lutheran Community Services Northwest in a facilitated open dialogue on refugee resettlement here in Portland. This forum is free to attend and we look forward to addressing the challenges, opportunities and problems that our community is experiencing in welcoming refugees."
  ]
]

post_list.each do |title, content|
  Post.create(title: title, content: content)
end
