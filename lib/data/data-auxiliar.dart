class DataWindow {
  final String name;
  final String owner;
  final String imagen;
  final String direction;
  final double longitud;
  final double latitud;
  final String telefono;
  // Pagina web centro comercial url
  final String weburl;
  // Link Google Map App
  final String googleMapsurl;
  // Link de Google Drive Sugerencias
  final String driveurl;

  DataWindow(
      {required this.name,
      required this.owner,
      required this.imagen,
      required this.direction,
      required this.longitud,
      required this.latitud,
      required this.telefono,
      required this.weburl,
      required this.googleMapsurl,
      required this.driveurl});
}

class CentroComercial {
  final int id;
  final String name;
  final String owner;
  final String imagen;
  final String direction;
  final double longitud;
  final double latitud;
  final String telefono;
  // Pagina web centro comercial url
  final String weburl;
  // Link Google Map App
  final String googleMapsurl;
  // Link de Google Drive Sugerencias
  final String driveurl;
  // TIENE O NO SUBCRIPCION
  final bool subscription;

  CentroComercial(
      {required this.id,
      required this.name,
      required this.owner,
      required this.imagen,
      required this.direction,
      required this.longitud,
      required this.latitud,
      required this.telefono,
      required this.weburl,
      required this.googleMapsurl,
      required this.driveurl,
      required this.subscription});
}

class Caseta {
  final int id;
  final String name;
  final String owner;
  final String imagen;
  final String direction;
  final double longitud;
  final double latitud;
  final String telefono;
  // Pagina web centro comercial url
  final String weburl;
  // Link Google Map App
  final String googleMapsurl;
  // Link de Google Drive Sugerencias
  final String driveurl;

  Caseta({
    required this.id,
    required this.name,
    required this.owner,
    required this.imagen,
    required this.direction,
    required this.longitud,
    required this.latitud,
    required this.telefono,
    required this.weburl,
    required this.googleMapsurl,
    required this.driveurl,
  });
}

