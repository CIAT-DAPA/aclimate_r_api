#' Get geoserver workspace
#'
#' @description Gets and lists all the workspaces of the GeoServer using the HTTP GET method.
#'
#' @param url_root Url root where the Geoserver is located.
#'
#' @return A dataframe with workspace information.
#'
#' @examples
#' url_root = "https://geo.aclimate.org/geoserver/"
#' obj_f = get_geo_workspaces(url_root)
#' print(obj_f)
#'
#' @export
get_geo_workspaces = function(url_root){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    credentials <- read.table("./geo_config.txt", header = FALSE, sep = "=")
    # Downloading data
    url = paste0(url_root, "/rest/workspaces.json")
    request = GET(url, authenticate(credentials$V2[[1]], credentials$V2[[2]]))
    # Extracting content directly from the request object
    response = httr::content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    workspaces_list <- data$workspaces$workspace
    workspace_df <- data.frame(workspace_name = character(), workspace_href = character(), stringsAsFactors = FALSE)

    for (i in seq_along(workspaces_list)) {
        workspace <- workspaces_list[[i]]
        workspace_df <- rbind(workspace_df, data.frame(workspace_name = workspace$name, workspace_href = workspace$href, stringsAsFactors = FALSE))
    }

    row.names(workspace_df) <- NULL
    return (workspace_df)
}


#' Get geoserver stores
#'
#' @description Retrieves and lists all the stores of a specific workspace using the HTTP GET method.
#'
#' @param url_root Url root where the Geoserver is located.
#'
#' @param workspace Name of the workspace from which the datastores are to be obtained.
#'
#' @return A dataframe with stores information.
#'
#' @examples
#' url_root = "https://geo.aclimate.org/geoserver/"
#' workspace = "climate_indices_pe"
#' obj_f = get_geo_stores(url_root, workspace)
#' print(obj_f)
#'
#' @export
get_geo_stores = function(url_root, workspace){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    credentials <- read.table("./geo_config.txt", header = FALSE, sep = "=")
    # Downloading data
    url = paste0(url_root, "rest/workspaces/", workspace, "/coveragestores.json")
    request = GET(url, authenticate(credentials$V2[[1]], credentials$V2[[2]]))
    # Extracting content directly from the request object
    response = httr::content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    stores_list <- data$coverageStores$coverageStore
    stores_df <- data.frame(store_name = character(), store_href = character(), stringsAsFactors = FALSE)

    for (i in seq_along(stores_list)) {
        store <- stores_list[[i]]
        stores_df <- rbind(stores_df, data.frame(store_name = store$name, store_href = store$href, stringsAsFactors = FALSE))
    }

    row.names(stores_df) <- NULL
    return (stores_df)
}


#' Get geoserver get_geo_mosaics
#'
#' @description Obtains the desired mosaic from the GeoServer using the HTTP GET method, by using the date, workspace, and store.
#'
#' @param url_root Url root where the Geoserver is located.
#'
#' @param workspace Name of the workspace from which the datastores are to be obtained.
#'
#' @param store_name Name of the store from which the mosaics are to be obtained.
#'
#' @param year Year by which the mosaic will be filtered.
#'
#' @param month Month by which the mosaic will be filtered.
#'
#' @return A raster with mosaic information or Null if an error is encountered, it will also be printed to the console.
#'
#' @examples
#' url_root = "https://geo.aclimate.org/geoserver/"
#' workspace = "climate_indices_pe"
#' store_name = "freq_rh80_t_20_25"
#' year = 2014
#' month = 5
#' obj_f = get_geo_mosaics(url_root, workspace, store_name, year, month)
#' print(obj_f)
#'
#' @export
get_geo_mosaics = function(url_root, workspace, store_name, year, month){
    library(httr)
    library(rjson)
    library(raster)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Downloading data
    url = URLencode(paste0(url_root, workspace, "/ows?",
                 "service=WCS",
                 "&request=GetCoverage",
                 "&version=2.0.1",
                 "&coverageId=", store_name,
                 "&format=image/geotiff",
                 "&subset=Time(\"",year,"-",sprintf("%02d", month),"-01T00:00:00.000Z\")"))
    request = GET(url)

    if (request$status_code == 200) {
        temp_tiff <- tempfile(fileext = ".tif")
        writeBin(content(request, "raw"), temp_tiff)

        raster_data <- raster(temp_tiff)
        return (raster_data)

    } else {
        response = content(request, as = "text", encoding = "UTF-8")
        match_result <- regmatches(response, regexpr("<ows:ExceptionText>(.*?)</ows:ExceptionText>", response, perl = TRUE))

        if (length(match_result) > 0) {
            exception_text <- gsub("<ows:ExceptionText>", "", match_result[[1]])
            exception_text <- gsub("</ows:ExceptionText>", "", exception_text)
            cat("Error making the request. Status code:", request$status_code, "\n" , "Msg: ", exception_text, "\n")
        } else {
            cat("Error making the request. Status code:", request$status_code, "\n")
        }
        return(NULL)
    }

}
