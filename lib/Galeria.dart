import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'Home.dart';
import 'MeusPets.dart';
import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class Galeria extends StatefulWidget {
  final picker = ImagePicker();

  @override
  _GaleriaState createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {

  int activeIndex = 0;
  final imageList = [
    "https://static.nationalgeographicbrasil.com/files/styles/image_3200/public/01-cat-questions-nationalgeographic_1228126.jpg?w=1600&h=900",
    "https://www.dicaspetz.com.br/wp-content/uploads/2020/03/matatabi-gato.jpg",
    "https://conteudo.imguol.com.br/c/entretenimento/88/2021/01/04/focinho-de-gato-1609773650657_v2_450x253.jpg",
    "https://static1.patasdacasa.com.br/articles/9/24/49/@/10735-curiosidades-sobre-gatos-os-felinos-sao-articles_media_mobile-2.jpg",
  ];

  File _imagem;

  //
  Future _recuperarImagem(bool daCamera) async {
    File image;
   // File imagemSelecionada;
    if( daCamera ){//camera
      image = (await widget.picker.pickImage(source: ImageSource.camera)) as File;
      //ImagePicker.pickImage(source: ImageSource.camera);
    }else{//galeria
      image = (await widget.picker.pickImage(source: ImageSource.gallery)) as File;
    }

   setState(() {
      _imagem = image;
    });

  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPadrao('Galeria'),
        drawer: DrawerPadrao(),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: CarouselSlider.builder(
                      itemCount: imageList.length,
                      itemBuilder: (context, index, realIndex) {
                        final image = imageList[index];

                        return buildImage(image, index);
                      },
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.50,
                        //autoPlay: true,
                        viewportFraction: 0.9,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  buildIndicator(),
                ],
              )
          )
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      height: 200,
                      color: Colors.white,
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[

                              ListTile(
                                leading: Icon(
                                  Icons.camera_alt,
                                  color: Color(0xff478ca0),
                                ),
                                title: Text(
                                  "Câmera",
                                ),
                                onTap: () {
                                  _recuperarImagem(true);
                                },
                              ),

                              ListTile(
                                leading: Icon(
                                  Icons.photo,
                                  color: Color(0xff478ca0),
                                ),
                                title: Text(
                                  "Galeria",
                                ),
                                onTap: () {
                                  _recuperarImagem(false);
                                },
                              ),

                              _imagem == null
                                  ? Container()
                                  : Image.file(_imagem)
                            ],
                          ),
                      ),
                    );
                },
              );

          },
          child: const Icon(Icons.add),
          backgroundColor: Color(0xff478ca0)
        ),

    );
  }

  Widget buildImage(String image, int index) => Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0)
    ),
    margin: EdgeInsets.symmetric(horizontal: 2),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        image,
        fit: BoxFit.cover,
      )
    )
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: imageList.length,
    effect: ScrollingDotsEffect(
      dotWidth: 10,
      dotHeight: 10,
      activeDotColor: Color(0xff478ca0),
      dotColor: Colors.black12
    ),
  );

}

