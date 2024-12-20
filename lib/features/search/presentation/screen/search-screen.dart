import 'package:animate_do/animate_do.dart';
import 'package:app_sw1final/blocs/options-map/options_map_bloc.dart';
import 'package:app_sw1final/blocs/product/product_bloc.dart';
import 'package:app_sw1final/config/constants/colors.const.dart';
import 'package:app_sw1final/config/constants/constantes.dart';
import 'package:app_sw1final/data/data-auxiliar.dart';
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
    final optionsMapBloc = BlocProvider.of<OptionsMapBloc>(context);

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
          StyledProductView(),
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

class StyledProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final optionsMapBloc = BlocProvider.of<OptionsMapBloc>(context);
    return Positioned(
      top: size.height * 0.19,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: size.width,
        height: size.height * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: optionsMapBloc.state.options == MapOptions.product
            ? _buildProductGrid(context, size)
            : _buildLocationList(context, size),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context, Size size) {
    final productBloc = BlocProvider.of<ProductBloc>(context, listen: true);
    final optionsMapBloc = BlocProvider.of<OptionsMapBloc>(context);

    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 20, bottom: size.height * 0.1),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemCount: productBloc.state.viewClientProductos.length,
      itemBuilder: (context, index) {
        final producto = productBloc.state.viewClientProductos[index];
        return FadeInUp(
          duration: Duration(milliseconds: 200 + (index * 100)),
          child: GestureDetector(
            onTap: () {
              optionsMapBloc.add(const OnChangeSearchPageMap(false));
              productBloc.add(OnChangeProduct(producto));
              Navigator.pushNamed(context, '/product');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(producto.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.all(8),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "${producto.discount}% OFF",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            producto.name,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Text(
                                '\$${producto.price}',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLocationList(BuildContext context, Size size) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 16),
      itemCount: marcadoresCasetaCCBrisas.length,
      itemBuilder: (context, index) {
        final caseta = marcadoresCasetaCCBrisas[index];
        return FadeInLeft(
          duration: Duration(milliseconds: 200 + (index * 100)),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kCuartoColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.location_on,
                  color: kCuartoColor,
                  size: 24,
                ),
              ),
              title: Text(
                caseta.name,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                caseta.direction,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  FontAwesomeIcons.locationArrow,
                  color: kPrimaryColor,
                  size: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
