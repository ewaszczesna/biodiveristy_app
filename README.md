# Biodiveristy application


## Basic info
Simple dashboard to visualize species observations on map: https://ewa-szczesna-analytics.shinyapps.io/biodiveristy_app/

Based on biodiversity data from the [Global Biodiversity Information Facility](https://www.gbif.org/occurrence/search?dataset_key=8a863029-f435-446a-821e-275f4f641165). Observations are limited to Poland only.


## How to run tests
In the "tests" folder you can find:

* testhat folder: with unit tests written with testthat package

* testthat.R: that lets you to run all the unit test directly from one script.


## Known issues or potential improvements

What is missing or could be done better:

* Documentation for custom functions is currently missing and could be added.

* There is more unique scientific names than unique vernacular names, which means that probably some of the vernacular names are corresponding to more than 1 scientific names. It may cause some problems in filtering logic. Currently this aspect is not covered/secured. 

* When user is using filtering and is selecting many new options very fast, filters (Vernacular and Scientific name) fall into the loop of constatly updating each other.

* Two funtions to replace empty values could be written better. Definietly should be refactored and simplified.

* More tests should be written. Especially unit test that cover all functionalities.

* Optimization of loading times.

* automated deployment in GitHub CI/CD

* UI & style improvements
