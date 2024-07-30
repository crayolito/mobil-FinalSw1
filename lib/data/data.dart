// PGP = Punto Geografico Pasillo
import 'package:app_sw1final/features/product/domain/entities/producto.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// PGP = Punto Geografico Pasillo
Map<String, LatLng> coordenadasPasillosCANOTO = {
  'PGPBI': const LatLng(-17.78071029, -63.18985103),
  'PGPBF': const LatLng(-17.78071029, -63.18937633),
  'PGPCI': const LatLng(-17.78041762, -63.18942273),
  'PGPCF': const LatLng(-17.78041762, -63.1898546),
  'PGPAI': const LatLng(-17.78102438, -63.18914781),
  'PGPAF': const LatLng(-17.78102343, -63.18990638),
  'PGPDI': const LatLng(-17.78116239, -63.18945428),
  'PGPDF': const LatLng(-17.7803372, -63.18946475),
  'PGPEI': const LatLng(-17.78026962, -63.18977598),
  'PGPEF': const LatLng(-17.78107673, -63.18976837),
};

// PGMP = Punto Geografico para Marcador para el Pasillo
Map<String, LatLng> coordenadasMarkerPasillosCANOTO = {
  'PGMPB': const LatLng(-17.78070029, -63.18961368),
  'PGMPC': const LatLng(-17.78040562, -63.18962067),
  'PGMPA': const LatLng(-17.78101391, -63.18962067),
  'PGMPD': const LatLng(-17.78085000, -63.18945952),
  'PGMPE': const LatLng(-17.78057000, -63.18977218),
};

// PGME = Punto Geografico para el Marcador de la Entrada
Map<String, LatLng> coordenadasMarkerEntradaCANOTO = {
  'PGMEA': const LatLng(-17.78041643, -63.18985579),
  'PGMEB': const LatLng(-17.78027366, -63.18977441),
  'PGMEC': const LatLng(-17.78102462, -63.18914766),
  'PGMED': const LatLng(-17.78116168, -63.18945319),
  'PGMEE': const LatLng(-17.7810289, -63.18990433),
  'PGMEF': const LatLng(-17.78071031, -63.1898514),
  'PGMEG': const LatLng(-17.78033721, -63.18946992),
};

// PGP = Punto Geografico Pasillo
Map<String, LatLng> coordenadasPasillosCHIRIGUANO = {
  'PGPBI': const LatLng(-17.7903935854, -63.149014739),
  'PGPBF': const LatLng(-17.7903985823, -63.1486642444),
  'PGPCI': const LatLng(-17.790497092, -63.1490225912),
  'PGPCF': const LatLng(-17.7904992335, -63.1486706689),
  'PGPAI': const LatLng(-17.7905263594, -63.1489711949),
  'PGPAF': const LatLng(-17.7902872235, -63.1489540627),
  'PGPDI': const LatLng(-17.7902943764, -63.1489545752),
  'PGPDF': const LatLng(-17.7902979311, -63.1486599614),
  'PGPEI': const LatLng(-17.7905270732, -63.148846987),
  'PGPEF': const LatLng(-17.7902379687, -63.148829141),
  'PGPFI': const LatLng(-17.790262953, -63.1488926727),
  'PGPFF': const LatLng(-17.7905263594, -63.1489090909),
  'PGPGI': const LatLng(-17.7905270732, -63.1487848831),
  'PGPGF': const LatLng(-17.7902122705, -63.1487663233),
  'PGPHI': const LatLng(-17.7905263594, -63.1487227791),
  'PGPHF': const LatLng(-17.7902165535, -63.1487035055),
};

// PGMP = Punto Geografico para Marcador para el Pasillo
Map<String, LatLng> coordenadasMarkerEntradaCHIRIGUANO = {
  'PGMPB': const LatLng(-17.7902872235, -63.1489540627),
  'PGMPC': const LatLng(-17.790262953, -63.1488926727),
  'PGMPA': const LatLng(-17.7902379687, -63.148829141),
  'PGMPD': const LatLng(-17.7902122705, -63.1487663233),
  'PGMPE': const LatLng(-17.7902165535, -63.1487035055),
  'PGMPF': const LatLng(-17.7902979311, -63.1486599614),
  'PGMPG': const LatLng(-17.7903985823, -63.1486642444),
  'PGMPH': const LatLng(-17.7904992335, -63.1486706689),
};
// PGME = Punto Geografico para el Marcador de la Entrada
Map<String, LatLng> coordenadasMarkerPasillosCHIRIGUANO = {
  'PGMEA': const LatLng(-17.7903937814, -63.1490009919),
  'PGMEB': const LatLng(-17.790497201, -63.1490046796),
  'PGMEC': const LatLng(-17.7904473972, 63.1489041692),
  'PGMED': const LatLng(-17.7904495823, -63.1487803144),
  'PGMEE': const LatLng(-17.7903402147, -63.1488354525),
  'PGMEF': const LatLng(-17.7903443955, -63.1487114588),
};

