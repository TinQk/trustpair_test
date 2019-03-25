Original test :
https://github.com/trustpair/jobs

## Heroku prod : https://trustpair-tinqk.herokuapp.com/

# Trustpair Ruby on Rails challenge

The goal of this challenge is to evaluate the candidates for the position of Software Developer at [Trustpair](https://www.trustpair.fr/jobs).

## Exercise

The City of Paris in France has a data file containing the non-titular permanents staff balance.

They have some CSV files composed with the following headers for each row :

```
Année : year of the collected data
Collectivité : [COMMUNE, DEPARTEMENT] to which collectivity they belongs (municipal or departemental)
Type de Contrat : [TEMPS INCOMPLET, TEMPS COMPLET] type of contract (full or part time)
Emplois: Job
Niveau: Employee level which differs according to their job
Spécialité : domain of activity (library, music, IT, ...)
```




- [bilan-social-effectifs-non-titulaires-permanents_1.csv](https://github.com/trustpair/jobs/tree/master/ruby/bilan-social-effectifs-non-titulaires-permanents_1.csv)
- [bilan-social-effectifs-non-titulaires-permanents_2.csv](https://github.com/trustpair/jobs/tree/master/ruby/bilan-social-effectifs-non-titulaires-permanents_2.csv)
- [bilan-social-effectifs-non-titulaires-permanents_3.csv](https://github.com/trustpair/jobs/tree/master/ruby/bilan-social-effectifs-non-titulaires-permanents_3.csv)

City of Paris needs to perform some analysis on that data according to their gender parity commitment in terms of both types of contract [Type de Contrat] and jobs [Emplois] per year [ANNEE].

They have an issue with their CSV files which lack of data related to the number of men and women for each job.

City of Paris has a public accessible API which can give you those missing data per level [Niveau] for each job [Emplois].

```
URL: https://opendata.paris.fr/api/records/1.0/search/?dataset=bilan-social-effectifs-non-titulaires-permanents&facet=annee&facet=collectivite&facet=type_de_contrat&facet=emplois&facet=niveau&refine.emplois={EMPLOIS_NAME}
```

Usage example: https://opendata.paris.fr/api/records/1.0/search/?dataset=bilan-social-effectifs-non-titulaires-permanents&facet=annee&facet=collectivite&facet=type_de_contrat&facet=emplois&facet=niveau&refine.emplois=TECHNICIENS%20SUPERIEURS%20D%27ADMINISTRATIONS%20PARISIENNES

from api :
nombre_d_hommes	15
emplois	"EBOUEURS"
niveau	"EBOUEUR"
type_de_contrat	"TEMPS COMPLET"
collectivite	"COMMUNE"
annee	"2013"
nombre_de_femmes	0

gem httparty

## Requirements

They ask you to create a small web application based on the Ruby On Rails framework with the following requirements:

- A user can Import a csv_file into a relation SQL Database following the csv file headers through an interface;
  - identical rows cannot be persisted in the database (the newest is the most relevant)
- Number of Men and Women per job must be retrieved with their public API
- For each imported job calcul the parity score:
  - valid if the parity is the gap between the number of men and women per job is less than 15%
  - invalid otherwise
- Render in a web interface the list all the jobs ordered by name [EMPLOIS] and by year [ANNEE] with their result of parity
