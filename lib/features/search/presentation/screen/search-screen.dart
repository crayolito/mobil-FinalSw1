import 'package:animate_do/animate_do.dart';
import 'package:app_sw1final/blocs/options-map/options_map_bloc.dart';
import 'package:app_sw1final/blocs/product/product_bloc.dart';
import 'package:app_sw1final/config/constants/constantes.dart';
import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:app_sw1final/features/product/domain/entities/producto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> categoriasProductos = [
      ' All ',
      'Tecnologia',
      'Hogar',
      'Moda',
      'Deportes',
      'Juguetes',
      'Salud',
      'Belleza',
      'Libros',
      'Mascotas',
      'Herramientas',
      'Jardineria',
      'Muebles',
      'Decoracion',
      'Oficina',
      'Escolar',
    ];

    List<String> generoProductos = [
      ' All ',
      'Hombre',
      'Mujer',
      'Unisex',
    ];

    List<String> descuentoProductos = [
      ' All ',
      ' Con ',
      ' Sin ',
    ];

    TextEditingController _controller = TextEditingController();
    // _controller.value = TextEditingValue(text: 'Buscar ...');
    final productBloc = BlocProvider.of<ProductBloc>(context, listen: true);
    final TextStyle bodySmall = Theme.of(context).textTheme.bodySmall!;
    final TextStyle displayLarge = Theme.of(context).textTheme.displayLarge!;
    final TextStyle displayMedium = Theme.of(context).textTheme.displayMedium!;
    final TextStyle displaySmall = Theme.of(context).textTheme.displaySmall!;
    final optionsMapBloc = BlocProvider.of<OptionsMapBloc>(context);
    const decoration = BoxDecoration(
        color: Colors.white,
        border: Border(
            top: BorderSide(
          color: Colors.black,
          width: 4,
        )),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ));
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //Navigation Bar
          Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.025,
                ),
                width: size.width,
                height: size.height * 0.16,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        FontAwesomeIcons.arrowLeft,
                        size: 35,
                        color: Color(0xFF00A541),
                      ),
                    ),
                    Text(
                      optionsMapBloc.state.options == MapOptions.product
                          ? 'Productos'
                          : 'Tiendas',
                      style: displayLarge,
                    ),
                    optionsMapBloc.state.options == MapOptions.product
                        ? GestureDetector(
                            onTap: () {
                              showAdaptiveDialog(
                                  context: context,
                                  useSafeArea: true,
                                  builder: (context) {
                                    return FadeInUp(
                                      delay: const Duration(milliseconds: 500),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.3046),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.025),
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                              )),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        size.height * 0.012),
                                                height: size.height * .03,
                                                child: Container(
                                                  width: size.width * .15,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: size.height * .08,
                                                color: Colors.white,
                                                child: Text(
                                                  'Filtros',
                                                  style: displayLarge,
                                                ),
                                              ),
                                              //Separador
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: size.height * .004,
                                                    bottom: size.height * 0.03),
                                                height: size.height * .0015,
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                              ),
                                              // Categorias Productos
                                              Container(
                                                height: size.height * .14,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Categorias",
                                                        style: bodySmall,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: size.height * .1,
                                                      width: size.width,
                                                      child:
                                                          SingleChildScrollView(
                                                        physics:
                                                            const BouncingScrollPhysics(),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          children: [
                                                            ...categoriasProductos
                                                                .map(
                                                                    (categoria) {
                                                              return Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  right:
                                                                      size.width *
                                                                          0.03,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 3,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                child: Text(
                                                                  categoria,
                                                                  style:
                                                                      displayMedium,
                                                                ),
                                                              );
                                                            })
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              // Genero Productos
                                              Container(
                                                height: size.height * .135,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Genero",
                                                        style: bodySmall,
                                                      ),
                                                    ),
                                                    Container(
                                                      height:
                                                          size.height * 0.09,
                                                      width: size.width,
                                                      child:
                                                          SingleChildScrollView(
                                                        physics:
                                                            const BouncingScrollPhysics(),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          children: [
                                                            ...generoProductos
                                                                .map((genero) {
                                                              return Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  right:
                                                                      size.width *
                                                                          0.03,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 3,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                child: Text(
                                                                  genero,
                                                                  style:
                                                                      displayMedium,
                                                                ),
                                                              );
                                                            })
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              // Descuento Productos
                                              Container(
                                                height: size.height * .12,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Descuento",
                                                        style: bodySmall,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: size.height * .08,
                                                      width: size.width,
                                                      child:
                                                          SingleChildScrollView(
                                                        physics:
                                                            const BouncingScrollPhysics(),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          children: [
                                                            ...descuentoProductos
                                                                .map(
                                                                    (descuento) {
                                                              return Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  right:
                                                                      size.width *
                                                                          0.03,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 3,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                child: Text(
                                                                  descuento,
                                                                  style:
                                                                      displayMedium,
                                                                ),
                                                              );
                                                            })
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              // Separador
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: size.height * .004,
                                                    bottom: size.height * 0.02),
                                                height: size.height * .0015,
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                              ),
                                              // Botones
                                              Container(
                                                width: size.width,
                                                height: size.height * .08,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Container(
                                                      width: size.width * .35,
                                                      height: size.height * .06,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 5,
                                                            blurRadius: 7,
                                                            offset:
                                                                const Offset(
                                                                    0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Aplicar',
                                                          style: bodySmall,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: size.width * .35,
                                                      height: size.height * .06,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 5,
                                                            blurRadius: 7,
                                                            offset:
                                                                const Offset(
                                                                    0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Reset',
                                                          style: bodySmall,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Icon(FontAwesomeIcons.sliders,
                                size: 35, color: const Color(0xFF00A541)),
                          )
                        : SizedBox(
                            width: size.width * 0.09,
                          ),
                  ],
                ),
              )),
          // Search Result
          Positioned(
              top: size.height * 0.16,
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: optionsMapBloc.state.options == MapOptions.product
                          ? size.height * 0
                          : size.height * 0.069),
                  margin: EdgeInsets.only(
                    top: optionsMapBloc.state.options == MapOptions.product
                        ? size.height * 0.05
                        : size.height * 0.005,
                  ),
                  width: size.width,
                  height: size.height * 0.9,
                  color: Colors.white,
                  child: optionsMapBloc.state.options == MapOptions.product
                      ? GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount:
                              productBloc.state.viewClientProductos.length,
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.1,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: size.height * 0.39,
                            childAspectRatio: size.width * 0.05,
                          ),
                          itemBuilder: (context, index) {
                            // READ: AQUI ES DONDE TRAIGO TODOS LOS PRODUCTOS
                            Producto producto =
                                productBloc.state.viewClientProductos[index];
                            return FadeInLeft(
                              child: GestureDetector(
                                onTap: () {
                                  optionsMapBloc
                                      .add(const OnChangeSearchPageMap(false));
                                  Navigator.pushNamed(context, '/product');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02,
                                      vertical: size.height * 0.015),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.025,
                                      vertical: size.height * 0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: (size.height * 0.37) * 0.63,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(producto.image),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                (size.height * 0.37) * 0.01),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            producto.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: displayMedium,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                (size.height * 0.37) * 0.01),
                                        child: Row(
                                          children: [
                                            Text(
                                              '\$${producto.price}',
                                              style: displayMedium,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      size.width * 0.02),
                                              width: size.width * 0.01,
                                              height: size.height * 0.03,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  right: BorderSide(
                                                    color: Color(0xFF00A541),
                                                    width: 4,
                                                  ),
                                                  left: BorderSide(
                                                    color: Colors.black,
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "%${producto.discount}",
                                              style: bodySmall,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: marcadoresCasetaCCBrisas.length,
                          itemBuilder: (context, index) {
                            // READ : DEBO CAMBIAR POR EL VECTOR DEL COMERCIAL SELECCIONADO DE TRABAJO
                            Caseta caseta = marcadoresCasetaCCBrisas[index];
                            return GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: size.height * 0.085,
                                width: size.width,
                                child: Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.085,
                                      width: size.width * 0.23,
                                      child: Center(
                                        child: Container(
                                          height: size.height * 0.75,
                                          width: size.width * 0.11,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            size: 30,
                                            color: Colors.black,
                                            shadows: shadowPP,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: size.height * 0.085,
                                      width: size.width * 0.77,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: size.height * 0.01),
                                            width: size.width * 0.65,
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(caseta.name,
                                                      style: displayMedium,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(caseta.direction,
                                                      style: GoogleFonts.anta(
                                                          fontSize: size.width *
                                                              0.055,
                                                          color: Colors.black
                                                              .withOpacity(0.4),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: size.width * 0.015),
                                            child: Icon(
                                              FontAwesomeIcons.locationArrow,
                                              color: Colors.black,
                                              shadows: shadowPPN3,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }))),
          // Search Bar
          Positioned(
              top: size.height * 0.12,
              right: size.width * 0.05,
              left: size.width * 0.05,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                height: size.height * 0.075,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 35,
                      color: Colors.black,
                      shadows: shadowPP,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: size.width * 0.01),
                      width: size.width * 0.661,
                      child: TextFormField(
                        controller: _controller,
                        style: bodySmall,
                        decoration: InputDecoration(
                          hintStyle: bodySmall,
                          hintText: 'Buscar ...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (optionsMapBloc.state.options ==
                            MapOptions.product) {
                          Navigator.pushNamed(context, '/camera');
                        } else {
                          _controller.clear();
                        }
                      },
                      child: Icon(
                        optionsMapBloc.state.options == MapOptions.product
                            ? Icons.camera_alt_outlined
                            : Icons.cancel_outlined,
                        size: 31,
                        color: Colors.black,
                        shadows: shadowPP,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
