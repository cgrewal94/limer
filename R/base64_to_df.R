#' Convert base64 encoded data to a data frame
#'
#' This function converts raw base64 results into a data frame.
#' @param x \dots
#' @importFrom utils read.csv
#' @export
#' @examples \dontrun{
#' base64_to_df()
#' }

base64_to_df <- function(x, sep = ",") {
  raw_csv <- rawToChar(base64enc::base64decode(x))

  raw_data <- read.csv(textConnection(raw_csv), stringsAsFactors = FALSE, sep = sep)
  colnames(raw_data) <- gsub("\\.", "_", gsub("\\.$", "", colnames(raw_data))) # change periods in variable names to _

  return(raw_data)
}
