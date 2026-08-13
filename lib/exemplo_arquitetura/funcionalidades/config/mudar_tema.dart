import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/temas/controlador_tema.dart';
import '../../core/temas/fabrica_temas.dart';

class MudarTema extends StatelessWidget {
  const MudarTema({super.key});

  @override
  Widget build(BuildContext context) {
    final controlador = context.read<ControladorTema>();//Provider
    //final controlador = Modular.read<ControladorTema>();//MobX
    final colors = Theme.of(context).colorScheme;

    return Drawer(
      child: Container(
        color: colors.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colors.primary,
                    colors.primaryContainer,
                  ],
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Personalização',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Modo de Tema',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            _SeletorModoTema(controller: controlador),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Tema / Marca',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            _SeletorTema(controller: controlador),
          ],
        ),
      ),
    );
  }
}

class _SeletorTema extends StatelessWidget {
  final ControladorTema controller;

  const _SeletorTema({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppThemeType.values.map((type) {
        final selected = controller.themeType == type;

        Color color;
        String label;

        switch (type) {
          case AppThemeType.govBr:
            color = Colors.green;
            label = 'Gov.br';
            break;
          case AppThemeType.suap:
            color = Colors.orange;
            label = 'SUAP';
            break;
          default:
            color = Colors.blue;
            label = 'Padrão';
        }

        return GestureDetector(
          onTap: () => controller.setThemeType(type),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: selected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceVariant,
            ),
            child: Row(
              children: [
                CircleAvatar(backgroundColor: color),
                const SizedBox(width: 12),
                Expanded(child: Text(label)),
                if (selected)
                  Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SeletorModoTema extends StatelessWidget {
  final ControladorTema controller;

  const _SeletorModoTema({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ThemeMode.values.map((mode) {
        final selected = controller.themeMode == mode;

        IconData icon;
        String label;

        switch (mode) {
          case ThemeMode.light:
            icon = Icons.light_mode;
            label = 'Claro';
            break;
          case ThemeMode.dark:
            icon = Icons.dark_mode;
            label = 'Escuro';
            break;
          default:
            icon = Icons.phone_android;
            label = 'Sistema';
        }

        return GestureDetector(
          onTap: () => controller.setThemeMode(mode),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: selected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(icon),
                Text(label),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}



/*class MudarTema extends StatelessWidget {
  const MudarTema({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControladorTema>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Modo de Tema'),

        DropdownButton<ThemeMode>(
          value: controller.themeMode,
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('Sistema'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Claro'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Escuro'),
            ),
          ],
          onChanged: (mode) {
            if (mode != null) {
              controller.setThemeMode(mode);
            }
          },
        ),

        const SizedBox(height: 20),

        const Text('Tema / Marca'),

        DropdownButton<AppThemeType>(
          value: controller.themeType,
          items: const [
            DropdownMenuItem(
              value: AppThemeType.padrao,
              child: Text('Padrão'),
            ),
            DropdownMenuItem(
              value: AppThemeType.govBr,
              child: Text('Gov.br'),
            ),
            DropdownMenuItem(
              value: AppThemeType.suap,
              child: Text('SUAP'),
            ),
          ],
          onChanged: (type) {
            if (type != null) {
              controller.setThemeType(type);
            }
          },
        ),
      ],
    );
  }
}*/