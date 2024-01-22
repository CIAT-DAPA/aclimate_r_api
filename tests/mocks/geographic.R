geographic_country_mock_data = '[
    {
        "id": "61e59d829d5d2486e18d2ea8",
        "iso2": "CO",
        "name": "Colombia"
    },
    {
        "id": "61e59d829d5d2486e18d2ea9",
        "iso2": "ET",
        "name": "Ethiopia"
    },
    {
        "id": "62a739250dd05810f0e2938d",
        "iso2": "AO",
        "name": "Angola"
    },
    {
        "id": "636c0813e57f2e6ac61394e6",
        "iso2": "GT",
        "name": "Guatemala"
    },
    {
        "id": "641c820e4fb2a6438cc670e7",
        "iso2": "MW",
        "name": "Malawi"
    },
    {
        "id": "641c82214fb2a6438cc670eb",
        "iso2": "TZ",
        "name": "Tanzania"
    },
    {
        "id": "641c82304fb2a6438cc670ee",
        "iso2": "ZM",
        "name": "Zambia"
    },
    {
        "id": "6438525c843fb30d41311d25",
        "iso2": "PE",
        "name": "Peru"
    },
    {
        "id": "651437a78a8437279ea6ca2c",
        "iso2": "NI",
        "name": "Nicaragua"
    }
]'


geographic_mock_data = '[
  {
    "id": "58504314333cb94a800f8098",
    "name": "Casanare",
    "country": {
      "id": "61e59d829d5d2486e18d2ea8",
      "iso2": "CO",
      "name": "Colombia"
    },
    "municipalities": [
      {
        "id": "58504f1a006cb93ed40eebd9",
        "name": "Aguazul",
        "weather_stations": [
          {
            "id": "58504f1a006cb93ed40eebe2",
            "ext_id": "35195030",
            "name": "Aguazul",
            "origin": "IDEAM",
            "latitude": 5.179333333,
            "longitude": -72.55088889,
            "ranges": [
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Bajo",
                "lower": 0,
                "upper": 3000
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Regular",
                "lower": 3001,
                "upper": 5000
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Normal",
                "lower": 5001,
                "upper": 5500
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Bueno",
                "lower": 5501,
                "upper": 6000
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Excelente",
                "lower": 6001,
                "upper": 99999
              }
            ]
          }
        ]
      },
      {
        "id": "58504f1a006cb93ed40eebda",
        "name": "Yopal",
        "weather_stations": [
          {
            "id": "58504f1a006cb93ed40eebe3",
            "ext_id": "35215010",
            "name": "Aeropuerto Yopal",
            "origin": "IDEAM",
            "latitude": 5.320444444,
            "longitude": -72.3875,
            "ranges": [
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Bajo",
                "lower": 0,
                "upper": 1500
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Regular",
                "lower": 1501,
                "upper": 3000
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Normal",
                "lower": 3001,
                "upper": 4500
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Bueno",
                "lower": 4501,
                "upper": 6000
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Excelente",
                "lower": 6001,
                "upper": 99999
              }
            ]
          }
        ]
      },
      {
        "id": "5a7e416457d7f316c8bc5747",
        "name": "Orocue",
        "weather_stations": [
          {
            "id": "5a7e422057d7f316c8bc574e",
            "ext_id": "35225020",
            "name": "Modulos",
            "origin": "IDEAM",
            "latitude": 4.910472,
            "longitude": -71.433056,
            "ranges": [
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Bajo",
                "lower": 0,
                "upper": 3000
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Regular",
                "lower": 3001,
                "upper": 5000
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Normal",
                "lower": 5001,
                "upper": 5500
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Bueno",
                "lower": 5501,
                "upper": 6000
              },
              {
                "crop_id": "585051c4c290272c481111a7",
                "crop_name": "Arroz",
                "label": "Excelente",
                "lower": 6001,
                "upper": 99999
              }
            ]
          }
        ]
      }
    ]
  }
]'