List<CentroComercial> centrosComerciales = [
  CentroComercial(
      id: 0,
      name: "Ventura Mall",
      owner: "Ventura Group",
      imagen:
          "https://i.pinimg.com/564x/49/00/59/49005906ef94809bde9407da7708dd52.jpg",
      direction: "Avenida San Martín #1234, Santa Cruz de la Sierra",
      longitud: -63.19914917887688,
      latitud: -17.754299274887114,
      telefono: "+591 78452415 ",
      weburl: "http://www.venturamall.bo/",
      googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
      driveurl:
          "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform",
      subscription: false),
  CentroComercial(
      id: 1,
      name: "Centro Comercial Las Brisas",
      owner: "Brisas Corporation",
      subscription: false,
      imagen:
          "https://i.pinimg.com/564x/40/06/f1/4006f19104bc0c3da5a5ec181d97d776.jpg",
      direction: "Avenida Las Brisas #678, Santa Cruz de la Sierra",
      longitud: -63.176452228889886,
      latitud: -17.74946936359651,
      telefono: "+591 78452415 ",
      weburl: "http://www.venturamall.bo/",
      googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
      driveurl:
          "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  CentroComercial(
      id: 2,
      name: "Centro Comercial Cañoto",
      owner: "Cañoto Company",
      imagen:
          "https://i.pinimg.com/564x/b3/90/5f/b3905f8ac7610c343d96d6086b92d050.jpg",
      direction: "Avenida Cañoto #890, Santa Cruz de la Sierra",
      longitud: -63.18962319460685,
      latitud: -17.780719833552425,
      telefono: "+591 78452415 ",
      subscription: true,
      weburl: "http://www.venturamall.bo/",
      googleMapsurl: "https://maps.app.goo.gl/Gv6Hx5ewsZV9rgaJ7",
      driveurl:
          "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  CentroComercial(
      id: 3,
      name: "Centro Comercial MAQUIO",
      owner: "Cocaleros Corporation",
      subscription: true,
      imagen:
          "https://i.pinimg.com/564x/23/cb/c0/23cbc02347c90c71ca4fe0ce0eb88275.jpg",
      direction: "Avenida Las Brisas #678, Santa Cruz de la Sierra",
      longitud: -63.14869468444409,
      latitud: -17.790287110771647,
      telefono: "+591 78452415 ",
      weburl:
          "https://www.facebook.com/p/Centro-Comercial-MAQUIO-100058297754481/?locale=es_LA",
      googleMapsurl: "https://maps.app.goo.gl/PxSme66SJXFfgG298",
      driveurl: "https://maps.app.goo.gl/EtMJDHcwHj68BURY7"),
  // CentroComercial(
  //     id: 2,
  //     name: "Patio Desing Lifestyle Center",
  //     owner: "Patio Group",
  //     imagen:
  //         "https://i.pinimg.com/564x/1d/1f/e7/1d1fe7c281ffc1fdb8ba143835b02372.jpg",
  //     direction: "Calle Ayacucho #567, Santa Cruz de la Sierra",
  //     longitud: -63.20198185984585,
  //     latitud: -17.771535125302815,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     subscription: false,
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),

  // CentroComercial(
  //     id: 4,
  //     name: "Centro Comercial 7 Calles",
  //     owner: "7 Calles Group",
  //     imagen:
  //         "https://i.pinimg.com/564x/fb/97/d6/fb97d6b8681d09ccc251defbb69ce5ec.jpg",
  //     direction: "Calle Sucre #345, Santa Cruz de la Sierra",
  //     longitud: -63.185981309303,
  //     latitud: -17.786761761998275,
  //     subscription: false,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),

  // CentroComercial(
  //     id: 6,
  //     name: "Equipetrol Mall",
  //     owner: "Equipetrol Holdings",
  //     subscription: false,
  //     imagen:
  //         "https://i.pinimg.com/564x/00/e3/37/00e337a5fe2813377240408b6b8be363.jpg",
  //     direction: "Avenida Equipetrol #4321, Santa Cruz de la Sierra",
  //     longitud: -63.19515307306886,
  //     latitud: -17.765417505960585,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  // CentroComercial(
  //     id: 7,
  //     name: "Shopping Neval",
  //     owner: "Neval Corporation",
  //     subscription: false,
  //     imagen:
  //         "https://i.pinimg.com/564x/c1/03/8c/c1038cd7ccde8acb59b66a405c1f853e.jpg",
  //     direction: "Calle Rene Moreno #111, Santa Cruz de la Sierra",
  //     longitud: -63.2050243000541,
  //     latitud: -17.791258169675746,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  // CentroComercial(
  //     name: "Centro Comercial Chiriguano",
  //     owner: "Chiriguano Holdings",
  //     subscription: false,
  //     imagen:
  //         "https://i.pinimg.com/564x/40/b7/1f/40b71f6680b251522ad584c5d8176343.jpg",
  //     direction: "Calle Chiriguano #999, Santa Cruz de la Sierra",
  //     longitud: -63.205775318559695,
  //     latitud: -17.790405153327352,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  // CentroComercial(
  //     name: "Centro Comercial Bush",
  //     owner: "Bush Corporation",
  //     subscription: false,
  //     imagen:
  //         "https://i.pinimg.com/564x/ed/7c/cb/ed7ccb758d206a4f72b52b6af70fca99.jpg",
  //     direction: "Avenida Bush #246, Santa Cruz de la Sierra",
  //     longitud: -63.19163856447199,
  //     latitud: -17.773259579347577,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  // CentroComercial(
  //     name: "Centro Comercial Quirusillas",
  //     owner: "Quirusillas Group",
  //     subscription: false,
  //     imagen:
  //         "https://i.pinimg.com/564x/cd/1b/ee/cd1bee1f9beb4567dbfac3c225e5db98.jpg",
  //     direction: "Calle Quirusillas #753, Santa Cruz de la Sierra",
  //     longitud: -63.17777292888989,
  //     latitud: -17.778524129414727,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  // CentroComercial(
  //     name: "Centro Comercial Indana",
  //     owner: "Indana Group",
  //     subscription: false,
  //     imagen:
  //         "https://i.pinimg.com/564x/e8/1a/8d/e81a8d0c2722831524cf025877a7c640.jpg",
  //     direction: "Avenida Indana #567, Santa Cruz de la Sierra",
  //     longitud: -63.206001206800394,
  //     latitud: -17.790047212078417,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  // CentroComercial(
  //     name: "Shopping Bolivar",
  //     owner: "Bolivar Corporation",
  //     subscription: false,
  //     imagen:
  //         "https://i.pinimg.com/736x/e6/72/d8/e672d85009f4617931c9ea85792d24eb.jpg",
  //     direction: "Avenida Bolivar #321, Santa Cruz de la Sierra",
  //     longitud: -63.19914917887688,
  //     latitud: -17.754299274887114,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  // CentroComercial(
  //     name: "Centro Comercial Los Pozos",
  //     owner: "Pozos Group",
  //     imagen:
  //         "https://i.pinimg.com/564x/bc/f5/1a/bcf51a131f0e731cc1d4ed486de5903e.jpg",
  //     direction: "Calle Los Pozos #987, Santa Cruz de la Sierra",
  //     longitud: -63.20198185984585,
  //     latitud: -17.771535125302815,
  //     telefono: "+591 78452415 ",
  //     subscription: false,
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  // CentroComercial(
  //     name: "Shopping Center Cavero",
  //     owner: "Cavero Holdings",
  //     subscription: false,
  //     imagen:
  //         "https://i.pinimg.com/564x/8b/a2/bc/8ba2bc339aacfb2fa730b861a7af5117.jpg",
  //     direction: "Avenida Cavero #456, Santa Cruz de la Sierra",
  //     longitud: -63.18977528086259,
  //     latitud: -17.780624574186096,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
  // CentroComercial(
  //     name: "Urubo Open Mall",
  //     owner: "Urubo Group",
  //     subscription: false,
  //     imagen:
  //         "https://i.pinimg.com/564x/5c/bb/59/5cbb591d3439398791b57ef79edc9001.jpg",
  //     direction: "Avenida Urubo #789, Santa Cruz de la Sierra",
  //     longitud: -63.185981309303,
  //     latitud: -17.786761761998275,
  //     telefono: "+591 78452415 ",
  //     weburl: "http://www.venturamall.bo/",
  //     googleMapsurl: "https://maps.app.goo.gl/mbegMQ4EbRmRZruR6",
  //     driveurl:
  //         "https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform"),
];

