% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compileDataframes.R
\name{compileDataframes}
\alias{compileDataframes}
\title{Exports fishery independent and commercial landings data}
\usage{
compileDataframes(path, s.year, e.year, areas.RV = c("strat", "nafo",
  "esswss", "shelf"), areas.land = c("nafo", "esswss", "shelf"),
  csv = TRUE, rdata = TRUE)
}
\arguments{
\item{path}{Filepath indicating where to create folders to store the output.}

\item{s.year}{Year for which to begin data compilation.}

\item{e.year}{Year for which to end data compilation.}

\item{areas.RV}{Areas (spatial scales) for which to compile fishery
independent data. Options are "strat", "nafo", "esswss", "shelf", or any
combination of those four. Default is \code{areas.RV = c("strat", "nafo",
"esswss", "shelf")}.}

\item{areas.land}{Areas (spatial scales) for which to compile commercial
landings data. Options are "nafo", "esswss", "shelf", or any combination of
those three.  Default is \code{areas.land = c("nafo", "esswss", "shelf")}.}

\item{csv}{Logical value indicating whether to export dataframe as a .csv
file. Default is \code{csv = TRUE}.}

\item{rdata}{Logical value indicating whether to export dataframe as a .RData
file. Default is \code{rdata = TRUE}.}
}
\value{
The output is formatted for the \code{marindicators} package and saved
 in directories created by the functions:

 \code{RVdataframe} creates a directory path/output/RV. In the RV folder is a
 folder for each entry in \code{areas.RV}. In each area folder is a csv
 and/or RData file for the specified combination of \code{lengthbased} and
 \code{qadjusted}.

 \code{LWdataframe()} creates a directory path/output/LengthWeight. In the
 LengthWeight folder is a csv and/or RData file with length-weight data for
 each area in \code{areas.RV}.

 \code{LANDdatafrmae()} creates a directory path/output/Landings: In the
 Landings folder is a csv and/or RData file for each area in
 /code{areas.land}.
}
\description{
Exports fishery independent and commercial landings dataframes in
 a format suitable for the \code{marindicators} package. These dataframes
 correspond to \code{X}, \code{X_length}, \code{LenWt.table}, and \code{land}
 in the \code{marindicators} package.
}
\details{
This function calls \code{biomassData()}, \code{stratifyBiomass()},
 \code{RVdataframe()}, \code{LWdataframe()}, and \code{LANDdataframe()} to
 extract and format the survey, length-weight, and commercial landings data.

 User must define \code{channel = odbcConnect("ptran", uid = ###, pwd = ###)}
 in the global environment. This channel must have access to the gscat,
 gsdet, gsinf, and gs_lengths tables from the groundfish database and the
 nafo_strat table from the mfd_stomach database for the fishery-independent
 data and the NAFO, ZIF, and MARFIS databases for the commercial data.
}
\references{
Original code by DD.
}
