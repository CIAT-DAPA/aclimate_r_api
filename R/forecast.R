#' Get climate forecast
#'
#' @description Retrieve forecast process details, probabilities, and climatic scenarios using the HTTP GET method. This endpoint offers comprehensive information derived from the forecasting process, enabling users to access valuable insights into probabilities and climatic scenarios.
#'
#' @param url_root Url root where the API is located.
#' @param stations Array of strings with the ids of the weather stations.
#'
#' @return A List with 3 attributes (probabilities, performance, scenarios).
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' stations=c("58504f1a006cb93ed40eebe2","58504f1a006cb93ed40eebe3")
#' obj_f = get_forecast_climate(url_root, stations)
#' print(obj_f)
#'
#' @export
get_forecast_climate = function(url_root, stations){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Download data
    ws = paste(stations,collapse=",")
    url = paste0(url_root,"Forecast/Climate/",ws,"/true/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df_prob = do.call(rbind,
                    lapply(data$climate,function(w){
                        do.call(rbind,lapply(w$data,function(wd){
                            do.call(rbind,lapply(wd$probabilities,function(p){
                                data.frame(ws_id=w$weather_station, year=wd$year, month=wd$month,
                                measure=p$measure, lower=p$lower, normal=p$normal, upper=p$upper)
                            }))
                        }))
                    }))
    df_perf = do.call(rbind,
                    lapply(data$climate,function(w){
                        do.call(rbind,lapply(w$performance,function(p){
                            data.frame(ws_id=w$weather_station,
                            year=p$year, month=p$month,
                            measure=p$measure, value=p$value)
                        }))
                    }))
    df_scen = do.call(rbind,
                    lapply(data$scenario,function(w){
                        do.call(rbind,lapply(w$monthly_data,function(wm){
                            do.call(rbind,lapply(wm$data,function(d){
                                data.frame(ws_id=w$weather_station, scenario=w$name,
                                year=w$year, month=wm$month,
                                measure=d$measure, value=d$value)
                            }))
                        }))
                    }))
    forecast_climate = list(probabilities=df_prob, performance=df_perf, scenarios=df_scen)
    return (forecast_climate)
}

#' Get crop forecast
#'
#' @description Access yield data obtained through the crop model process using the HTTP GET method. This endpoint provides valuable information on crop yields, offering insights derived from the crop model process.
#'
#' @param url_root Url root where the API is located.
#' @param stations Array of strings with the ids of the weather stations.
#'
#' @return A data.frame, with the crop forecast result for the weather stations.
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' stations=c("58504f1a006cb93ed40eebe2","58504f1a006cb93ed40eebe3")
#' df = get_forecast_crop(url_root, stations)
#' print(head(df))
#'
#' @export
get_forecast_crop = function(url_root, stations){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Download data
    ws = paste(stations,collapse=",")
    url = paste0(url_root,"Forecast/Yield/",ws,"/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df = do.call(rbind,
                    lapply(data$yield,function(w){
                        do.call(rbind,lapply(w$yield,function(wy){
                            do.call(rbind,lapply(wy$data,function(y){
                                data.frame(ws_id=w$weather_station,
                                            cultivar=wy$cultivar, soil=wy$soil, start=wy$start, end=wy$end,
                                            measure=y$measure,
                                            median=y$median,avg=y$avg,min=y$min,max=y$max,
                                            quar_1=y$quar_1,quar_2=y$quar_2,quar_3=y$quar_3,
                                            conf_lower=y$conf_lower,conf_upper=y$conf_upper,
                                            sd=y$sd,perc_5=y$perc_5,perc_95=y$perc_95,
                                            coef_var=y$coef_var)
                            }))
                        }))
                    }))
    return (df)
}



