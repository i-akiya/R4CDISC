# R4CDISC

R4CDISC is R package for import CDISC Dataset-XML and Define-XML as R data frame.

## Features
* Support CDISC Dataset-XML 1.0 and Define-XML 2.0.
* Covert from Dataset-XML to R dataframe.
* Extract following metadata from Define-XML as R dataframe.
  * Dataset level metadata
  * Variable level metadata
  * Value level metadata
  * Controlled terms

## Installation
Run command, "install.package(R4CDISC)", in R console.

## Dependencies
* [R](http://http://cran.r-project.org//) (>= 3.0.2)
* [R package XML](http://cran.r-project.org/web/packages/XML/index.html) (>= 3.98-1.1)


## Example code
### Import Define-XML
    library(R4CDISC)
    define <- system.file("extdata", 
                      "define2-0-0-example-sdtm(2013-11-09).xml", 
                       package="R4CDISC") 
    sds <- system.file("extdata", 
                   "dm.xml", 
                    package="R4CDISC")
    DM <- read.dataset.xml(dataset_xml=sds, define_xml=define)

### Obtain dataset level metadata
    library(R4CDISC)
    define <- system.file("extdata", 
                      "define2-0-0-example-sdtm(2013-11-09).xml", 
                       package="R4CDISC"
                       ) 
    DLMD <- getDLMD(define)

### Obtain variable level metadata
    library(R4CDISC)
    define <- system.file("extdata", 
                      "define2-0-0-example-sdtm(2013-11-09).xml", 
                       package="R4CDISC"
                       ) 
    VarMD <- getVarMD(define)

### Obtain value level metadata
    library(R4CDISC)
    define <- system.file("extdata", 
                      "define2-0-0-example-sdtm(2013-11-09).xml", 
                       package="R4CDISC"
                       ) 
    ValMD <- getValMD(define)

### Obtain controlled terms
    library(R4CDISC)
    define <- system.file("extdata", 
                      "define2-0-0-example-sdtm(2013-11-09).xml", 
                       package="R4CDISC"
                       ) 
    ControlledTerms <- getCT(define)

## License
[The GNU Lesser General Public License, version 3.0 (LGPL-3.0)](http://opensource.org/licenses/lgpl-3.0.html)

## Author
 [Ippei Akiya](http://github.com/i-akiya) 

## References
* [Dataset-XML](http://www.cdisc.org/dataset-xml)
* [Define-XML](http://www.cdisc.org/define-xml)