class PuntosGeograficosCC {
  final String name;
  final List<LatLng> puntos;

  PuntosGeograficosCC({
    required this.name,
    required this.puntos,
  });
}

List<PuntosGeograficosCC> poligonosCC = [
  PuntosGeograficosCC(name: "Ventura Mall", puntos: [
    const LatLng(-17.755657454587716, -63.200603046952246),
    const LatLng(-17.755672643400754, -63.20056636537964),
    const LatLng(-17.755349121404272, -63.19986303609622),
    const LatLng(-17.754981551102205, -63.199764155335295),
    const LatLng(-17.754720302321697, -63.19929686398834),
    const LatLng(-17.7545684133249, -63.199245828756894),
    const LatLng(-17.754448420918852, -63.19907517969634),
    const LatLng(-17.75419780361856, -63.19907996424569),
    const LatLng(-17.75391528915145, -63.19913578402915),
    const LatLng(-17.753632774243368, -63.19926496695875),
    const LatLng(-17.75333658877637, -63.1995185482641),
    const LatLng(-17.753257605903396, -63.19966208485257),
    const LatLng(-17.755217931550405, -63.20032727630406),
    const LatLng(-17.755216412670574, -63.20043094163047),
  ]),
  PuntosGeograficosCC(name: "Pario Desing Lifestyle Center", puntos: [
    const LatLng(-17.772042917781214, -63.202150601013784),
    const LatLng(-17.77201099015622, -63.20214523659588),
    const LatLng(-17.7719777854202, -63.202208268506176),
    const LatLng(-17.77189732776502, -63.20227264152095),
    const LatLng(-17.771856460370735, -63.20228873477463),
    const LatLng(-17.771795159261785, -63.20229007587911),
    const LatLng(-17.771715978631626, -63.202279347043316),
    const LatLng(-17.77100973693776, -63.20206879363939),
    const LatLng(-17.770996965814646, -63.202011126147),
    const LatLng(-17.771022508059982, -63.20189713226668),
    const LatLng(-17.77101101405003, -63.20188506232642),
    const LatLng(-17.77105699008539, -63.20168791996869),
    const LatLng(-17.7711374481188, -63.20150955307359),
    const LatLng(-17.77205957483544, -63.2017392889085),
    const LatLng(-17.77202950527397, -63.201892660181),
    const LatLng(-17.772028431360965, -63.201887021531284),
    const LatLng(-17.772095013954992, -63.20192423661946),
  ]),
  PuntosGeograficosCC(name: "Centro Comercial 7 Calles", puntos: [
    const LatLng(-17.786720057720014, -63.18622970505983),
    const LatLng(-17.7865006345757, -63.1860286645974),
    const LatLng(-17.7866288571866, -63.18591202319704),
    const LatLng(-17.786556509556394, -63.18568542617873),
    const LatLng(-17.78665036911646, -63.185653239671346),
    const LatLng(-17.786715549291362, -63.185863535061195),
    const LatLng(-17.78690954041612, -63.18579741038697),
    const LatLng(-17.786935718886074, -63.18583496131225),
    const LatLng(-17.787053558184002, -63.1857473886246),
    const LatLng(-17.78717806540648, -63.18588753404217),
    const LatLng(-17.787017163748732, -63.186013597862754),
    const LatLng(-17.78703376472014, -63.186059195414884),
    const LatLng(-17.786932243370924, -63.186088699713316),
    const LatLng(-17.786715153498136, -63.186232197894725),
  ]),
  PuntosGeograficosCC(name: "Centro Comercial Las Brisas", puntos: [
    const LatLng(-17.748792645585986, -63.177571036885475),
    const LatLng(-17.748852792516615, -63.177027471052035),
    const LatLng(-17.748994567344525, -63.17703874835147),
    const LatLng(-17.74907834332641, -63.17640045320265),
    const LatLng(-17.749076195224813, -63.17620648365212),
    const LatLng(-17.748992419241915, -63.17596063852413),
    const LatLng(-17.748844200099178, -63.176125287096085),
    const LatLng(-17.748644426277846, -63.17582531093074),
    const LatLng(-17.74860146413661, -63.17550954654617),
    const LatLng(-17.748549909553503, -63.17544413820935),
    const LatLng(-17.74877331263972, -63.175159950263236),
    const LatLng(-17.74907834332641, -63.17533362067476),
    const LatLng(-17.74911700915099, -63.17530429969619),
    const LatLng(-17.749353646806433, -63.17565076203389),
    const LatLng(-17.749424093590587, -63.17581671524581),
    const LatLng(-17.74948460554972, -63.17596465068041),
    const LatLng(-17.749516216266507, -63.17626431476593),
    const LatLng(-17.74947918656868, -63.17674320833313),
    const LatLng(-17.749387967034455, -63.17759004388514),
    const LatLng(-17.749225015827676, -63.17762501406028),
    const LatLng(-17.748791496231128, -63.17757475394503),
  ]),
  PuntosGeograficosCC(name: "Equipetrol Mall", puntos: [
    const LatLng(-17.765236735491687, -63.19533128155491),
    const LatLng(-17.765035981684857, -63.19503834107701),
    const LatLng(-17.76524730343036, -63.1949198030685),
    const LatLng(-17.765236466423847, -63.194882819209845),
    const LatLng(-17.765389990621554, -63.19476902272168),
    const LatLng(-17.7654107615323, -63.19477755745829),
    const LatLng(-17.76546223725723, -63.1947472117281),
    const LatLng(-17.765528162286802, -63.19486290482441),
    const LatLng(-17.765494748233753, -63.19491316494002),
    const LatLng(-17.76559228112787, -63.195091446104826),
    const LatLng(-17.76526626819018, -63.19531429756081),
    const LatLng(-17.765157898106963, -63.19525550270859),
  ]),
  PuntosGeograficosCC(name: "Shopping Neval", puntos: [
    const LatLng(-17.791010295296882, -63.205611275835814),
    const LatLng(-17.790953383945585, -63.2050936477911),
    const LatLng(-17.791276597227974, -63.20505756043287),
    const LatLng(-17.79132277050628, -63.20558195485725),
    const LatLng(-17.79100922149796, -63.20561353129571),
  ])
];


