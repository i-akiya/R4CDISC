\name{getValMD}
\alias{getValMD}
\title{
Exract value level metadata from Define-XML
}
\description{
The getValMD function supports define.xml version 2.0.
}
\usage{
getValMD(filepath)
}
\arguments{
  \item{filepath}{ 
  Character string specifying the file path of define.xml. 
  }
}
\author{
Ippei Akiya
}
\examples{
define <- system.file("extdata", 
                      "define2-0-0-example-sdtm(2013-11-09).xml", 
                       package="R4CDISC"
                       ) 
ValMD <- getValMD(define)
}
