import 'package:flutter/material.dart';
import 'package:gs/providers/eletroposto_provider.dart';
import 'package:provider/provider.dart';

class EletropostoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eletropostos Próximos')),
      body: Consumer<EletropostoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.eletropostos.length,
              itemBuilder: (context, index) {
                final eletroposto = provider.eletropostos[index];
                return ListTile(
                  title: Text(eletroposto.nome),
                  subtitle: Text(
                      '${eletroposto.endereco}\n${eletroposto.telefone}\nConectores: ${eletroposto.conectores.join(', ')}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
