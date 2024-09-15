#import "./definitions/cv-page-frame.typ": cvPageFrame
#import "./definitions/cv-page-styles.typ": cvStyle
#import "./definitions/cv-page-items.typ": cvItem
#import "./my-config.typ": *

#show: cvStyle.page.with(cvPageFrame.footer)
#show: cvStyle.textStyles.with()

//           Custom Header - Example 3
/* = #userInfo.fullName
#box(inset: (top: contacts-padding))[#for c in cvPageFrame.contacts {
    [#c]
    [#" "]
  }
] */

#show: cvPageFrame.modernHeader
//#show: cvPageFrame.photoHeader
#show: cvStyle.modernHeading.with()
#show: cvStyle.modernBlock.with()

= Summary
#show: cvItem.textBlock.with((
  [#lorem(15)],
  [In general I have 10 years' experience in software development.],
  [#lorem(30)]// <=== comma is not important, multiple elements
))

= Note
#show: cvItem.textBlock.with((
  [
    #text[If one element inside 'textBlock' -
      then trailing comma after is important -
      otherwise typst will not recognize array, compilation will fail.
      #linebreak()
      () or ([]) - typst dictionary
      #linebreak()
      ([],) - typst array
    ]
  ], // <=== comma is important
))


= Education
#show: cvItem.keyValueBlock.with((
  size: size50x50,
  align-to: right,
  data: (
    [=== Computer Sciences],
    [MIT<bold-desat>],
    [Bachelor<bold-desat>],
    [],
    [Institute of Technology],
    [2000 – 2005],
  ),
))

= Professional Skills
#show: cvItem.keyValueBlock.with((
  size: size30x70,
  data: (
    [=== Programming Languages],
    [Java 17, JavaScript],
    [=== Backend],
    [Spring, SpringBoot, NodeJS, JavaEE, Postgres, Mongo],
    [=== Frontend],
    [React, Angular],
    [=== Microservices],
    [Docker, k8s, istio, AMQP, ELK, API Gateway, Service Tracing/Monitoring],
    [=== CI/Build],
    [Git, Maven, Gradle, Yarn, Jenkins],
    [=== OS],
    [Linux, Fedora, CentOS, Debian],
  ),
))
#show: cvItem.keyValueBlock.with((
  size: size30x70,
  data: (
    [=== Spoken Languages],
    [],
    [==== English<desat>],
    [Native],
    [==== German<desat>],
    [Advanced],
  ),
))

= Experience

#show: cvItem.experienceBlock.with((
  position: [Team Lead],
  name: [Neobank | Startup],
  company: [Company | Remote],
  dates: [2024 - 2021],
  description: (
    [#lorem(70)],
    [Detailed achievements<bold-desat>
      - established development practices, CICD
      - transformed client high-level vision into platform components
      - leading cross-functional (~20 people) teams
      - development and devops teams mentoring
      - code reviews, knowledge sessions
    ],
    [Technology Stack<accent>: Java, Spring Boot, Rabbit, NodeJS, Angular, k8s, istio, docker, AWS, Aurora],
  ),
))

#linebreak() #linebreak()
linebreak and pagebreak here for
better<bold>
visual<bold-desat>
experience<accent>
ever<desat>
#pagebreak()

#show: cvItem.experienceBlock.with((
  position: [Senior Java Developer],
  name: [Neobank | Startup],
  company: [Company | Remote],
  dates: [2021 - 2018],
  description: (
    [#lorem(20)],
    [Detailed achievements<bold-desat>
      - New microservices development
      - Architecture support
    ],
    [Technology Stack<accent>: Java, Spring Boot],
  ),
))

#show: cvItem.experienceBlock.with((
  position: [Developer],
  name: [Neobank | Startup],
  company: [Company | Remote],
  dates: [2018 - 2010],
  description: (
    [#lorem(50)],
    [Detailed achievements<bold-desat>
      - New microservices development
      - Architecture support
    ],
    [Technology Stack<accent>: Java, Spring Boot],
  ),
))