List<Caseta> marcadoresCasetaCCBrisas = [
  Caseta(
    id: 1,
    name: "Café Central",
    owner: "María García",
    imagen:
        "https://i.pinimg.com/564x/a0/92/46/a09246cabd6b799bcb4729314f7ecb9b.jpg",
    direction: "Calle Bolívar 123",
    longitud: -63.17724478711718,
    latitud: -17.74887786793181,
    telefono: "+591-2-1234567",
    weburl: "https://www.cafecentral.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74887786793181,-63.17724478711718",
    driveurl: "https://drive.google.com/drive/folders/abc123",
  ),
  Caseta(
    id: 2,
    name: "El Paraíso del Pan",
    owner: "Pedro López",
    imagen:
        "https://i.pinimg.com/736x/3e/16/19/3e16198d869e7f2b25052926bc84f1e7.jpg",
    direction: "Avenida Sucre 456",
    longitud: -63.17755259336724,
    latitud: -17.749376838669896,
    telefono: "+591-2-9876543",
    weburl: "https://www.elparaisodelpan.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749376838669896,-63.17755259336724",
    driveurl: "https://drive.google.com/drive/folders/def456",
  ),
  Caseta(
    id: 3,
    name: "Pizzería Bella Italia",
    owner: "Giovanni Rossi",
    imagen:
        "https://i.pinimg.com/564x/e1/33/f4/e133f43422dc7cf82dcc5f3ffc3ddefa.jpg",
    direction: "Calle Aniceto Arce 789",
    longitud: -63.177213687523185,
    latitud: -17.749313802868954,
    telefono: "+591-2-3456789",
    weburl: "https://www.pizzeriabellaitalia.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749313802868954,-63.177213687523185",
    driveurl: "https://drive.google.com/drive/folders/ghi789",
  ),
  Caseta(
    id: 4,
    name: "La Parrilla del Sur",
    owner: "Juan Pérez",
    imagen:
        "https://i.pinimg.com/564x/7f/33/03/7f3303d75e3e360e58dd5a03c1c25c45.jpg",
    direction: "Avenida Hernando Siles 101",
    longitud: -63.177023102830745,
    latitud: -17.749199882692103,
    telefono: "+591-2-5678901",
    weburl: "https://www.laparrilladelsur.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749199882692103,-63.177023102830745",
    driveurl: "https://drive.google.com/drive/folders/jkl012",
  ),
  Caseta(
    id: 5,
    name: "El Rincón de los Tacos",
    owner: "Rosa Martínez",
    imagen:
        "https://i.pinimg.com/564x/0a/38/b7/0a38b75838c91b6745d5be609f5a9be1.jpg",
    direction: "Calle Junín 211",
    longitud: -63.1769441577071,
    latitud: -17.749290259371683,
    telefono: "+591-2-3456789",
    weburl: "https://www.elrincondelostacos.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749290259371683,-63.1769441577071",
    driveurl: "https://drive.google.com/drive/folders/mno345",
  ),
  Caseta(
    id: 6,
    name: "La Tetería",
    owner: "Ana Sánchez",
    imagen:
        "https://i.pinimg.com/564x/06/f9/a3/06f9a3235cbfed63b6fdcdd32d559086.jpg",
    direction: "Calle Ayacucho 313",
    longitud: -63.176843682095175,
    latitud: -17.74932595435021,
    telefono: "+591-2-6789012",
    weburl: "https://www.lateteria.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74932595435021,-63.176843682095175",
    driveurl: "https://drive.google.com/drive/folders/pqr678",
  ),
  Caseta(
    id: 7,
    name: "Frutería Frescura",
    owner: "Roberto Gómez",
    imagen:
        "https://i.pinimg.com/564x/04/f6/13/04f61391fef45259093d2113da5f2edb.jpg",
    direction: "Calle Chuquisaca 421",
    longitud: -63.17683251813831,
    latitud: -17.74891660087136,
    telefono: "+591-2-7890123",
    weburl: "https://www.fruteriafrescura.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74891660087136,-63.17683251813831",
    driveurl: "https://drive.google.com/drive/folders/stu901",
  ),
  Caseta(
    id: 8,
    name: "Parrillada El Fogón",
    owner: "Luis Ramírez",
    imagen:
        "https://i.pinimg.com/564x/3f/79/f5/3f79f5e744b1696724ac94d13dc6b547.jpg",
    direction: "Calle Libertad 789",
    longitud: -63.17712038873657,
    latitud: -17.74903811591552,
    telefono: "+591-2-7891234",
    weburl: "https://www.parrilladaelfogon.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74903811591552,-63.17712038873657",
    driveurl: "https://drive.google.com/drive/folders/uvw345",
  ),
  Caseta(
    id: 9,
    name: "Pastelería La Dulzura",
    owner: "Laura Gutiérrez",
    imagen:
        "https://i.pinimg.com/564x/3f/79/f5/3f79f5e744b1696724ac94d13dc6b547.jpg",
    direction: "Avenida Arce 456",
    longitud: -63.17664113601623,
    latitud: -17.74918393386069,
    telefono: "+591-2-4567890",
    weburl: "https://www.pastelerialadulzura.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74918393386069,-63.17664113601623",
    driveurl: "https://drive.google.com/drive/folders/xyz678",
  ),
  Caseta(
    id: 10,
    name: "Tienda de Ropa Fashion",
    owner: "Carlos Fernández",
    imagen:
        "https://i.pinimg.com/564x/6b/38/4d/6b384d9cbbecefda880ea86cdb7f94a3.jpg",
    direction: "Calle Murillo 321",
    longitud: -63.17656139346281,
    latitud: -17.749365446662644,
    telefono: "+591-2-5678901",
    weburl: "https://www.tiendaderopafashion.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749365446662644,-63.17656139346281",
    driveurl: "https://drive.google.com/drive/folders/abc789",
  ),
  Caseta(
    id: 11,
    name: "Librería El Sabio",
    owner: "Ana María Rodríguez",
    imagen:
        "https://i.pinimg.com/564x/59/22/d6/5922d619e7dd8145648eb81a532fdcef.jpg",
    direction: "Avenida Ballivián 123",
    longitud: -63.17610606349354,
    latitud: -17.749454304321752,
    telefono: "+591-2-6789012",
    weburl: "https://www.libreriaelsabio.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749454304321752,-63.17610606349354",
    driveurl: "https://drive.google.com/drive/folders/def901",
  ),
  Caseta(
    id: 12,
    name: "Florería La Primavera",
    owner: "Mónica Soto",
    imagen:
        "https://i.pinimg.com/564x/e7/b6/1d/e7b61d04ea6cb7b86ebbe4ddfd440087.jpg",
    direction: "Calle 20 de Octubre 789",
    longitud: -63.17610207636967,
    latitud: -17.749280386289694,
    telefono: "+591-2-3456789",
    weburl: "https://www.florerialaprimavera.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749280386289694,-63.17610207636967",
    driveurl: "https://drive.google.com/drive/folders/ghi012",
  ),
  Caseta(
    id: 13,
    name: "Casa de Modas Glamour",
    owner: "Sofía Herrera",
    imagen:
        "https://i.pinimg.com/564x/8e/db/d7/8edbd7dced0d0afdabb99c1dcc37e2cb.jpg",
    direction: "Avenida Camacho 456",
    longitud: -63.1764696895212,
    latitud: -17.748920398216203,
    telefono: "+591-2-7890123",
    weburl: "https://www.casademodasglamour.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748920398216203,-63.1764696895212",
    driveurl: "https://drive.google.com/drive/folders/jkl234",
  ),
  Caseta(
    id: 14,
    name: "Joyas Brillantes",
    owner: "Ricardo Fernández",
    imagen:
        "https://i.pinimg.com/564x/84/6e/20/846e20187f0bc17cdb3a0c7a6aefa29e.jpg",
    direction: "Calle Yanacocha 789",
    longitud: -63.17634529114454,
    latitud: -17.748924955031782,
    telefono: "+591-2-9012345",
    weburl: "https://www.joyasbrillantes.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748924955031782,-63.17634529114454",
    driveurl: "https://drive.google.com/drive/folders/mno345",
  ),
  Caseta(
    id: 15,
    name: "Panadería La Esquina",
    owner: "María López",
    imagen:
        "https://i.pinimg.com/564x/47/4c/41/474c41293e6d8663f213efd1b37cf65a.jpg",
    direction: "Calle Sucre esquina Bolívar",
    longitud: -63.17640031350345,
    latitud: -17.749030521226945,
    telefono: "+591-2-3456789",
    weburl: "https://www.panaderialaesquina.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749030521226945,-63.17640031350345",
    driveurl: "https://drive.google.com/drive/folders/pqr456",
  ),
  Caseta(
    id: 16,
    name: "Cafetería El Encanto",
    owner: "Juan Pérez",
    imagen:
        "https://i.pinimg.com/564x/3f/2b/10/3f2b1079be3bf710c1b53ba4f58df0ae.jpg",
    direction: "Avenida Ballivián 789",
    longitud: -63.17600479045971,
    latitud: -17.748977358402627,
    telefono: "+591-2-5678901",
    weburl: "https://www.cafeteriaelencanto.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748977358402627,-63.17600479045971",
    driveurl: "https://drive.google.com/drive/folders/stu567",
  ),
  Caseta(
    id: 17,
    name: "Tienda de Artículos Deportivos Sportmania",
    owner: "Pedro Rodríguez",
    imagen:
        "https://i.pinimg.com/564x/20/48/0f/20480ff3c226420e81854d7b38e47238.jpg",
    direction: "Calle Murillo 321",
    longitud: -63.176035890053875,
    latitud: -17.748806477788982,
    telefono: "+591-2-6789012",
    weburl: "https://www.sportmania.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748806477788982,-63.176035890053875",
    driveurl: "https://drive.google.com/drive/folders/vwx789",
  ),
  Caseta(
    id: 18,
    name: "Farmacia La Salud",
    owner: "Andrea Gómez",
    imagen:
        "https://i.pinimg.com/736x/8b/6d/92/8b6d921c92bb8ad564981ad38f317a91.jpg",
    direction: "Calle Mercado 456",
    longitud: -63.17577353706721,
    latitud: -17.748904449360758,
    telefono: "+591-2-7890123",
    weburl: "https://www.farmacialasalud.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748904449360758,-63.17577353706721",
    driveurl: "https://drive.google.com/drive/folders/yz012",
  ),
  Caseta(
    id: 19,
    name: "Centro de Estética Belleza Total",
    owner: "Carolina Martínez",
    imagen:
        "https://i.pinimg.com/736x/a8/82/cd/a882cd791bc9eff7c6d28063ba81c0a6.jpg",
    direction: "Avenida Hernando Siles 789",
    longitud: -63.17571293272405,
    latitud: -17.74924165343261,
    telefono: "+591-2-9012345",
    weburl: "https://www.bellezatotal.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74924165343261,-63.17571293272405",
    driveurl: "https://drive.google.com/drive/folders/abc123",
  ),
  Caseta(
    id: 20,
    name: "Restaurante Sabor Criollo",
    owner: "Jorge Pérez",
    imagen:
        "https://i.pinimg.com/564x/50/49/5b/50495bd472007b48e3dffe9744e18482.jpg",
    direction: "Calle Colón 321",
    longitud: -63.17548566644744,
    latitud: -17.749007737158284,
    telefono: "+591-2-2345678",
    weburl: "https://www.saborcriollo.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749007737158284,-63.17548566644744",
    driveurl: "https://drive.google.com/drive/folders/def234",
  ),
  Caseta(
    id: 21,
    name: "Bar El Refugio",
    owner: "Roberto García",
    imagen:
        "https://i.pinimg.com/564x/c4/94/8b/c4948b2b81f582b01d9bfe3d4b9211da.jpg",
    direction: "Avenida Arce 456",
    longitud: -63.1753142199668,
    latitud: -17.748937106536403,
    telefono: "+591-2-3456789",
    weburl: "https://www.barelrefugio.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748937106536403,-63.1753142199668",
    driveurl: "https://drive.google.com/drive/folders/ghi345",
  ),
  Caseta(
    id: 22,
    name: "Tienda de Electrónica TecnoWorld",
    owner: "Diego Martínez",
    imagen:
        "https://i.pinimg.com/564x/3b/5d/59/3b5d59313ef98d7ee5dd975507094bfb.jpg",
    direction: "Calle 21 de Mayo 789",
    longitud: -63.17520497267448,
    latitud: -17.748842932330554,
    telefono: "+591-2-4567890",
    weburl: "https://www.tecnoworld.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748842932330554,-63.17520497267448",
    driveurl: "https://drive.google.com/drive/folders/jkl456",
  ),
  Caseta(
    id: 23,
    name: "Veterinaria Mascotas Felices",
    owner: "Laura González",
    imagen:
        "https://i.pinimg.com/564x/0a/50/e3/0a50e354e6a7d3225507509904e3b1be.jpg",
    direction: "Calle Murillo 123",
    longitud: -63.17518822673916,
    latitud: -17.74867129211825,
    telefono: "+591-2-5678901",
    weburl: "https://www.mascotasfelices.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74867129211825,-63.17518822673916",
    driveurl: "https://drive.google.com/drive/folders/mno567",
  ),
  Caseta(
    id: 24,
    name: "Librería Letras y Libros",
    owner: "Sofía Ramírez",
    imagen:
        "https://i.pinimg.com/564x/c4/94/8b/c4948b2b81f582b01d9bfe3d4b9211da.jpg",
    direction: "Calle Bolívar 321",
    longitud: -63.17552713257301,
    latitud: -17.748651545888574,
    telefono: "+591-2-6789012",
    weburl: "https://www.letrasylibros.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748651545888574,-63.17552713257301",
    driveurl: "https://drive.google.com/drive/folders/pqr678",
  ),
  Caseta(
    id: 25,
    name: "Florería Flores del Valle",
    owner: "Mariana Sánchez",
    imagen:
        "https://i.pinimg.com/564x/b8/1c/54/b81c542f7c879361b559c964af0f1f03.jpg",
    direction: "Avenida América 456",
    longitud: -63.17516749367639,
    latitud: -17.749018369722613,
    telefono: "+591-2-7890123",
    weburl: "https://www.floresdelvalle.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749018369722613,-63.17516749367639",
    driveurl: "https://drive.google.com/drive/folders/stu789",
  ),
];