geographic_ws_mock_data = '[
    {
        "id": "64385742843fb30d41311d5a",
        "ext_id": "pe_00001",
        "name": "San Martin",
        "origin": "PISCO & ERA-5",
        "latitude": -6.517,
        "longitude": -76.73805556,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d5b",
        "ext_id": "pe_00002",
        "name": "Bellavista",
        "origin": "PISCO & ERA-5",
        "latitude": -7.055166667,
        "longitude": -76.55836111,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d5c",
        "ext_id": "pe_00003",
        "name": "Alto Biavo 1",
        "origin": "PISCO & ERA-5",
        "latitude": -7.2549686,
        "longitude": -76.47778469,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d61",
        "ext_id": "pe_00008",
        "name": "Alto Biavo 2",
        "origin": "PISCO & ERA-5",
        "latitude": -7.407111111,
        "longitude": -76.41388889,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d65",
        "ext_id": "pe_00012",
        "name": "Bajo Biavo 1",
        "origin": "PISCO & ERA-5",
        "latitude": -7.16319,
        "longitude": -76.49275,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d6a",
        "ext_id": "pe_00017",
        "name": "Bajo Biavo 2",
        "origin": "PISCO & ERA-5",
        "latitude": -7.096277778,
        "longitude": -76.47233333,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d75",
        "ext_id": "pe_00028",
        "name": "San Pablo",
        "origin": "PISCO & ERA-5",
        "latitude": -6.809555556,
        "longitude": -76.57625,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d5d",
        "ext_id": "pe_00004",
        "name": "Campanilla",
        "origin": "PISCO & ERA-5",
        "latitude": -7.484344444,
        "longitude": -76.65311111,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d63",
        "ext_id": "pe_00010",
        "name": "Juanjui",
        "origin": "PISCO & ERA-5",
        "latitude": -7.26871,
        "longitude": -76.73701,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d6c",
        "ext_id": "pe_00019",
        "name": "Pachiza",
        "origin": "PISCO & ERA-5",
        "latitude": -7.293222222,
        "longitude": -76.77091667,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d5e",
        "ext_id": "pe_00005",
        "name": "Chazuta",
        "origin": "PISCO & ERA-5",
        "latitude": -6.569003,
        "longitude": -76.1138026,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d5f",
        "ext_id": "pe_00006",
        "name": "Morales",
        "origin": "PISCO & ERA-5",
        "latitude": -6.47251469,
        "longitude": -76.381989,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d62",
        "ext_id": "pe_00009",
        "name": "Juan Guerra",
        "origin": "PISCO & ERA-5",
        "latitude": -6.589027778,
        "longitude": -76.31825,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d69",
        "ext_id": "pe_00016",
        "name": "Huimbayoc 1",
        "origin": "PISCO & ERA-5",
        "latitude": -6.375861111,
        "longitude": -75.73144444,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d6d",
        "ext_id": "pe_00020",
        "name": "El Porvenir",
        "origin": "PISCO & ERA-5",
        "latitude": -6.215313889,
        "longitude": -75.80250278,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d71",
        "ext_id": "pe_00024",
        "name": "Huimbayoc 2",
        "origin": "PISCO & ERA-5",
        "latitude": -6.452777778,
        "longitude": -75.84555556,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d74",
        "ext_id": "pe_00027",
        "name": "San Antonio",
        "origin": "PISCO & ERA-5",
        "latitude": -6.412738889,
        "longitude": -76.40719722,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d77",
        "ext_id": "pe_00030",
        "name": "Sauce",
        "origin": "PISCO & ERA-5",
        "latitude": -6.694316667,
        "longitude": -76.20099444,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d7d",
        "ext_id": "pe_00036",
        "name": "Tarapoto",
        "origin": "PISCO & ERA-5",
        "latitude": -6.475972222,
        "longitude": -76.37038889,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d60",
        "ext_id": "pe_00007",
        "name": "Cuñumbuqui",
        "origin": "PISCO & ERA-5",
        "latitude": -6.50825,
        "longitude": -76.48075,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d66",
        "ext_id": "pe_00013",
        "name": "Lamas",
        "origin": "PISCO & ERA-5",
        "latitude": -6.41874,
        "longitude": -76.52794444,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d6b",
        "ext_id": "pe_00018",
        "name": "Tabalosos 1",
        "origin": "PISCO & ERA-5",
        "latitude": -6.281799,
        "longitude": -76.761709,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d70",
        "ext_id": "pe_00023",
        "name": "Caynarachi",
        "origin": "PISCO & ERA-5",
        "latitude": -6.330472222,
        "longitude": -76.28175,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d7b",
        "ext_id": "pe_00034",
        "name": "Tabalosos 2",
        "origin": "PISCO & ERA-5",
        "latitude": -6.395333333,
        "longitude": -76.62533333,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d64",
        "ext_id": "pe_00011",
        "name": "Jepelacio",
        "origin": "PISCO & ERA-5",
        "latitude": -6.11275,
        "longitude": -76.90761111,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d67",
        "ext_id": "pe_00014",
        "name": "Moyobamba",
        "origin": "PISCO & ERA-5",
        "latitude": -6.044805556,
        "longitude": -76.96822222,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d7a",
        "ext_id": "pe_00033",
        "name": "Soritor",
        "origin": "PISCO & ERA-5",
        "latitude": -6.141996,
        "longitude": -77.091785,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d68",
        "ext_id": "pe_00015",
        "name": "Awajun",
        "origin": "PISCO & ERA-5",
        "latitude": -5.809638889,
        "longitude": -77.39263889,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d73",
        "ext_id": "pe_00026",
        "name": "Rioja",
        "origin": "PISCO & ERA-5",
        "latitude": -6.047277778,
        "longitude": -77.17197222,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d6e",
        "ext_id": "pe_00021",
        "name": "Picota",
        "origin": "PISCO & ERA-5",
        "latitude": -6.9198917,
        "longitude": -76.330215,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d78",
        "ext_id": "pe_00031",
        "name": "Shamboyacu_1",
        "origin": "PISCO & ERA-5",
        "latitude": -7.02302135,
        "longitude": -76.12952215,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d79",
        "ext_id": "pe_00032",
        "name": "Shamboyacu_2",
        "origin": "PISCO & ERA-5",
        "latitude": -7.02230135,
        "longitude": -76.12911215,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d7e",
        "ext_id": "pe_00037",
        "name": "Tingo De Ponasa",
        "origin": "PISCO & ERA-5",
        "latitude": -6.937222222,
        "longitude": -76.25266667,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d72",
        "ext_id": "pe_00025",
        "name": "Tocache 1",
        "origin": "PISCO & ERA-5",
        "latitude": -8.18475,
        "longitude": -76.50789,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d7c",
        "ext_id": "pe_00035",
        "name": "Tocache 2",
        "origin": "PISCO & ERA-5",
        "latitude": -8.11524,
        "longitude": -76.58049,
        "ranges": []
    },
    {
        "id": "64385742843fb30d41311d76",
        "ext_id": "pe_00029",
        "name": "Saposoa",
        "origin": "PISCO & ERA-5",
        "latitude": -6.943130556,
        "longitude": -76.76822778,
        "ranges": []
    }
]'
