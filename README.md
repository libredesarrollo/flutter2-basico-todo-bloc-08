# TodoApp BLoC - Gestión de Tareas en Flutter

Este es un proyecto de ejemplo que demuestra el uso del patrón **BLoC (Business Logic Component)** para la gestión del estado y **Sembast** como base de datos NoSQL persistente en una aplicación de Flutter.

## Características

- **Arquitectura Limpia**: Separación de la lógica de negocio, la interfaz de usuario y la persistencia de datos.
- **Patrón BLoC**: Implementación de Streams y StreamControllers para manejar el flujo de datos de forma asíncrona sin depender de librerías externas.
- **Persistencia Local**: Uso de Sembast para almacenar las tareas de forma local en el dispositivo.
- **Operaciones CRUD**: Crear, leer, actualizar y eliminar tareas de forma reactiva.
- **Gestión de Prioridades**: Permite asignar una prioridad y fecha límite a cada tarea.

## Tecnologías Utilizadas

- [Flutter](https://flutter.dev/) - Framework de UI de Google.
- [Sembast](https://pub.dev/packages/sembast) - Base de datos NoSQL persistente para Dart/Flutter.
- [Path Provider](https://pub.dev/packages/path_provider) - Para encontrar ubicaciones comunes en el sistema de archivos.

## Recursos Adicionales

Para profundizar en el desarrollo de aplicaciones con Flutter, componentes avanzados y animaciones, puedes consultar el siguiente libro:

👉 **[Componentes y Animaciones en Flutter](https://www.desarrollolibre.net/libros/componentes-y-animaciones-en-flutter)**

## Configuración y Ejecución

1. Asegúrate de tener instalado el SDK de Flutter.
2. Clona este repositorio o descarga el código fuente.
3. En la terminal, navega hasta la raíz del proyecto y ejecuta:
   ```bash
   flutter pub get
   ```
4. Conecta un dispositivo o inicia un emulador y ejecuta:
   ```bash
   flutter run
   ```

---
Desarrollado como parte del aprendizaje de patrones de diseño y persistencia en Flutter.
