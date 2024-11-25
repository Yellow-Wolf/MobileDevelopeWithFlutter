import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const Icon(
          Icons.music_note_outlined,
          color: Colors.white,
        ),
        title: const Text(
          'MelodyMix',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black54,
        elevation: 4,
      ),
      body: Stack(
        children: [
          // перечислите ваши виджеты с соответствующими позициями
          Container(
              padding:
                  EdgeInsets.only(bottom: 23, left: 25, right: 25, top: 34),
              child: container_previe()),
          Container(
              padding: EdgeInsets.all(25),
              child: wrap_iconprof_favorite()), // виджет с иконками
          Container(
              padding:
                  EdgeInsets.only(bottom: 34, left: 25, right: 25, top: 100),
              child: myWidget()),
          Container(child:

          container_with_row())
        ],
      ),
    );
  }
// ClipRRect( borderRadius: BorderRadius.circular(50.0),
  Widget myWidget() {
    return Wrap(
      spacing: 15,
      children: [
        Padding(
           padding: EdgeInsets.only(bottom: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Stack(
              children: [
                // Применение затемнения к изображению
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.srcOver),
                  child: AspectRatio(
                    aspectRatio: 12 / 8,
                    child: Image.network(
                        'https://i.ytimg.com/vi/KJqNzErAmVc/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AG2CIAC0AWKAgwIABABGDIgEyh_MA8=&rs=AOn4CLC5Bc8QzVJ3DtZ2AV1FV2jHcv-Csg',
                        fit: BoxFit.cover),
                  ),
                ),
                // Текст и иконка
                Positioned(
                  left: 25,
                  bottom: 75,
                  child: Text('Discover New Music', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),),
                ),
                Positioned(
                  left: 25,
                  bottom: 50,
                  child: Text('Trending Now', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),),
                ),
                Positioned(
                  right: 25,
                  bottom: 25,
                  child: Material(
                    //borderRadius: BorderRadius.circular(80.5), // Указание радиуса для закругления кнопки,
                    color: Colors.transparent,
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Ink(
                        decoration: ShapeDecoration(
                          color: Colors.purpleAccent,//.withOpacity(0.1),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.headset, color: Colors.white, size: 35,),
                          onPressed: () {
                            // Обработчик нажатия кнопки
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Stack(
              children: [
                // Применение затемнения к изображению
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.srcOver),
                  child: //AspectRatio(
                    //aspectRatio: 12 / 8,
                    //child:
                    SizedBox(width: 170, height: 150,
                      child: Image.network(
                          'https://inteq-bau.ru/wp-content/uploads/e/5/1/e51d8cbc0eed7032d57783a78a34a13a.jpeg',
                          fit: BoxFit.cover),
                    ),
                  ),
                //),
                // Текст и иконка
                const Positioned(
                  left: 20,
                  bottom: 60,
                  child: Text('Workout Beats', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),),
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Stack(
            children: [
              // Применение затемнения к изображению
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.srcOver),
                child: //AspectRatio(
                //aspectRatio: 12 / 8,
                //child:
                SizedBox(width: 170, height: 150,
                  child: Image.network(
                      'https://images11.domashnyochag.ru/upload/img_cache/30d/30d32a8902600e194fd26055ff3cec48_cropped_1332x888.jpg',
                      fit: BoxFit.cover),
                ),
              ),
              //),
              // Текст и иконка
              const Positioned(
                left: 33,
                bottom: 60,
                child: Text('Throwback', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Stack(
            children: [
              // Применение затемнения к изображению
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.srcOver),
                child: //AspectRatio(
                //aspectRatio: 12 / 8,
                //child:
                SizedBox(width: 170, height: 150,
                  child: Image.network(
                      'https://img2.fonwall.ru/o/xz/plitvickie-ozera-nacionalnyy-park-plitvickie-ozera-plitvice-lakes-national-park-djyf.jpg',
                      fit: BoxFit.cover),
                ),
              ),
              //),
              // Текст и иконка
              const Positioned(
                left: 20,
                bottom: 60,
                child: Text('Chill Out Zone', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Stack(
            children: [
              // Применение затемнения к изображению
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.srcOver),
                child: //AspectRatio(
                //aspectRatio: 12 / 8,
                //child:
                SizedBox(width: 170, height: 150,
                  child: Image.network(
                      'https://mobimg.b-cdn.net/v3/fetch/08/08bb88bf60f5653460a16704e2c74b4d.jpeg',
                      fit: BoxFit.cover),
                ),
              ),
              //),
              // Текст и иконка
              const Positioned(
                left: 44,
                bottom: 60,
                child: Text('Acoustic', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Wrap wrap_iconprof_favorite() {
    return Wrap(
      alignment: WrapAlignment.end,
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  // действие при нажатии на кнопку
                },
                icon: Icon(Icons.favorite, color: Colors.white, size: 34),
              ),
              SizedBox(width: 7),
              InkWell(
                onTap: () {
                  // действие при нажатии на кнопку
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://sun9-25.userapi.com/impg/GvDa2Hi8vGn1ytGryewTPU5-mzOQ5Z_cbnCAcA/a-M1D3NrZ1w.jpg?size=523x682&quality=95&sign=d8f87a18cb182e6215df1e1fc3e1fbd9&type=album'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text container_previe() {
    return
        /*******************--[focus here 🧐]--*******************/
        Text('Recommended for You',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700));

    /*******************--[focus here 🧐]--*******************/
  }
}

//return container_previe();


Align container_with_row() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container
      (
      height: 50,
      //padding: EdgeInsets.only(bottom: 16),
      color: Colors.white10,
      child: Row(

        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.home, color: Colors.white, size: 40,),
          Icon(Icons.keyboard_voice, color: Colors.white, size: 40,), // not message
          Icon(Icons.library_music, color: Colors.white, size: 40,),
          Icon(Icons.reorder, color: Colors.white, size: 40,),
        ],
      ),
    ),
  );
}