List<Producto> productosDATO1 = [
  Producto(
    id: 1,
    name: "Camiseta clásica",
    description: "Camiseta de algodón suave y cómoda.",
    price: 19.99,
    image: "https://m.media-amazon.com/images/I/61n8hkNY5GL.jpg",
    discount: 30,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 2,
    name: "Zapatillas deportivas",
    description: "Zapatillas para correr con tecnología avanzada.",
    price: 59.99,
    image:
        "https://i.pinimg.com/564x/eb/76/d7/eb76d7558b4fe02ddeb4bf4b2462d684.jpg",
    discount: 10,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 3,
    name: "Abrigo de invierno",
    description: "Abrigo a prueba de viento y resistente al agua.",
    price: 89.99,
    image:
        "https://i.pinimg.com/564x/5a/41/bc/5a41bcaf7d1bfe97d86bd4d6e297f599.jpg",
    discount: 11,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 4,
    name: "Pantalones vaqueros",
    description: "Vaqueros de corte moderno y ajuste cómodo.",
    price: 49.99,
    image:
        "https://i.pinimg.com/564x/a7/d8/7f/a7d87f4b33d4a6e1256238a19ecd1984.jpg",
    discount: 15,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 5,
    name: "Reloj inteligente",
    description:
        "Reloj con monitor de actividad y notificaciones inteligentes.",
    price: 129.99,
    image:
        "https://i.pinimg.com/564x/eb/8e/75/eb8e7535bdee1ee387d1c3acf3a6c6ac.jpg",
    discount: 15,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 6,
    name: "Mochila resistente",
    description: "Mochila con compartimentos y material duradero.",
    price: 39.99,
    image:
        "https://i.pinimg.com/564x/d9/cf/e0/d9cfe0127d25cab760d0b1a6de6b0292.jpg",
    discount: 4,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 7,
    name: "Botines de cuero",
    description: "Botines elegantes de cuero genuino.",
    price: 79.99,
    image:
        "https://i.pinimg.com/564x/37/22/04/3722047551ebd8be2f7eccc533e6b973.jpg",
    discount: 12,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 8,
    name: "Gafas de sol polarizadas",
    description: "Gafas de sol con protección UV y estilo moderno.",
    price: 29.99,
    image:
        "https://i.pinimg.com/564x/56/12/fe/5612fe30eb8ea635e08aa19b40d0d190.jpg",
    discount: 10,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 9,
    name: "Teclado mecánico para juegos",
    description: "Teclado diseñado para jugadores con retroiluminación LED.",
    price: 69.99,
    image:
        "https://i.pinimg.com/564x/51/ad/03/51ad030be70b17dd894afef85aa06fa5.jpg",
    discount: 8,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 10,
    name: "Cámara digital compacta",
    description: "Cámara con zoom óptico y funciones avanzadas.",
    price: 249.99,
    image:
        "https://i.pinimg.com/564x/77/fe/c7/77fec7beb0ac6df31ea41fb9918b881c.jpg",
    discount: 9,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 11,
    name: "Auriculares inalámbricos",
    description: "Auriculares Bluetooth con cancelación de ruido.",
    price: 99.99,
    image:
        "https://i.pinimg.com/564x/b1/ed/9b/b1ed9b832ced92d86f7c08477650e5ec.jpg",
    discount: 14,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 12,
    name: "Silla ergonómica de oficina",
    description: "Silla con ajuste lumbar y apoyabrazos ajustables.",
    price: 15.99,
    image:
        "https://i.pinimg.com/564x/61/5f/b3/615fb396e52f0e2f7048b0147e4cc2df.jpg",
    discount: 4,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 13,
    name: "Set de utensilios de cocina",
    description: "Set de utensilios de acero inoxidable para cocina.",
    price: 49.99,
    image:
        "https://i.pinimg.com/564x/8a/64/1c/8a641c32ecd0c10d3a57fd61105e32f1.jpg",
    discount: 9,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 14,
    name: "Monitor de 27 pulgadas",
    description: "Monitor LED con alta resolución y colores vibrantes.",
    price: 29.99,
    image:
        "https://i.pinimg.com/564x/01/18/8f/01188f54c98daf9f8663da0f1aeb8aa3.jpg",
    discount: 8,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 15,
    name: "Batería externa portátil",
    description: "Batería con capacidad para cargar dispositivos múltiples.",
    price: 34.99,
    image:
        "https://i.pinimg.com/736x/a3/7b/e0/a37be0b023e03e76d3fb308e92b33ecc.jpg",
    discount: 5,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 16,
    name: "Sudadera con capucha",
    description: "Sudadera cómoda y abrigada con capucha.",
    price: 44.99,
    image:
        "https://i.pinimg.com/564x/d8/d2/a1/d8d2a1ecb120e2316a3a793b2a66f0b9.jpg",
    discount: 5,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 17,
    name: "Mouse gaming",
    description: "Mouse ergonómico con botones programables.",
    price: 49.99,
    image:
        "https://i.pinimg.com/564x/e5/d9/43/e5d943131e935ac450445773613eb57f.jpg",
    discount: 6,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 18,
    name: "Cepillo eléctrico para dientes",
    description: "Cepillo con tecnología sónica para una limpieza profunda.",
    price: 39.99,
    image:
        "https://i.pinimg.com/564x/38/31/fe/3831fe0994740c9a55e7b3851347a55d.jpg",
    discount: 6,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 19,
    name: "Bicicleta de montaña",
    description: "Bicicleta todo terreno para aventuras al aire libre.",
    price: 499.99,
    image:
        "https://i.pinimg.com/564x/f8/5e/f6/f85ef6c42eaa6683d73874dc22af7e49.jpg",
    discount: 9,
    createdAt: "2023-12-27T12:00:00Z",
  ),
];

