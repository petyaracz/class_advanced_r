## Haladó R óra

### Sillabusz

1. lineáris regresszió
	- elmélet
		- jel és zaj, inferencia és jóslás
		- ki négyzet próba, t próba, anova, akármi: helyett hierarchikus általánosított lineáris modellek
		- mi lesz: lineáris modell, többértékű ~, általánosított ~, hierarchikus ~, modellválasztás, modellkritika, jóslás, ábrázolás, munkafolyamatok
		- mi nem lesz: matek, p értékek, más módszerek, alap programozás
		- együtthatók
		- maradékok
		- metszéspont és meredekség
		- faktorok
	- gyakorlat:
		- `read_delim`
		- `ggplot`
		- `geom_smooth(method = 'lm')`
		- `lm()`
	- házi
		- Datacamp::Introduction_to_Regression::Chapter_1
2. jóslás
	- elmélet:
		- predikció és extrapoláció
	- gyakorlat
		- `summary()`
		- `glance()`
		- `predict()`
	- házi
		- Datacamp::Introduction_to_Regression::Chapter_2
3. diagnosztika
	- elmélet:
		- r^2 és RSE
		- AIC és BIC
		- linearitás, homoszkedaszticitás, invariancia, a hibák függetlensége
		- Ascombe's quartet
	- gyakorlat:
		- `performance::model_performance()`
	- házi:
		- Datacamp::Introduction_to_Regression::Chapter_3
4. logisztikus regresszió
	- elmélet:
		- általánosított lineáris modellek
		- véletlen komponens, kapcsolati függvény
		- p, oddszok, log oddsz
	- gyakorlat:
		- `glm()`
		- `qlogis(), plogis(), exp()`
	- házi:
		- Datacamp::Introduction_to_Regression::Chapter_4
5. többszörös lineáris regresszió: numer + faktor
	- elmélet:
 		- alul- és túlillesztés
   		- szabadságfok 	
		- több metszéspont
	- gyakorlat:
		- `1 + a`, `0 + a`
		- `performance::compare_performance()`
		- `anova()`
	- házi:
		- Datacamp::Intermediate_Regression::Chapter_1
6. többszörös lineáris regresszió: numer * faktor
	- elmélet:
		- több meredekség
		- Simpson paradoxona
		- interakciók
	- gyakorlat:
		- `a*b`, `a:b`
	- házi:
		- Datacamp::Intermediate_Regression::Chapter_2
7. többszörös lineáris regresszió: numer * numer
	- elmélet:
		- többfokú meredekség
	- gyakorlat:
	- `geom_density`, `facet_wrap`
	- házi:
		- Datacamp::Intermediate_Regression::Chapter_3
8. többszörös logisztikus regresszió
	- elmélet:
		- interakciók, kumulatív oddszok
	- gyakorlat:
		- `sec.axis`
	- házi:
		- Datacamp::Intermediate_Regression::Chapter_4
9. hierarchikus általánosított lineáris modellek: random metszéspontok
	- elmélet:
	- gyakorlat:
	- résztvevőszintű adatok és megfigyelésszintű adatok
	+ lme4()
	+ broom.mixed
	+ residual r^2, conditional r^2
	- házi:
		- Datacamp::Hierarchical_Regression::Chapter_1
10. hierarchikus általánosított lineáris modellek: random meredekségek
	- elmélet:
		- random meredekségek
	- gyakorlat:
		- `(1|a)`, `(1 + b|a)`
	- házi:
		- Datacamp::Hierarchical_Regression::Chapter_2
11. hierarchikus általánosított lineáris modellek: ismételt mérések
	- elmélet:
		- anova, manova, paired t teszt
	- gyakorlat:
		- `(1|item)`, `(1|participant)`
	- házi:
		- Datacamp::Hierarchical_Regression::Chapter_4

### Hasznos linkek

[itt.](https://peterracz.wordpress.com/teaching/intro-r-bevezetes-az-r-programozasba/)

### Acknowledgement

This class is supported by DataCamp, the most intuitive learning platform for data science and analytics. Learn any time, anywhere and become an expert in R, Python, SQL, and more. DataCamp’s learn-by-doing methodology combines short expert videos and hands-on-the-keyboard exercises to help learners retain knowledge. DataCamp offers 350+ courses by expert instructors on topics such as importing data, data visualization, and machine learning. They’re constantly expanding their curriculum to keep up with the latest technology trends and to provide the best learning experience for all skill levels. Join over 6 million learners around the world and close your skills gap.
