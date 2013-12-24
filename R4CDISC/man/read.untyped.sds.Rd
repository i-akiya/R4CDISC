\name{read.untyped.sds}
\alias{read.untyped.sds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Read an untyped SDS-XML file as a data frame
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read.untyped.sds(sds_file, define_file)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sds_file}{
%%     ~~Describe \code{filename} here~~
}
  \item{define_file}{
%%     ~~Describe \code{filename} here~~
}

}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
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
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as

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