List<Caseta> marcadoresCasetaVenturaMall = [
  Caseta(
    id: 1,
    name: "Café Central",
    owner: "María García",
    imagen:
        "https://i.pinimg.com/564x/a0/92/46/a09246cabd6b799bcb4729314f7ecb9b.jpg",
    direction: "Calle Bolívar 123",
    longitud: -63.20031844836133,
    latitud: -17.755415192091014,
    telefono: "+591-2-1234567",
    weburl: "https://www.cafecentral.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74887786793181,-63.17724478711718",
    driveurl: "https://drive.google.com/drive/folders/abc123",
  ),
  Caseta(
    id: 2,
    name: "El Paraíso del Pan",
    owner: "Pedro López",
    imagen:
        "https://i.pinimg.com/736x/3e/16/19/3e16198d869e7f2b25052926bc84f1e7.jpg",
    direction: "Avenida Sucre 456",
    longitud: -63.19945477711105,
    latitud: -17.75469228205774,
    telefono: "+591-2-9876543",
    weburl: "https://www.elparaisodelpan.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749376838669896,-63.17755259336724",
    driveurl: "https://drive.google.com/drive/folders/def456",
  ),
  Caseta(
    id: 3,
    name: "Pizzería Bella Italia",
    owner: "Giovanni Rossi",
    imagen:
        "https://i.pinimg.com/564x/e1/33/f4/e133f43422dc7cf82dcc5f3ffc3ddefa.jpg",
    direction: "Calle Aniceto Arce 789",
    longitud: -63.20008509619123,
    latitud: -17.754590103725594,
    telefono: "+591-2-3456789",
    weburl: "https://www.pizzeriabellaitalia.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749313802868954,-63.177213687523185",
    driveurl: "https://drive.google.com/drive/folders/ghi789",
  ),
  Caseta(
    id: 4,
    name: "La Parrilla del Sur",
    owner: "Juan Pérez",
    imagen:
        "https://i.pinimg.com/564x/7f/33/03/7f3303d75e3e360e58dd5a03c1c25c45.jpg",
    direction: "Avenida Hernando Siles 101",
    longitud: -63.20007436735581,
    latitud: -17.755213390644126,
    telefono: "+591-2-5678901",
    weburl: "https://www.laparrilladelsur.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749199882692103,-63.177023102830745",
    driveurl: "https://drive.google.com/drive/folders/jkl012",
  ),
  Caseta(
    id: 5,
    name: "El Rincón de los Tacos",
    owner: "Rosa Martínez",
    imagen:
        "https://i.pinimg.com/564x/0a/38/b7/0a38b75838c91b6745d5be609f5a9be1.jpg",
    direction: "Calle Junín 211",
    longitud: -63.19906585682754,
    latitud: -17.754367865651727,
    telefono: "+591-2-3456789",
    weburl: "https://www.elrincondelostacos.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749290259371683,-63.1769441577071",
    driveurl: "https://drive.google.com/drive/folders/mno345",
  ),
  Caseta(
    id: 6,
    name: "La Tetería",
    owner: "Ana Sánchez",
    imagen:
        "https://i.pinimg.com/564x/06/f9/a3/06f9a3235cbfed63b6fdcdd32d559086.jpg",
    direction: "Calle Ayacucho 313",
    longitud: -63.19997512562878,
    latitud: -17.754329548711844,
    telefono: "+591-2-6789012",
    weburl: "https://www.lateteria.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74932595435021,-63.176843682095175",
    driveurl: "https://drive.google.com/drive/folders/pqr678",
  ),
  Caseta(
    id: 7,
    name: "Frutería Frescura",
    owner: "Roberto Gómez",
    imagen:
        "https://i.pinimg.com/564x/04/f6/13/04f61391fef45259093d2113da5f2edb.jpg",
    direction: "Calle Chuquisaca 421",
    longitud: -63.199004166021325,
    latitud: -17.75404089418361,
    telefono: "+591-2-7890123",
    weburl: "https://www.fruteriafrescura.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74891660087136,-63.17683251813831",
    driveurl: "https://drive.google.com/drive/folders/stu901",
  ),
  Caseta(
    id: 8,
    name: "Parrillada El Fogón",
    owner: "Luis Ramírez",
    imagen:
        "https://i.pinimg.com/564x/3f/79/f5/3f79f5e744b1696724ac94d13dc6b547.jpg",
    direction: "Calle Libertad 789",
    longitud: -63.19949232803039,
    latitud: -17.753284770383495,
    telefono: "+591-2-7891234",
    weburl: "https://www.parrilladaelfogon.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74903811591552,-63.17712038873657",
    driveurl: "https://drive.google.com/drive/folders/uvw345",
  ),
  Caseta(
    id: 9,
    name: "Pastelería La Dulzura",
    owner: "Laura Gutiérrez",
    imagen:
        "https://i.pinimg.com/564x/3f/79/f5/3f79f5e744b1696724ac94d13dc6b547.jpg",
    direction: "Avenida Arce 456",
    longitud: -63.19914900529736,
    latitud: -17.75368326845576,
    telefono: "+591-2-4567890",
    weburl: "https://www.pastelerialadulzura.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74918393386069,-63.17664113601623",
    driveurl: "https://drive.google.com/drive/folders/xyz678",
  ),
  Caseta(
    id: 10,
    name: "Tienda de Ropa Fashion",
    owner: "Carlos Fernández",
    imagen:
        "https://i.pinimg.com/564x/6b/38/4d/6b384d9cbbecefda880ea86cdb7f94a3.jpg",
    direction: "Calle Murillo 321",
    longitud: -63.199728362409346,
    latitud: -17.753680713983762,
    telefono: "+591-2-5678901",
    weburl: "https://www.tiendaderopafashion.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749365446662644,-63.17656139346281",
    driveurl: "https://drive.google.com/drive/folders/abc789",
  ),
];

