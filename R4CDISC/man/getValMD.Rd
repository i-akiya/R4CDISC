\name{getValMD}
\alias{getValMD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Exract value level metadata from Define-XML
}
\description{
The getValMD function supports define.xml version 2.0.
}
\usage{
getValMD(filepath)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filepath}{ 
  Character string specifying the file path of define.xml. 
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
This function returns a data.frame.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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
ValMD <- getValMD(define)
}



% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line