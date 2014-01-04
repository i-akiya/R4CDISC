\name{read.untyped.sds}
\alias{read.untyped.sds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Read an untyped SDS-XML file as a data frame
}
\description{
This function returns study data as R dataframe converted from SDS-XML.
}
\usage{
read.untyped.sds(sds_file, define_file)
}
%- maybe also 'usage' for other objects documented here.
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
\references{
%% ~put references to the literature/web site here ~
}
\author{
Ippei Akiya
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
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


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line