#' Get forecast id
#'
#' @description Access primary forecast data for each month within a desired year using the HTTP GET method. This endpoint provides essential information, including unique identifiers, dates, and confidence levels, allowing for the identification of key details in the forecast for the specified year.
#'
#' @param url_root Url root where the API is located.
#' @param year Integer that represents the year from which you want to obtain the data for each forecast
#'
#' @return A data.frame, with the list of all forecast
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' year= 2023
#' forecasts = get_forecast_information(url_root, year)
#' print(forecasts)
#'
#' @export
get_forecast_information = function(url_root, year){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Download data
    url = paste0(url_root,"Forecast/Log/",year,"/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df = do.call(rbind,
                 lapply(data,function(c){
                     data.frame(id=c$id, start=c$start, end=c$end, confindece=c$confindece)
                 }))
    return (df)
}



#' Get subseasonal forecast
#'
#' @description Retrieve information from the subseasonal forecast process, including probabilities and climatic scenarios, using the HTTP GET method. This endpoint provides valuable insights into the forecast data and is accessed to gather relevant information.
#'
#' @param url_root Url root where the API is located.
#' @param stations Array of strings with the ids of the weather stations.
#'
#' @return A data.frame, with the list of all subseasonal forecast data
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' stations = c("63a3744005732d2a14260392","63a374ce05732d2a14260499")
#' subseasonal_data = get_forecast_subseasonal(url_root, stations)
#' print(subseasonal_data)
#'
#' @export
get_forecast_subseasonal = function(url_root, stations){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Download data
    ws = paste(stations,collapse=",")
    url = paste0(url_root,"Forecast/SubseasonalWS/",ws,"/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df <- as.data.frame(do.call(rbind, lapply(data$subseasonal, function(x) {
        do.call(rbind, lapply(x$data, function(y) {
            data.frame(weather_station = x$weather_station,
                       year = y$year,
                       month = y$month,
                       week = y$week,
                       measure = sapply(y$probabilities, function(z) z$measure),
                       lower = sapply(y$probabilities, function(z) z$lower),
                       normal = sapply(y$probabilities, function(z) z$normal),
                       upper = sapply(y$probabilities, function(z) z$upper))
        }))
    })))
    return (df)
}


#' Get previous climate forecast
#'
#' @description Through this endpoint you can obtain the information obtained through the forecast process that is desired by means of the Id, the seasonal and subseasonal probabilities and the climatic scenarios. This endpoint is used through the Http GET method.
#'
#' @param url_root Url root where the API is located.
#' @param forecast Represents the id of the forecast from which the information is desired.
#' @param stations Array of strings with the ids of the weather stations.
#'
#' @return A List with 3 attributes (probabilities, performance, scenarios).
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' forecast = "657006544afb9646da8c6b78"
#' stations=c("58504f1a006cb93ed40eebe2","58504f1a006cb93ed40eebe3")
#' obj_fp = get_forecast_climate_previous(url_root, forecast, stations)
#' print(obj_fp)
#'
#' @export
get_forecast_climate_previous = function(url_root, forecast, stations){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Download data
    ws = paste(stations,collapse=",")
    url = paste0(url_root,"Forecast/ClimatePrevious/",forecast,"/",ws,"/true/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df_prob = do.call(rbind,
                      lapply(data$climate,function(w){
                          do.call(rbind,lapply(w$data,function(wd){
                              do.call(rbind,lapply(wd$probabilities,function(p){
                                  data.frame(ws_id=w$weather_station, year=wd$year, month=wd$month,
                                             measure=p$measure, lower=p$lower, normal=p$normal, upper=p$upper)
                              }))
                          }))
                      }))
    df_perf = do.call(rbind,
                      lapply(data$climate,function(w){
                          do.call(rbind,lapply(w$performance,function(p){
                              data.frame(ws_id=w$weather_station,
                                         year=p$year, month=p$month,
                                         measure=p$measure, value=p$value)
                          }))
                      }))
    df_scen = do.call(rbind,
                      lapply(data$scenario,function(w){
                          do.call(rbind,lapply(w$monthly_data,function(wm){
                              do.call(rbind,lapply(wm$data,function(d){
                                  data.frame(ws_id=w$weather_station, scenario=w$name,
                                             year=w$year, month=wm$month,
                                             measure=d$measure, value=d$value)
                              }))
                          }))
                      }))
    forecast_climate = list(probabilities=df_prob, performance=df_perf, scenarios=df_scen)
    return (forecast_climate)
}


