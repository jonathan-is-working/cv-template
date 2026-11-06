// ==============================================================================
// 📄 CV FRANÇAIS - Modifiez votre contenu ci-dessous
// Pour compiler : make fr (ou : typst compile src/cv-fr.typ output/cv-fr.pdf)
// ==============================================================================

#import "template.typ": resume

// 1. VOS INFORMATIONS PERSONNELLES
#let info = (
  author: "PRÉNOM NOM",
  title: "Titre du poste visé · Spécialité 1 · Spécialité 2",
  email: "votre.email@exemple.com",
  phone: "+33 6 00 00 00 00",
  location: "Ville, Pays (ou Télétravail)",
  linkedin: "linkedin.com/in/votre-profil",
  github: "github.com/votre-nom",
  website: "votre-portfolio.com",
  photo: "assets/avatar.svg", // Chemin vers votre photo (ex: "assets/photo.jpg"), ou 'none' pour désactiver
)

// 2. LE CONTENU DE VOTRE CV
#let body(section, entry) = [

#section("FORMATION")

#entry(
  "Nom de l'école / Université", "Mois Année - Mois Année",
  "Intitulé exact du diplôme obtenu ou en cours", "Ville, Pays",
)
Spécialisation, filière ou mention : *indiquez ici vos dominantes académiques clés*

#v(5pt)
#entry(
  "Établissement précédent / Classe préparatoire / Licence", "Mois Année - Mois Année",
  "Intitulé de la formation ou diplôme obtenu", "Ville, Pays",
)
- Distinction ou résultat marquant : *précisez votre rang, mention ou accomplissement académique*


#section("EXPÉRIENCES PROFESSIONNELLES")

#[
#set list(spacing: 9pt)

#entry(
  "Nom de l'entreprise ou organisation", "Mois Année - Aujourd'hui",
  "Intitulé du poste (CDI, CDD, Stage, Alternance)", "Ville, Pays",
)
- Débutez par un verbe d'action : décrivez votre contribution majeure avec les *outils et technologies clés*, en précisant l'impact opérationnel ou le résultat chiffré.
- Présentez un deuxième projet ou responsabilité : méthode de travail, collaboration d'équipe et *résultat mesurable obtenu* (gain de temps, réduction de coût ou latence).

#v(7pt)
#entry(
  "Entreprise ou organisation précédente", "Mois Année - Mois Année",
  "Intitulé du poste occupé", "Ville, Pays",
)
- Synthétisez vos réalisations concrètes en mettant en gras les *compétences techniques majeures* mobilisées au quotidien.
- Décrivez une problématique résolue, une automatisation ou une amélioration apportée avec son *impact qualitatif ou quantifié*.
]


#section("PROJETS")

*Nom du Projet 1 (ou lien vers dépôt GitHub / démo en ligne)*
- Présentez le contexte et l'objectif du projet : architecture technique, *langages et frameworks utilisés* pour concevoir la solution.
- Détaillez la valeur ajoutée : fonctionnalités clés développées, *métriques de performance*, couverture de tests ou retour d'expérience utilisateur.

#v(5pt)
*Nom du Projet 2 (Projet personnel, académique ou open-source)*
- Décrivez le problème adressé : conception d'architecture, intégration d'API, *outils modernes mis en œuvre* et défis techniques surmontés.
- Expliquez le mode de livraison : intégration continue, conteneurisation, *déploiement en production* ou documentation technique soignée.


#section("COMPÉTENCES, CERTIFICATIONS & CENTRES D’INTÉRÊT")

- *Langages de programmation & Frameworks :* Citez vos langages et bibliothèques maîtrisés, triés par ordre de pertinence pour le poste.
- *Architecture & Systèmes :* Vos compétences backend, API design, systèmes distribués, patrons de conception et tests automatisés.
- *Cloud, Data & DevOps :* Outils d'infrastructure, conteneurs, pipelines CI/CD, bases de données et plateformes cloud pratiquées.
- *Langues :* Langue maternelle, autres langues pratiquées avec niveau CECRL ou score officiel (ex: Anglais C1, TOEIC...).
- *Certifications :* Vos certifications officielles obtenues avec l'organisme émetteur (ou cours certifiants validés).
- *Centres d’intérêt :* 2 à 3 activités extra-professionnelles mettant en valeur vos passions, curiosité ou esprit d'équipe.

]

// 3. RENDU DU DOCUMENT
#resume(body, info: info, lang: "fr")
