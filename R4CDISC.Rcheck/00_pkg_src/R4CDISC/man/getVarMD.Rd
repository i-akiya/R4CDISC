\name{getVarMD}
\alias{getVarMD}
\title{
Exract variable level metadata from Define-XML
}
\description{
The getVarMD function supports Define-XML version 2.0.
}
\usage{
getVarMD(filepath)
}
\arguments{
  \item{filepath}{ 
  Character string specifying the file path of Define-XML. 
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
VarMD <- getVarMD(define)
}
