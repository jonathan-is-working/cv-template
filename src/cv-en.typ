// ==============================================================================
// 📄 ENGLISH RESUME - Edit your content below
// To compile: make en (or: typst compile src/cv-en.typ output/cv-en.pdf)
// ==============================================================================

#import "template.typ": resume

// 1. YOUR PERSONAL INFORMATION
#let info = (
  author: "FIRSTNAME LASTNAME",
  title: "Target Job Title · Area of Expertise 1 · Area of Expertise 2",
  email: "your.email@example.com",
  phone: "+1 (555) 000-0000",
  location: "City, Country (or Remote)",
  linkedin: "linkedin.com/in/your-profile",
  github: "github.com/your-username",
  website: "your-portfolio.com",
  photo: "assets/avatar.svg", // Set path to your photo (e.g. "assets/photo.jpg"), or 'none' to disable
)

// 2. YOUR RESUME CONTENT
#let body(section, entry) = [

#section("EDUCATION")

#entry(
  "University / Institution Name", "Month Year - Month Year",
  "Exact Degree Title / Major Program", "City, Country",
)
Specialization, focus area, or honors: *highlight your key academic strengths or major coursework*

#v(5pt)
#entry(
  "Previous Institution / Undergraduate College", "Month Year - Month Year",
  "Degree Title / Track Completed", "City, Country",
)
- Academic distinction or milestone: *mention class ranking, honors, or key academic distinction*


#section("PROFESSIONAL EXPERIENCE")

#[
#set list(spacing: 9pt)

#entry(
  "Company or Organization Name", "Month Year - Present",
  "Job Title (Full-Time, Internship, Apprenticeship)", "City, Country",
)
- Start with a strong action verb: describe your primary contribution highlighting *core tools and technologies*, stating measurable outcomes or business impact.
- Present a secondary initiative: teamwork, methodologies used, and *quantifiable results achieved* (latency decrease, time savings, or cost reduction).

#v(7pt)
#entry(
  "Previous Company or Organization", "Month Year - Month Year",
  "Job Title Held", "City, Country",
)
- Summarize day-to-day technical ownership, emphasizing *major engineering competencies* in bold.
- Detail a challenge solved, workflow automation, or system upgrade with its *positive measurable impact*.
]


#section("PROJECTS")

*Project 1 Name (or link to GitHub repository / live demo)*
- Introduce the project purpose and architectural design: *programming languages, libraries, and frameworks* chosen to implement the solution.
- Highlight technical value: key features delivered, *performance benchmarks*, test coverage, or user adoption metrics.

#v(5pt)
*Project 2 Name (Personal, academic, or open-source initiative)*
- Outline the problem addressed: system modeling, API integrations, *modern tooling utilized*, and complex technical obstacles resolved.
- Detail the deployment lifecycle: continuous integration, containerization, *production release*, or technical documentation.


#section("SKILLS, CERTIFICATIONS & INTERESTS")

- *Programming Languages & Frameworks:* List languages and frameworks ordered by proficiency and relevance to the position.
- *Architecture & Systems:* Backend design, API contracts, distributed systems, design patterns, and automated test frameworks.
- *Cloud, Data & DevOps:* Infrastructure tools, container platforms, CI/CD pipelines, database engines, and cloud providers.
- *Languages:* Native language, foreign languages with CEFR proficiency levels or official exam scores (e.g. English C1, TOEIC).
- *Certifications:* Industry-recognized credentials earned, including issuing bodies and completion dates.
- *Interests:* 2 to 3 personal pursuits or community engagements reflecting curiosity, grit, or leadership skills.

]

// 3. DOCUMENT RENDER
#resume(body, info: info, lang: "en")
