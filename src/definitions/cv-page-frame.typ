#import "../my-config.typ": *
#import "./cv-page-styles.typ": cvStyle

#let separator_fn(name: "", size: 7pt) = [#box(width: size) #name]
#let separator = separator_fn()
#let separator_sm = separator_fn(size: 0.5pt)

#let _contactsBuilder = parent => {
  let items = ()
  let contacts = userInfo.contacts.pairs()
  let urls = userInfo.urls
  if (parent == "footer") {
    contacts = contacts.filter(c => {
      userInfo.footer.contains(c.at(0))
    })
  }
  for contact in contacts {
    let key = contact.at(0)
    if (key.starts-with("#")) {
      continue
    }
    let value = contact.at(1)
    let display = value
    if (key in urls) {
      let prefix = urls.at(key, default: "")
      if (key == "homepage") {
        value = ""
      }
      items.push([#icons.at(key)#link(prefix + value)[#separator_sm#text(display)]])
    }
    if (key not in urls) {
      items.push([#icons.at(key)#separator_sm#text(value)])
    }
  }

  return items
}

#let _footer = {
  let contacts = _contactsBuilder("footer")
  set text(size: footer-font-size)

  block(inset: (top: 1pt))[
    #box(width: 2fr)[
      #align(left)[
        #smallcaps[#userInfo.firstname#sym.space#userInfo.lastname]
        <bold-desat>]
    ]
    #box(width: 8fr)[
      #align(center)[
        #for c in contacts {
          [#separator_sm#c#separator_sm]
        }
        <bold-desat>]
    ]
    #box(width: 1fr)[
      #align(right)[
        #counter(page).display("1 / 1", both: true)
        <bold-desat>]
    ]
  ]
}

#let _modernHeader(body) = {
  let contacts = _contactsBuilder("header")
  align(center)[
    #box[
      #set text(size: full-name-font-size)
      #userInfo.firstname<accent>
      #userInfo.lastname<bold>
    ]
  ]
  align(center)[
    #set text(size: contacts-font-size)
    #userInfo.roles.join([#" "#sym.dot.c#" "])<bold-desat>
  ]
  align(center)[
    #set text(size: contacts-font-size)
    #box(inset: (top: contacts-padding))[#for c in contacts {
        [#separator_sm#c#separator_sm]
      }
    ]
    <desat>]
  body
}

#let _photoHeader(body) = {
  let aligns = left
  let contacts = _contactsBuilder("header")
  grid(
    columns: (1fr, 3fr),
    rows: (auto),
    gutter: (8pt),
    align: aligns,
    grid.cell(rowspan: 4, image("../resources/user.jpg")),
    box[
      #set text(size: full-name-font-size)
      #userInfo.firstname<accent>
      #userInfo.lastname<bold>
    ],
    box(inset: (top: roles-padding))[
      #set text(size: contacts-font-size)
      #smallcaps[
        #userInfo.roles.join(text[#"  "#sym.dot.c#"  "])<bold-desat>
      ]],
    grid(
      columns: (1fr, 1fr),
      align: aligns,
      rows: (auto),
      gutter: (5pt),
      ..contacts.enumerate().map(((i, item)) => {
        return grid.cell([
          #set text(size: contacts-font-size)
          #item
          <desat>])
      })
    )
  )
  body
}

#let cvPageFrame = (
  contacts: _contactsBuilder("header"),
  modernHeader: _modernHeader,
  photoHeader: _photoHeader,
  footer: _footer,
)