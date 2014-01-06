\name{read.untyped.sds}
\alias{read.untyped.sds}
\title{
Read an untyped SDS-XML file as a data frame
}
\description{
This function returns study data as R dataframe converted from SDS-XML.
}
\usage{
read.untyped.sds(sds_file, define_file)
}
\arguments{
  \item{sds_file}{
    Character string specifying the file path of sds.xml.
}
  \item{define_file}{
    Character string specifying the file path of define.xml.
}
}
\details{
This function supports untyped SDS-XML only.
Variable types in returned dataframe are converted based following rule. \cr
\tabular{lll}{
ODM data type \tab  \tab R data type \cr
string \tab  \tab character \cr
integer \tab  \tab integer \cr
float \tab  \tab double\cr
date \tab  \tab character\cr
time \tab  \tab character\cr
datetime \tab  \tab character\cr
}
}

\value{
This function returns a dataframe.
}
\author{
Ippei Akiya
}
\examples{
define <- system.file("extdata", 
                      "define2-0-0-example-sdtm(2013-11-09).xml", 
                       package="R4CDISC"
                       ) 
sds <- system.file("extdata", 
                   "dm.xml", 
                    package="R4CDISC"
                    )

DM <- read.untyped.sds(sds_file=sds, define_file=define)
}
