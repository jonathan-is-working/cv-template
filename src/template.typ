// template.typ - Minimalist, ATS-friendly CV Template in Typst
// Compatible with Typst 0.11+

#let resume(
  body,
  info: (:),
  lang: "fr",
  author: none,
  title: none,
  email: none,
  phone: none,
  location: none,
  linkedin: none,
  github: none,
  website: none,
  photo: none,
  photo-size: 2.3cm,
  photo-radius: 50%,
) = [
  // Resolve info dictionary or fallback to parameters / defaults
  #let get-val(key, fallback) = {
    if key in info and info.at(key) != none {
      info.at(key)
    } else {
      fallback
    }
  }

  #let author = if author != none { author } else { get-val("author", "PRÉNOM NOM") }
  #let title = if title != none { title } else { get-val("title", "") }
  #let email = if email != none { email } else { get-val("email", none) }
  #let phone = if phone != none { phone } else { get-val("phone", none) }
  #let location = if location != none { location } else { get-val("location", none) }
  #let linkedin = if linkedin != none { linkedin } else { get-val("linkedin", none) }
  #let github = if github != none { github } else { get-val("github", none) }
  #let website = if website != none { website } else { get-val("website", none) }
  #let photo = if photo != none { photo } else { get-val("photo", none) }
  #let photo-size = if "photo-size" in info { info.at("photo-size") } else { photo-size }
  #let photo-radius = if "photo-radius" in info { info.at("photo-radius") } else { photo-radius }

  #set document(title: "CV - " + author, author: author)
  #set page(paper: "a4", margin: (x: 16mm, y: 13mm))
  #set text(font: "New Computer Modern", size: 10.5pt, lang: lang)
  #set par(leading: 0.42em, spacing: 0.4em, justify: true)
  #set list(indent: 0pt, body-indent: 11pt, tight: false, spacing: 8pt)

  #let section(section-title) = {
    v(8pt)
    text(size: 11pt, weight: "bold", section-title)
    v(3pt)
    line(length: 100%, stroke: 0.5pt)
    v(5pt)
  }

  #let entry(name, dates, role, loc) = {
    [#text(weight: "bold", name) #h(1fr) #text(size: 9.5pt, dates)]
    v(2pt)
    [#text(style: "italic", role) #h(1fr) #text(size: 9.5pt, loc)]
    v(4pt)
  }

  // Format contact items
  #let contacts = ()
  #if email != none and email != "" {
    contacts.push(link("mailto:" + email, email))
  }
  #if phone != none and phone != "" {
    let clean-phone = phone.replace(" ", "").replace("(", "").replace(")", "").replace("-", "")
    contacts.push(link("tel:" + clean-phone, phone))
  }
  #if location != none and location != "" {
    contacts.push(location)
  }
  #if linkedin != none and linkedin != "" {
    let url = if linkedin.starts-with("http://") or linkedin.starts-with("https://") { linkedin } else { "https://" + linkedin }
    let display = linkedin.replace("https://", "").replace("http://", "")
    contacts.push(link(url, display))
  }
  #if github != none and github != "" {
    let url = if github.starts-with("http://") or github.starts-with("https://") { github } else { "https://" + github }
    let display = github.replace("https://", "").replace("http://", "")
    contacts.push(link(url, display))
  }
  #if website != none and website != "" {
    let url = if website.starts-with("http://") or website.starts-with("https://") { website } else { "https://" + website }
    let display = website.replace("https://", "").replace("http://", "")
    contacts.push(link(url, display))
  }

  #let l1 = contacts.slice(0, calc.min(3, contacts.len()))
  #let l2 = if contacts.len() > 3 { contacts.slice(3) } else { () }
  #let sep = [ #text(fill: luma(120))[|] ]
  #let contact-block = [
    #text(size: 9.5pt)[
      #l1.join(sep)
      #if l2.len() > 0 [ \ #l2.join(sep) ]
    ]
  ]

  // Header: top-left photo if provided, centered otherwise
  #if photo != none [
    #let photo-content = if type(photo) == str {
      image(photo, width: 100%, height: 100%, fit: "cover")
    } else {
      photo
    }
    #grid(
      columns: (photo-size, 1fr),
      gutter: 14pt,
      align: (center + horizon, left + horizon),
      block(
        width: photo-size,
        height: photo-size,
        radius: photo-radius,
        clip: true,
        stroke: 0.5pt + rgb("#cbd5e1"),
        photo-content
      ),
      [
        #text(size: 22pt, weight: "bold")[#author]
        #if title != "" [
          #v(2pt)
          #text(size: 11pt, weight: "medium", fill: rgb("#334155"))[#title]
        ]
        #v(4pt)
        #contact-block
      ]
    )
  ] else [
    #align(center)[
      #text(size: 23pt, weight: "bold")[#author]
      #if title != "" [
        #v(2pt)
        #text(size: 11pt)[#title]
      ]
      #v(4pt)
      #contact-block
    ]
  ]

  #body(section, entry)
]
