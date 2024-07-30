import 'package:animate_do/animate_do.dart';
import 'package:app_sw1final/blocs/options-map/options_map_bloc.dart';
import 'package:app_sw1final/blocs/product/product_bloc.dart';
import 'package:app_sw1final/config/constants/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarSearch extends StatelessWidget {
  const BarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final displayLarge = Theme.of(context).textTheme.displayLarge;
    final productBloc = BlocProvider.of<ProductBloc>(context, listen: true);

    final optionsMapBloc =
        BlocProvider.of<OptionsMapBloc>(context, listen: true);

    int factorial(int numero) {
      int resultado = 1;
      if (numero == 0) {
        return resultado;
      }
      for (var i = numero; i > 0; i--) {
        resultado = resultado * i;
      }
      return resultado;
    }

    String primerSerie(int numero) {
      String resultado = "";
      int init = 1;
      for (var i = 0; i < numero; i++) {
        int aux = 0;
        if (init == 4) {
          init++;
        }
        aux = factorial(init);
        resultado = resultado + "${aux} ";
        init++;
      }
      return resultado;
    }

    String segundaSerie(int numero) {
      String resultado = "";
      int init = 8;
      for (var i = 0; i < numero; i++) {
        resultado = resultado + "${init} ";
        init = init * 2;
      }
      return resultado;
    }

    String funcionPrincipal() {
      String resultado = "";
      resultado = primerSerie(5) + segundaSerie(4);
      resultado = resultado + "120";
      return resultado;
    }

    return SafeArea(
      child: FadeInDown(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              optionsMapBloc.add(const OnChangeSearchPageMap(true));
              productBloc.add(OnProcessGetProducts());
              Navigator.pushNamed(context, '/search');
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: size.width,
              height: 52,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.65),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    shadows: shadowPPN2,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      optionsMapBloc.state.options == MapOptions.product
                          ? 'Producto...'
                          : 'Tienda ...',
                      style: displayLarge,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
