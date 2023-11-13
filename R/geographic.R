#' Get country
#'
#' @description Obtain a global list of registered countries in the AClimate system using the HTTP GET method. Ideal for a broad overview of countries covered by AClimate.
#'
#' @param url_root Url root where the API is located.
#'
#' @return A data.frame, with the list of all countries.
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' df = get_countries(url_root)
#' print(head(df))
#'
#' @export
get_geographic_country = function(url_root){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Build url to call the API
    url = paste0(url_root,"Geographic/Country/json")
    request = GET(url)
    # Call API
    response = content(request, as = "text", encoding = "UTF-8")
    # Transform in JSON
    data = fromJSON(response)
    # Transform in data.frame
    df = do.call(rbind,
                    lapply(data,function(c){
                        data.frame(id=c$id, iso2=c$iso2, name=c$name)
                    }))
    return (df)
}

#' Get weather stations
#'
#' @description Retrieve detailed information on states, municipalities, weather stations, and crop-related details for a selected country. This endpoint, using the HTTP GET method, supports localized decision-making in agriculture.
#'
#' @param url_root Url root where the API is located.
#' @param country_id Id of the country
#'
#' @return A data.frame, with the list of all weather stations.
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' country = "61e59d829d5d2486e18d2ea8"
#' df = get_geographic(url_root,country)
#' print(head(df))
#'
#' @export
get_geographic = function(url_root, country_id){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Downloading data
    url = paste0(url_root,"Geographic/",country_id,"/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df = do.call(rbind,
                    lapply(data,function(s){
                        do.call(rbind,lapply(s$municipalities,function(m){
                            do.call(rbind,lapply(m$weather_stations,function(w){
                                data.frame(country_id=s$country[0],country_iso2=s$country[1],country_name=s$country[2],
                                            state_id=s$id, state_name=s$name,
                                            municipality_id=m$id, municipality_name=m$name,
                                            ws_id=w$id, ws_ext_id=w$ext_id, ws_name=w$name, ws_origin=w$origin, ws_lat=w$latitude, ws_lon=w$longitude)
                            }))
                        }))
                    }))
    return (df)
}

#' Get weather stations with crop information
#'
#' @description Access crop-grouped data for states, municipalities, and meteorological stations within a chosen country. The endpoint, utilizing the HTTP GET method, offers insights for optimized decision-making based on specific crops.
#'
#' @param url_root Url root where the API is located.
#' @param country_id Id of the country
#'
#' @return A data.frame, with the list of all weather stations.
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' country = "61e59d829d5d2486e18d2ea8"
#' df = get_ws(url_root,country)
#' print(head(df))
#'
#' @export
get_geographic_crop = function(url_root, country_id){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Downloading data
    url = paste0(url_root,"Geographic/Crop",country_id,"/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df = do.call(rbind,
                    lapply(data,function(s){
                        do.call(rbind,lapply(s$municipalities,function(m){
                            do.call(rbind,lapply(m$weather_stations,function(w){
                                data.frame(country_id=s$country[0],country_iso2=s$country[1],country_name=s$country[2],
                                            state_id=s$id, state_name=s$name,
                                            municipality_id=m$id, municipality_name=m$name,
                                            ws_id=w$id, ws_ext_id=w$ext_id, ws_name=w$name, ws_origin=w$origin, ws_lat=w$latitude, ws_lon=w$longitude)
                            }))
                        }))
                    }))
    return (df)
}