List<Producto> productosDATO2 = [
  Producto(
    id: 1,
    name: "Reloj inteligente",
    description:
        "Reloj con monitor de actividad y notificaciones inteligentes.",
    price: 129.99,
    image:
        "https://i.pinimg.com/564x/eb/8e/75/eb8e7535bdee1ee387d1c3acf3a6c6ac.jpg",
    discount: 15,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 2,
    name: "Mochila resistente",
    description: "Mochila con compartimentos y material duradero.",
    price: 39.99,
    image:
        "https://i.pinimg.com/564x/d9/cf/e0/d9cfe0127d25cab760d0b1a6de6b0292.jpg",
    discount: 4,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 3,
    name: "Gafas de sol polarizadas",
    description: "Gafas de sol con protección UV y estilo moderno.",
    price: 29.99,
    image:
        "https://i.pinimg.com/564x/56/12/fe/5612fe30eb8ea635e08aa19b40d0d190.jpg",
    discount: 10,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 4,
    name: "Teclado mecánico para juegos",
    description: "Teclado diseñado para jugadores con retroiluminación LED.",
    price: 69.99,
    image:
        "https://i.pinimg.com/564x/51/ad/03/51ad030be70b17dd894afef85aa06fa5.jpg",
    discount: 8,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 5,
    name: "Cámara digital compacta",
    description: "Cámara con zoom óptico y funciones avanzadas.",
    price: 249.99,
    image:
        "https://i.pinimg.com/564x/77/fe/c7/77fec7beb0ac6df31ea41fb9918b881c.jpg",
    discount: 9,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 6,
    name: "Auriculares inalámbricos",
    description: "Auriculares Bluetooth con cancelación de ruido.",
    price: 99.99,
    image:
        "https://i.pinimg.com/564x/b1/ed/9b/b1ed9b832ced92d86f7c08477650e5ec.jpg",
    discount: 14,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 7,
    name: "Silla ergonómica de oficina",
    description: "Silla con ajuste lumbar y apoyabrazos ajustables.",
    price: 159.99,
    image:
        "https://i.pinimg.com/564x/61/5f/b3/615fb396e52f0e2f7048b0147e4cc2df.jpg",
    discount: 4,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 8,
    name: "Set de utensilios de cocina",
    description: "Set de utensilios de acero inoxidable para cocina.",
    price: 49.99,
    image:
        "https://i.pinimg.com/564x/8a/64/1c/8a641c32ecd0c10d3a57fd61105e32f1.jpg",
    discount: 9,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 9,
    name: "Monitor de 27 pulgadas",
    description: "Monitor LED con alta resolución y colores vibrantes.",
    price: 299.99,
    image:
        "https://i.pinimg.com/564x/01/18/8f/01188f54c98daf9f8663da0f1aeb8aa3.jpg",
    discount: 8,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 10,
    name: "Batería externa portátil",
    description: "Batería con capacidad para cargar dispositivos múltiples.",
    price: 34.99,
    image:
        "https://i.pinimg.com/736x/a3/7b/e0/a37be0b023e03e76d3fb308e92b33ecc.jpg",
    discount: 5,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 11,
    name: "Mouse gaming",
    description: "Mouse ergonómico con botones programables.",
    price: 49.99,
    image:
        "https://i.pinimg.com/564x/e5/d9/43/e5d943131e935ac450445773613eb57f.jpg",
    discount: 6,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 12,
    name: "Cepillo eléctrico para dientes",
    description: "Cepillo con tecnología sónica para una limpieza profunda.",
    price: 39.99,
    image:
        "https://i.pinimg.com/564x/38/31/fe/3831fe0994740c9a55e7b3851347a55d.jpg",
    discount: 6,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 13,
    name: "Bicicleta de montaña",
    description: "Bicicleta todo terreno para aventuras al aire libre.",
    price: 499.99,
    image:
        "https://i.pinimg.com/564x/f8/5e/f6/f85ef6c42eaa6683d73874dc22af7e49.jpg",
    discount: 9,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 14,
    name: "Altavoz Bluetooth portátil",
    description:
        "Altavoz con sonido de alta calidad y batería de larga duración.",
    price: 59.99,
    image:
        "https://i.pinimg.com/564x/00/aa/00/00aa00b7312e1a9b0b614a1a64e65de3.jpg",
    discount: 7,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 15,
    name: "Cafetera de cápsulas",
    description:
        "Cafetera compatible con cápsulas para preparar café rápidamente.",
    price: 89.99,
    image:
        "https://i.pinimg.com/564x/11/22/33/112233aa4e3a4c89f6a1aef8bde54f1d.jpg",
    discount: 10,
    createdAt: "2023-12-27T12:00:00Z",
  ),
  Producto(
    id: 16,
    name: "Tablet 10 pulgadas",
    description: "Tablet con pantalla de 10 pulgadas y alta resolución.",
    price: 199.99,
    image:
        "https://i.pinimg.com/564x/44/55/66/445566aa8f7a4e3cba4df9c8c4b5f7ef.jpg",
    discount: 10,
    createdAt: "2023-12-27T12:00:00Z",
  ),
];

class MapTypeOptions {
  final String titulo;
  final bool bandera;
  final String imagen;
  final GestureTapCallback onTap;

  MapTypeOptions({
    required this.titulo,
    required this.bandera,
    required this.imagen,
    required this.onTap,
  });
}
