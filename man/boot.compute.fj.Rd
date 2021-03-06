\name{boot.compute.fj}
\alias{boot.compute.fj}
\encoding{UTF-8}
\title{
Compute bootstrap resampled \code{fj} as supplemental elements.
}
\description{
This function computes a bootstrap resampled set of data and projects \code{fj} as supplemental elements.
}
\usage{
boot.compute.fj(DATA, res, DESIGN = NULL, constrained = FALSE)
}
\arguments{
  \item{DATA}{
The original data matrix to be bootstrapped. Rows will be bootstrapped and are assumed to be observations.
}
  \item{res}{
of class \code{expoOutput}. Results from one of the \code{\link{ExPosition}} methods (e.g., \code{\link{epPCA}}, \code{\link{epMCA}}),
}
  \item{DESIGN}{
A design matrix (in disjunctive coding). Only used if \code{constrained} is TRUE.
}
  \item{constrained}{
a boolean. If TRUE, bootstrap resampling will occur within groups as designated by the \code{DESIGN} matrix.
}
}
\value{
\item{fjj}{a set of factor scores of the measures (columns, \code{fj}) for the bootstrapped data.}
}
\references{
	Chernick, M. R. (2008). \emph{Bootstrap methods: A guide for practitioners and researchers} (Vol. 619). Wiley-Interscience.\cr
	Hesterberg, T. (2011). Bootstrap. \emph{Wiley Interdisciplinary Reviews: Computational Statistics}, \emph{3}, 497–526. \cr
}
\author{
Derek Beaton
}

\seealso{
See the functions \code{\link{supplementaryCols}} and \code{link{boot.samples}}
}
\examples{
	##the following code generates 100 bootstrap resampled 
	##projections of the measures from the Iris data set.
	data(ep.iris)
	data <- ep.iris$data
	design <- ep.iris$design
	iris.pca <- epGPCA(data,scale="SS1",DESIGN=design,make_design_nominal=FALSE)
	boot.fjs.unconstrained <- array(0,dim=c(dim(iris.pca$ExPosition.Data$fj),100))
	boot.fjs.constrained <- array(0,dim=c(dim(iris.pca$ExPosition.Data$fj),100))
	for(i in 1:100){
		#unconstrained means we resample any of the 150 flowers
		boot.fjs.unconstrained[,,i] <- boot.compute.fj(ep.iris$data,iris.pca)
		#constrained resamples within each of the 3 groups
		boot.fjs.constrained[,,i] <- boot.compute.fj(data,iris.pca,design,TRUE)		
	}
}
\keyword{ multivariate }
\keyword{ inference }
\keyword{ bootstrap }