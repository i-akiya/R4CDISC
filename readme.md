# R4CDISC

R4CDISC is R package for import CDISC Dataset-XML and Define-XML as R data frame.

## Features
* Support CDISC Dataset-XML 1.0 and Define-XML 2.0.
* Covert from Dataset-XML to R dataframe.
* Extract following metadata from Define-XML as R dataframe.
  * Dataset level metadata
  * Variable level metadata
  * Value level metadata
  * Controlled Terms

## Installation
* From CRAN  
Run command, "install.package(R4CDISC)", in R console.
* From Github  
Run following command in R console.  
library(devtools)  
install_github("i-akiya/R4CDISC", ref="v0.3-release", subdir="R4CDISC")

## Dependencies
* [R](http://cran.r-project.org/) (>= 3.0.2)
* [R package XML](http://cran.r-project.org/web/packages/XML/index.html) (>= 3.98-1.1)

## License
[The GNU Lesser General Public License, version 3.0 (LGPL-3.0)](http://opensource.org/licenses/lgpl-3.0.html)

## Author
 [Ippei Akiya](http://github.com/i-akiya) 

## References
* [Dataset-XML](http://www.cdisc.org/dataset-xml)
* [Define-XML](http://www.cdisc.org/define-xml)