List<Caseta> marcadoresCasetaCCanoto = [
  Caseta(
    id: 1,
    name: "Florería La Primavera",
    owner: "Mónica Soto",
    imagen:
        "https://i.pinimg.com/564x/e7/b6/1d/e7b61d04ea6cb7b86ebbe4ddfd440087.jpg",
    direction: "Calle 20 de Octubre 789",
    longitud: -63.18983758262379,
    latitud: -17.781120194839623,
    telefono: "+591-2-3456789",
    weburl: "https://www.florerialaprimavera.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749280386289694,-63.17610207636967",
    driveurl: "https://drive.google.com/drive/folders/ghi012",
  ),
  Caseta(
    id: 2,
    name: "Casa de Modas Glamour",
    owner: "Sofía Herrera",
    imagen:
        "https://i.pinimg.com/564x/8e/db/d7/8edbd7dced0d0afdabb99c1dcc37e2cb.jpg",
    direction: "Avenida Camacho 456",
    longitud: -63.1891438224713,
    latitud: -17.781118676174547,
    telefono: "+591-2-7890123",
    weburl: "https://www.casademodasglamour.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748920398216203,-63.1764696895212",
    driveurl: "https://drive.google.com/drive/folders/jkl234",
  ),
  Caseta(
    id: 3,
    name: "Joyas Brillantes",
    owner: "Ricardo Fernández",
    imagen:
        "https://i.pinimg.com/564x/84/6e/20/846e20187f0bc17cdb3a0c7a6aefa29e.jpg",
    direction: "Calle Yanacocha 789",
    longitud: -63.18975465037567,
    latitud: -17.781038186906795,
    telefono: "+591-2-9012345",
    weburl: "https://www.joyasbrillantes.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748924955031782,-63.17634529114454",
    driveurl: "https://drive.google.com/drive/folders/mno345",
  ),
  Caseta(
    id: 4,
    name: "Panadería La Esquina",
    owner: "María López",
    imagen:
        "https://i.pinimg.com/564x/47/4c/41/474c41293e6d8663f213efd1b37cf65a.jpg",
    direction: "Calle Sucre esquina Bolívar",
    longitud: -63.189261841439766,
    latitud: -17.78094706693726,
    telefono: "+591-2-3456789",
    weburl: "https://www.panaderialaesquina.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749030521226945,-63.17640031350345",
    driveurl: "https://drive.google.com/drive/folders/pqr456",
  ),
  Caseta(
    id: 5,
    name: "Cafetería El Encanto",
    owner: "Juan Pérez",
    imagen:
        "https://i.pinimg.com/564x/3f/2b/10/3f2b1079be3bf710c1b53ba4f58df0ae.jpg",
    direction: "Avenida Ballivián 789",
    longitud: -63.18915498642777,
    latitud: -17.780707117461837,
    telefono: "+591-2-5678901",
    weburl: "https://www.cafeteriaelencanto.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748977358402627,-63.17600479045971",
    driveurl: "https://drive.google.com/drive/folders/stu567",
  ),
  Caseta(
    id: 6,
    name: "Tienda de Artículos Deportivos Sportmania",
    owner: "Pedro Rodríguez",
    imagen:
        "https://i.pinimg.com/564x/20/48/0f/20480ff3c226420e81854d7b38e47238.jpg",
    direction: "Calle Murillo 321",
    longitud: -63.1893080921166,
    latitud: -17.780602329298695,
    telefono: "+591-2-6789012",
    weburl: "https://www.sportmania.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748806477788982,-63.176035890053875",
    driveurl: "https://drive.google.com/drive/folders/vwx789",
  ),
  Caseta(
    id: 7,
    name: "Farmacia La Salud",
    owner: "Andrea Gómez",
    imagen:
        "https://i.pinimg.com/736x/8b/6d/92/8b6d921c92bb8ad564981ad38f317a91.jpg",
    direction: "Calle Mercado 456",
    longitud: -63.18985512598396,
    latitud: -17.780451980957263,
    telefono: "+591-2-7890123",
    weburl: "https://www.farmacialasalud.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748904449360758,-63.17577353706721",
    driveurl: "https://drive.google.com/drive/folders/yz012",
  ),
  Caseta(
    id: 8,
    name: "Centro de Estética Belleza Total",
    owner: "Carolina Martínez",
    imagen:
        "https://i.pinimg.com/736x/a8/82/cd/a882cd791bc9eff7c6d28063ba81c0a6.jpg",
    direction: "Avenida Hernando Siles 789",
    longitud: -63.189729132760874,
    latitud: -17.78051576511757,
    telefono: "+591-2-9012345",
    weburl: "https://www.bellezatotal.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74924165343261,-63.17571293272405",
    driveurl: "https://drive.google.com/drive/folders/abc123",
  ),
  Caseta(
    id: 10,
    name: "Restaurante Sabor Criollo",
    owner: "Jorge Pérez",
    imagen:
        "https://i.pinimg.com/564x/50/49/5b/50495bd472007b48e3dffe9744e18482.jpg",
    direction: "Calle Colón 321",
    longitud: -63.18957762192296,
    latitud: 17.780388196774197,
    telefono: "+591-2-2345678",
    weburl: "https://www.saborcriollo.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.749007737158284,-63.17548566644744",
    driveurl: "https://drive.google.com/drive/folders/def234",
  ),
  Caseta(
    id: 11,
    name: "Bar El Refugio",
    owner: "Roberto García",
    imagen:
        "https://i.pinimg.com/564x/c4/94/8b/c4948b2b81f582b01d9bfe3d4b9211da.jpg",
    direction: "Avenida Arce 456",
    longitud: -63.189233134123114,
    latitud: -17.78045046228651,
    telefono: "+591-2-3456789",
    weburl: "https://www.barelrefugio.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748937106536403,-63.1753142199668",
    driveurl: "https://drive.google.com/drive/folders/ghi345",
  ),
  Caseta(
    id: 12,
    name: "Tienda de Electrónica TecnoWorld",
    owner: "Diego Martínez",
    imagen:
        "https://i.pinimg.com/564x/3b/5d/59/3b5d59313ef98d7ee5dd975507094bfb.jpg",
    direction: "Calle 21 de Mayo 789",
    longitud: -63.189375075855466,
    latitud: -17.78039882747295,
    telefono: "+591-2-4567890",
    weburl: "https://www.tecnoworld.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.748842932330554,-63.17520497267448",
    driveurl: "https://drive.google.com/drive/folders/jkl456",
  ),
  Caseta(
    id: 13,
    name: "Veterinaria Mascotas Felices",
    owner: "Laura González",
    imagen:
        "https://i.pinimg.com/564x/0a/50/e3/0a50e354e6a7d3225507509904e3b1be.jpg",
    direction: "Calle Murillo 123",
    longitud: -63.18929852301105,
    latitud: -17.780971365600344,
    telefono: "+591-2-5678901",
    weburl: "https://www.mascotasfelices.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.74867129211825,-63.17518822673916",
    driveurl: "https://drive.google.com/drive/folders/mno567",
  ),
];