#' Get crop forecast previous
#'
#' @description Through this endpoint you can obtains the forecast information for a specific forecast indicated in the parameters. This endpoint is used through the Http GET method.
#'
#' @param url_root Url root where the API is located.
#' @param forecast Represents the id of the forecast from which the information is desired.
#' @param stations Array of strings with the ids of the weather stations.
#'
#' @return A data.frame, with the crop forecast result for the weather stations.
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' forecast = "657006544afb9646da8c6b78"
#' stations=c("58504f1a006cb93ed40eebe2","58504f1a006cb93ed40eebe3")
#' df = get_forecast_crop_previous(url_root, forecast, stations)
#' print(head(df))
#'
#' @export
get_forecast_crop_previous = function(url_root, forecast, stations){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Download data
    ws = paste(stations,collapse=",")
    url = paste0(url_root,"Forecast/YieldPrevious/",forecast,"/",ws,"/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df = do.call(rbind,
                 lapply(data$yield,function(w){
                     do.call(rbind,lapply(w$yield,function(wy){
                         do.call(rbind,lapply(wy$data,function(y){
                             data.frame(ws_id=w$weather_station,
                                        cultivar=wy$cultivar, soil=wy$soil, start=wy$start, end=wy$end,
                                        measure=y$measure,
                                        median=y$median,avg=y$avg,min=y$min,max=y$max,
                                        quar_1=y$quar_1,quar_2=y$quar_2,quar_3=y$quar_3,
                                        conf_lower=y$conf_lower,conf_upper=y$conf_upper,
                                        sd=y$sd,perc_5=y$perc_5,perc_95=y$perc_95,
                                        coef_var=y$coef_var)
                         }))
                     }))
                 }))
    return (df)
}



#' Get forecast crop exceedance
#'
#' @description Through this endpoint you can obtain the information obtained through of all forecast in the crop model process, yield data. This endpoint is used through the Http GET method.
#'
#' @param url_root Url root where the API is located.
#' @param stations Array of strings with the ids of the weather stations.
#'
#' @return A data.frame, with the crop forecast result for the weather stations.
#'
#' @examples
#' url_root = "https://webapi.aclimate.org/api/"
#' stations=c("58504f1a006cb93ed40eebe2","58504f1a006cb93ed40eebe3")
#' df = get_forecast_crop_exc(url_root, stations)
#' print(head(df))
#'
#' @export
get_forecast_crop_exc = function(url_root, stations){
    library(httr)
    library(rjson)
    httr::set_config(config(ssl_verifypeer = 0L))
    # Download data
    ws = paste(stations,collapse=",")
    url = paste0(url_root,"Forecast/YieldExceedance/",ws,"/json")
    request = GET(url)
    response = content(request, as = "text", encoding = "UTF-8")
    data = fromJSON(response)
    df = do.call(rbind,
                 lapply(data$yield,function(w){
                     do.call(rbind,lapply(w$yield,function(wy){
                         do.call(rbind,lapply(wy$data,function(y){
                             data.frame(ws_id=w$weather_station,
                                        cultivar=wy$cultivar, soil=wy$soil, start=wy$start, end=wy$end,
                                        measure=y$measure,
                                        median=y$median,avg=y$avg,min=y$min,max=y$max,
                                        quar_1=y$quar_1,quar_2=y$quar_2,quar_3=y$quar_3,
                                        conf_lower=y$conf_lower,conf_upper=y$conf_upper,
                                        sd=y$sd,perc_5=y$perc_5,perc_95=y$perc_95,
                                        coef_var=y$coef_var)
                         }))
                     }))
                 }))
    return (df)
}
