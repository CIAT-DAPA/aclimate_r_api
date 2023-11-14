#' Get climatology
#'
#' @description  Retrieve the climatology of a selected weather station using the HTTP GET method. This endpoint offers access to valuable climatology data.
#'
#' @param url_root Url root where the API is located.
#' @param stations Array of strings with the ids of the weather stations.
#'
#' @return A data.frame, with the climatology of different climatic variables
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' stations=c("58504f1a006cb93ed40eebe2","58504f1a006cb93ed40eebe3")
#' obj_f = get_historical_climatology(url_root, stations)
#' print(obj_f)
#'
#' @export
get_historical_climatology = function(url_root, stations){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Download data
    ws = paste(stations,collapse=",")
    url = paste0(url_root,"Historical/Climatology/",ws,"/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df = do.call(rbind,
                lapply(data,function(w){
                    do.call(rbind,lapply(w$monthly_data,function(md){
                        do.call(rbind,lapply(md$data,function(wd){
                            data.frame(ws_id=w$weather_station,
                                month=md$month,
                                measure=wd$measure, value=wd$value)
                        }))
                    }))
                }))
    return (df)
}

#' Get historical climate information
#'
#' @description  Retrieve the weather history of a selected weather station using the HTTP GET method. This endpoint offers access to valuable historical climatic data.
#'
#' @param url_root Url root where the API is located.
#' @param stations Array of strings with the ids of the weather stations.
#'
#' @return A data.frame, with the climatology of different climatic variables
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' stations=c("58504f1a006cb93ed40eebe2","58504f1a006cb93ed40eebe3")
#' obj_f = get_historical_historicalclimatic(url_root, stations)
#' print(obj_f)
#'
#' @export
get_historical_historicalclimatic = function(url_root, stations){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Download data
    ws = paste(stations,collapse=",")
    url = paste0(url_root,"Historical/HistoricalClimatic/",ws,"/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df = do.call(rbind,
                lapply(data,function(w){
                    do.call(rbind,lapply(w$monthly_data,function(md){
                        do.call(rbind,lapply(md$data,function(wd){
                            data.frame(ws_id=w$weather_station,
                                year=w$year,
                                month=md$month,
                                measure=wd$measure, value=wd$value)
                        }))
                    }))
                }))
    return (df)
}