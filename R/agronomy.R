#' Get agronomy setup
#'
#' @description Access a concise list of soils and cultivars associated with each crop using the HTTP GET method. This endpoint provides essential agronomic details, facilitating informed decisions related to soil and cultivar selection for specific crops.
#'
#' @param url_root Url root where the API is located.
#'
#' @return A List with 2 attributes (cultivars, soils).
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' obj_f = get_agronomy(url_root)
#' print(obj_f)
#'
#' @export
get_agronomy = function(url_root){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Downloading data
    url = paste0(url_root,"Agronomic/true/json")
    request = httr::GET(url)
    # Extracting content directly from the request object
    response = httr::content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df_soils = do.call(rbind,
                       lapply(data,function(c){
                           do.call(rbind,lapply(c$soils,function(s){
                               data.frame(crop_id=c$cp_id,crop_name=c$cp_name,
                                          soil_id=s$id, soil_name=s$name)
                           }))
                       }))
    df_cultivars = do.call(rbind,
                           lapply(data,function(c){
                               do.call(rbind,lapply(c$cultivars,function(cu){
                                   data.frame(crop_id=c$cp_id,crop_name=c$cp_name,
                                              cultivar_id=cu$id, cultivar_name=cu$name,
                                              cultivar_rainfed=cu$rainfed, cultivar_national=cu$national)
                               }))
                           }))
    agronomy = list(cultivars=df_cultivars, soils=df_soils)
    return (agronomy)
}
