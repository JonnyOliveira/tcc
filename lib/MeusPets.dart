import 'package:flutter/src/material/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:projeto_app/NovoPet.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';
import 'PerfilPet.dart';

class MeusPets extends StatefulWidget {
  const MeusPets({Key key}) : super(key: key);

  @override
  State<MeusPets> createState() => _MeusPetsState();
}

class _MeusPetsState extends State<MeusPets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarPadrao('Meus Pets'),
      drawer: DrawerPadrao(),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      /*child: Text("MEUS PETS",
                        style:
                            TextStyle(fontSize: 30, color: Color(0xff777777)),
                      ),*/
                    ),
                  ],
                ),

                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("images/bolt.png"),
                      ),
                      title: Text("Bolt"),
                    )
                ),

                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("images/floki.png"),
                      ),
                      title: Text("Floki"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PerfilPet()
                            )
                        );
                      },
                    )
                ),

                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("images/jorge.png"),
                        ),
                        title: Text("Jorge")
                    )
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NovoPet())
            );
          },
        child: const Icon(Icons.add),
          backgroundColor: Color(0xff478ca0)
      ),
    );
  }
}