List<Caseta> marcadoresCasetaCMaquito = [
  Caseta(
    id: 1,
    name: "Florería Flores del Valle",
    owner: "Mariana Sánchez",
    imagen:
        "https://i.pinimg.com/564x/b8/1c/54/b81c542f7c879361b559c964af0f1f03.jpg",
    direction: "Avenida América 456",
    longitud: -63.14873637715188,
    latitud: -17.790244889747893,
    telefono: "+591-2-7890123",
    weburl: "https://www.floresdelvalle.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.790244889747893,-63.14873637715188",
    driveurl: "https://drive.google.com/drive/folders/stu789",
  ),
  Caseta(
    id: 2,
    name: "Librería Letras y Libros",
    owner: "Sofía Ramírez",
    imagen:
        "https://i.pinimg.com/564x/c4/94/8b/c4948b2b81f582b01d9bfe3d4b9211da.jpg",
    direction: "Calle Bolívar 321",
    longitud: -63.148991186998686,
    latitud: -17.790312569398296,
    telefono: "+591-2-6789012",
    weburl: "https://www.letrasylibros.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.790312569398296,-63.148991186998686",
    driveurl: "https://drive.google.com/drive/folders/pqr678",
  ),
  Caseta(
    id: 3,
    name: "Veterinaria Mascotas Felices",
    owner: "Laura González",
    imagen:
        "https://i.pinimg.com/564x/0a/50/e3/0a50e354e6a7d3225507509904e3b1be.jpg",
    direction: "Calle Murillo 123",
    longitud: -63.148928155089216,
    latitud: -17.790270429241616,
    telefono: "+591-2-5678901",
    weburl: "https://www.mascotasfelices.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.790270429241616,-63.148928155089216",
    driveurl: "https://drive.google.com/drive/folders/mno567",
  ),
  Caseta(
    id: 4,
    name: "Tienda de Electrónica TecnoWorld",
    owner: "Diego Martínez",
    imagen:
        "https://i.pinimg.com/564x/3b/5d/59/3b5d59313ef98d7ee5dd975507094bfb.jpg",
    direction: "Calle 21 de Mayo 789",
    longitud: -63.148705531749364,
    latitud: -17.790511777277004,
    telefono: "+591-2-4567890",
    weburl: "https://www.tecnoworld.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.790511777277004,-63.148705531749364",
    driveurl: "https://drive.google.com/drive/folders/jkl456",
  ),
  Caseta(
    id: 5,
    name: "Panadería La Esquina",
    owner: "Carlos Gutiérrez",
    imagen:
        "https://i.pinimg.com/564x/18/32/f5/1832f54baa4584e0ea7277b1b248f1d8.jpg",
    direction: "Calle Sucre 567",
    longitud: -63.14893217840259,
    latitud: -17.79048879176388,
    telefono: "+591-2-3456789",
    weburl: "https://www.panaderialaesquina.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.79048879176388,-63.14893217840259",
    driveurl: "https://drive.google.com/drive/folders/uvw123",
  ),
  Caseta(
    id: 6,
    name: "Cafetería Aromas del Café",
    owner: "Ana María Rodríguez",
    imagen:
        "https://i.pinimg.com/564x/7a/f5/ee/7af5ee8a4bc9f9254edfca586bbbf40b.jpg",
    direction: "Avenida Libertad 987",
    longitud: -63.14871223727166,
    latitud: -17.79023467394938,
    telefono: "+591-2-2345678",
    weburl: "https://www.aromasdelcafe.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.79023467394938,-63.14871223727166",
    driveurl: "https://drive.google.com/drive/folders/xyz456",
  ),
  Caseta(
    id: 7,
    name: "Farmacia San Jorge",
    owner: "Roberto López",
    imagen:
        "https://i.pinimg.com/564x/32/76/ca/3276cac88dc72176c1736951c15211e5.jpg",
    direction: "Calle Junín 456",
    longitud: -63.148977775954116,
    latitud: -17.790298522680505,
    telefono: "+591-2-8901234",
    weburl: "https://www.farmaciasanjorge.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.790298522680505,-63.148977775954116",
    driveurl: "https://drive.google.com/drive/folders/abc789",
  ),
  Caseta(
    id: 8,
    name: "Peluquería Estilo y Belleza",
    owner: "María Fernández",
    imagen:
        "https://i.pinimg.com/564x/4f/92/87/4f9287c33d0d3efc19a9c9f267d7b3b3.jpg",
    direction: "Calle Ballivián 789",
    longitud: -63.148942907238236,
    latitud: -17.790435158888418,
    telefono: "+591-2-6789012",
    weburl: "https://www.estiloybelleza.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.790435158888418,-63.148942907238236",
    driveurl: "https://drive.google.com/drive/folders/def012",
  ),
  Caseta(
    id: 9,
    name: "Carnicería Don Pepe",
    owner: "Pedro Gómez",
    imagen:
        "https://i.pinimg.com/564x/8e/5d/6f/8e5d6f494dc38554de6c9c116b2f8b58.jpg",
    direction: "Calle Suárez 234",
    longitud: -63.14873645027832,
    latitud: -17.790458903701246,
    telefono: "+591-2-3456789",
    weburl: "https://www.carniceriadonpepe.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.790458903701246,-63.14873645027832",
    driveurl: "https://drive.google.com/drive/folders/ghi345",
  ),
  Caseta(
    id: 10,
    name: "Restaurante La Terraza",
    owner: "Luisa García",
    imagen:
        "https://i.pinimg.com/564x/5b/3e/9a/5b3e9a8f878cb090d8e8a2a0c50b7a06.jpg",
    direction: "Calle Campero 789",
    longitud: -63.14869822880129,
    latitud: -17.790507428678055,
    telefono: "+591-2-4567890",
    weburl: "https://www.laterraza.com",
    googleMapsurl:
        "https://maps.google.com/?q=-17.790507428678055,-63.14869822880129",
    driveurl: "https://drive.google.com/drive/folders/jkl456",
  ),
];
