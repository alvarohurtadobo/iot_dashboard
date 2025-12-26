Revisando archivos clave para preparar un resumen completo y preciso:


[8 tools called]


Resumen listo para copiar y pegar:

```markdown
# Migración de Endpoints a Clean Architecture - Guía de Implementación

## Contexto y Objetivo

Migrar endpoints existentes a la arquitectura Clean Architecture utilizada en este proyecto. Esta arquitectura separa responsabilidades en 3 capas: Presentation, Domain y Data, siguiendo el principio de dependencias invertidas donde las capas internas no dependen de las externas.

---

## Arquitectura: Clean Architecture (3 Capas)

### 1. Presentation Layer (`presentation/`)
- **Contenido**: BLoCs/Cubits, Widgets, Pages
- **Responsabilidad**: Manejar UI y estado
- **Regla**: Solo interactúa con Use Cases del Domain. Nunca accede directamente a repositorios.

### 2. Domain Layer (`domain/`)
- **Contenido**: 
  - Modelos del dominio (entities) creados con `freezed`
  - Interfaces de repositorios (`abstract class`)
  - Use Cases (lógica de negocio)
- **Responsabilidad**: Lógica de negocio pura
- **Regla**: NO tiene dependencias de otras capas. Es el núcleo de la aplicación.

### 3. Data Layer (`data/`)
- **Contenido**:
  - Implementaciones de repositorios
  - DataSources (interfaces y implementaciones)
  - DTOs (Data Transfer Objects) que representan el JSON de la API
  - Services (clientes HTTP con Retrofit)
- **Responsabilidad**: Acceso a datos (API, base de datos local, etc.)
- **Regla**: Implementa interfaces del Domain pero Domain no conoce Data.

---

## Flujo de Datos Completo

```
UI Event
  ↓
BLoC (Presentation)
  ↓ crea Domain Model con parámetros
Use Case (Domain)
  ↓ recibe Domain Model completo
Repository Implementation (Data)
  ↓ extrae parámetros del Domain Model y los pasa a DataSource
DataSource Interface (Data)
  ↓ define contrato (abstract class)
RemoteSource Implementation (Data)
  ↓ implementa DataSource, recibe parámetros y los pasa a Service
Service (Data)
  ↓ mapea parámetros a HTTP (@Query, @Path, @Body) con Retrofit
API Backend
  ↓ recibe request HTTP con query parameters
```

**⚠️ IMPORTANTE**: Cada capa debe recibir TODOS los parámetros necesarios y pasarlos a la siguiente. No omitir parámetros en ninguna capa.

---

## Estructura de Carpetas por Feature

```
packages/features/[feature_name]/
├── lib/src/
│   ├── [feature]/
│   │   ├── presentation/
│   │   │   ├── bloc/
│   │   │   │   └── [feature]_bloc/
│   │   │   │       ├── [feature]_bloc.dart
│   │   │   │       ├── [feature]_event.dart
│   │   │   │       └── [feature]_state.dart
│   │   │   ├── pages/
│   │   │   └── widgets/
│   │   ├── domain/
│   │   │   ├── model/
│   │   │   │   └── [feature]_model/
│   │   │   │       └── [feature]_model.dart (freezed)
│   │   │   ├── repository/
│   │   │   │   └── [feature]_repository.dart (interfaz abstracta)
│   │   │   └── usecase/
│   │   │       └── [action]_[feature]_usecase.dart
│   │   └── data/
│   │       ├── dto/
│   │       │   └── [feature]_response.dart (freezed + json_serializable)
│   │       ├── repository/
│   │       │   └── [feature]_repository_impl.dart
│   │       ├── source/
│   │       │   └── [feature]_source.dart (interfaz abstracta)
│   │       ├── source/
│   │       │   └── [feature]_remote_source.dart (implementación)
│   │       └── service/
│   │           └── [feature]_service.dart (Retrofit)
```

---

## Dependencias Necesarias en pubspec.yaml

### Dependencias principales:
```yaml
dependencies:
  core:
    path: ../../core
  dartz: 0.10.1                    # Either<L, R> para manejo de errores
  dio: 5.9.0                       # Cliente HTTP
  flutter:
    sdk: flutter
  flutter_bloc: 9.1.1              # State management (BLoC)
  freezed: 3.2.3                   # Inmutabilidad y union types
  freezed_annotation: 3.1.0        # Anotaciones para freezed
  get_it: 8.2.0                    # Service locator para DI
  injectable: 2.5.2                # Code generation para DI
  json_annotation: 4.9.0           # Anotaciones para JSON
  remote_client:
    path: ../../libraries/remote_client  # BaseRepository, BaseDataSource
  retrofit: 4.8.0                  # Generación de clientes HTTP

dev_dependencies:
  build_runner: 2.10.1             # Code generation runner
  flutter_test:
    sdk: flutter
  freezed: 3.2.3                   # Code generator para freezed
  injectable_generator: 2.9.0      # Generator para injectable
  json_serializable: 6.11.1        # Generator para JSON
  retrofit_generator: 10.1.1       # Generator para Retrofit
```

**NOTA**: En este proyecto se usan versiones fijas (sin `^`). No agregar `^` al versionar.

---

## Orden de Implementación (Bottom-Up)

### Paso 1: Service (Retrofit) - Data Layer
**Archivo**: `data/service/[feature]_service.dart`

```dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store/src/[feature]/data/dto/[feature]_response.dart';

part '[feature]_service.g.dart';

@singleton
@RestApi()
abstract class [Feature]Service {
  @factoryMethod
  factory [Feature]Service(@Named('app') Dio dio) = _[Feature]Service;

  @GET('/api/v1/[endpoint]')
  @addAccessTokenHeaderExtra  // Si requiere autenticación
  Future<[Feature]Response> search[Feature]({
    @Path('id') String? id,
    @Query('param1') String? param1,
    @Query('size') int? size,
    @Query('page') int? page,
    // ... todos los parámetros necesarios
  });
}
```

**Generar código**: `flutter pub run build_runner build --delete-conflicting-outputs`

---

### Paso 2: DTO (Data Transfer Object) - Data Layer
**Archivo**: `data/dto/[feature]_response.dart`

```dart
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remote_client/remote_client.dart';

part '[feature]_response.freezed.dart';
part '[feature]_response.g.dart';

@freezed
sealed class [Feature]Response 
    with _$[Feature]Response 
    implements BaseDtoResponse<List<[Domain]Model>> {
  const factory [Feature]Response({
    required PageResponse page,
    required List<[Item]Response> items,
    // ... campos del JSON de la API
  }) = _[Feature]Response;

  const [Feature]Response._();

  factory [Feature]Response.fromJson(Map<String, Object?> json) =>
      _$[Feature]ResponseFromJson(json);

  @override
  List<[Domain]Model> toDomainModel() {
    return items.map((e) => e.toDomainModel()).toList();
  }
}
```

**IMPORTANTE**: El DTO debe implementar `BaseDtoResponse<T>` donde `T` es el tipo del modelo del dominio que retornará.

---

### Paso 3: DataSource Interface - Data Layer
**Archivo**: `data/source/[feature]_source.dart`

```dart
import 'package:remote_client/remote_client.dart';
import 'package:store/src/[feature]/data/dto/[feature]_response.dart';

abstract class [Feature]DataSource extends BaseDataSource {
  Future<ApiResult<[Feature]Response>> search[Feature]({
    required String param1,
    String? param2,
    int? size,
    int? page,
    // ⚠️ IMPORTANTE: Incluir TODOS los parámetros necesarios
  });
}
```

---

### Paso 4: RemoteSource Implementation - Data Layer
**Archivo**: `data/source/[feature]_remote_source.dart`

```dart
import 'package:injectable/injectable.dart';
import 'package:remote_client/remote_client.dart';
import 'package:store/src/[feature]/data/dto/[feature]_response.dart';
import 'package:store/src/[feature]/data/service/[feature]_service.dart';
import 'package:store/src/[feature]/data/source/[feature]_source.dart';

@Named('[feature]Remote')
@Injectable(as: [Feature]DataSource)
class [Feature]RemoteSource extends [Feature]DataSource {
  [Feature]RemoteSource(this._[feature]Service);

  final [Feature]Service _[feature]Service;

  @override
  Future<ApiResult<[Feature]Response>> search[Feature]({
    required String param1,
    String? param2,
    int? size,
    int? page,
  }) async {
    return executeRequest(
      function: () => _[feature]Service.search[Feature](
        param1: param1,
        param2: param2,
        size: size,  // ⚠️ Pasar TODOS los parámetros
        page: page,
      ),
    );
  }
}
```

---

### Paso 5: Domain Model - Domain Layer
**Archivo**: `domain/model/[feature]_model/[feature]_model.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part '[feature]_model.freezed.dart';
part '[feature]_model.g.dart';

@freezed
sealed class [Feature]Model with _$[Feature]Model {
  const factory [Feature]Model({
    required String id,
    required String name,
    int? pageSize,  // ⚠️ Incluir TODOS los parámetros de búsqueda
    String? query,
    // ... campos del modelo de dominio
  }) = _[Feature]Model;

  factory [Feature]Model.fromJson(Map<String, dynamic> json) =>
      _$[Feature]ModelFromJson(json);
}
```

---

### Paso 6: Repository Interface - Domain Layer
**Archivo**: `domain/repository/[feature]_repository.dart`

```dart
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:store/src/[feature]/domain/model/[feature]_model/[feature]_model.dart';

abstract class [Feature]Repository {
  Future<Either<DomainException, List<[Domain]Model>>> search[Feature](
    [Feature]Model searchData  // Recibe modelo completo del dominio
  );
}
```

---

### Paso 7: Repository Implementation - Data Layer
**Archivo**: `data/repository/[feature]_repository_impl.dart`

```dart
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:remote_client/remote_client.dart';
import 'package:store/src/[feature]/data/dto/[feature]_response.dart';
import 'package:store/src/[feature]/data/source/[feature]_source.dart';
import 'package:store/src/[feature]/domain/model/[feature]_model/[feature]_model.dart';
import 'package:store/src/[feature]/domain/repository/[feature]_repository.dart';

@Injectable(as: [Feature]Repository)
class [Feature]RepositoryImpl 
    extends BaseRepository 
    implements [Feature]Repository {
  [Feature]RepositoryImpl(@Named('[feature]Remote') this._remoteSource);

  final [Feature]DataSource _remoteSource;

  @override
  Future<Either<DomainException, List<[Domain]Model>>> search[Feature](
    [Feature]Model searchData,
  ) async {
    return executeDataSource<[Feature]Response, List<[Domain]Model>>(
      function: () => _remoteSource.search[Feature](
        param1: searchData.id,
        param2: searchData.query,
        size: searchData.pageSize,  // ⚠️ Extraer TODOS los parámetros del modelo
        page: searchData.page,
      ),
    );
  }
}
```

**⚠️ CRÍTICO**: El Repository debe extraer TODOS los parámetros del Domain Model y pasarlos al DataSource. Si falta un parámetro, no llegará al API.

---

### Paso 8: Use Case - Domain Layer
**Archivo**: `domain/usecase/search_[feature]_usecase.dart`

```dart
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store/src/[feature]/domain/model/[feature]_model/[feature]_model.dart';
import 'package:store/src/[feature]/domain/repository/[feature]_repository.dart';

@injectable
class Search[Feature]UseCase {
  Search[Feature]UseCase(this._repository);

  final [Feature]Repository _repository;

  Future<Either<DomainException, List<[Domain]Model>>> execute({
    required [Feature]Model searchData,  // Recibe modelo completo
  }) async {
    final result = await _repository.search[Feature](searchData);
    
    return result.fold(
      Left.new,
      (list) {
        // Opcional: Transformar/agrupar datos según lógica de negocio
        return Right(list);
      },
    );
  }
}
```

---

### Paso 9: BLoC - Presentation Layer
**Archivo**: `presentation/bloc/[feature]_bloc/[feature]_bloc.dart`

```dart
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:store/src/[feature]/domain/model/[feature]_model/[feature]_model.dart';
import 'package:store/src/[feature]/domain/usecase/search_[feature]_usecase.dart';

part '[feature]_bloc.freezed.dart';
part '[feature]_event.dart';
part '[feature]_state.dart';

typedef [Feature]State = ResultState<List<[Domain]Model>>;

@injectable
class [Feature]Bloc extends Bloc<[Feature]Event, [Feature]State> {
  [Feature]Bloc(this._search[Feature]UseCase) : super(const [Feature]State.initial()) {
    on<_Search>(_onSearch);
  }

  final Search[Feature]UseCase _search[Feature]UseCase;

  Future<void> _onSearch(_Search event, Emitter<[Feature]State> emit) async {
    emit(const [Feature]State.loading());

    final result = await _search[Feature]UseCase.execute(
      searchData: [Feature]Model(
        id: event.id,
        query: event.query,
        pageSize: 1000,  // ⚠️ Construir modelo completo con TODOS los parámetros
      ),
    );

    result.fold(
      (error) => emit([Feature]State.error(error: error)),
      (data) => emit([Feature]State.data(data: data)),
    );
  }
}
```

---

### Paso 10: Dependency Injection Setup

**Archivo**: `di/[feature]_injection.dart`

```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:store/src/di/[feature]_injection.config.dart';

@InjectableInit(
  initializerName: 'init[Feature]',
  preferRelativeImports: true,
  asExtension: false,
)
void configure[Feature]Dependencies(GetIt getIt) => init[Feature](getIt);
```

**Llamar en el initializer del feature**:
```dart
configure[Feature]Dependencies(coreLocator);
```

**Generar código**: `flutter pub run build_runner build --delete-conflicting-outputs`

---

## Checklist de Verificación

### ✅ Verificación de Propagación de Parámetros
- [ ] El BLoC construye el Domain Model con TODOS los parámetros necesarios
- [ ] El Use Case recibe el Domain Model completo
- [ ] El Repository extrae TODOS los parámetros del Domain Model
- [ ] El DataSource Interface define TODOS los parámetros en su método
- [ ] El RemoteSource recibe y pasa TODOS los parámetros al Service
- [ ] El Service mapea TODOS los parámetros a HTTP (@Query, @Path, etc.)

### ✅ Verificación de Arquitectura
- [ ] Domain Layer NO tiene dependencias de Data Layer
- [ ] Presentation Layer solo usa Use Cases, nunca Repositories
- [ ] Data Layer implementa interfaces del Domain
- [ ] Todos los archivos usan `@injectable` o `@Injectable` correctamente

### ✅ Verificación de Código Generado
- [ ] Ejecutar `build_runner` para generar:
  - Archivos `.freezed.dart` (modelos)
  - Archivos `.g.dart` (JSON serialization, Retrofit)
  - Archivos `.config.dart` (Injectable)

### ✅ Verificación de Tests
- [ ] Test del Repository verifica que se pasan TODOS los parámetros
- [ ] Test del RemoteSource verifica que se pasan TODOS los parámetros
- [ ] Tests usan Fake classes en lugar de mocks cuando sea posible

---

## Patrones y Convenciones Importantes

1. **BaseRepository**: Todos los repositorios extienden `BaseRepository` y usan `executeDataSource()` para manejo de errores.

2. **BaseDataSource**: Todas las fuentes de datos extienden `BaseDataSource` y usan `executeRequest()` para manejo de HTTP.

3. **ApiResult<T>**: En Data Layer, se usa `ApiResult<T>` para envolver respuestas HTTP (success/failure).

4. **Either<L, R>**: En Domain Layer, se usa `Either<DomainException, T>` para manejo de errores.

5. **ResultState<T>**: En Presentation Layer, se usa `ResultState<T>` para estados asíncronos (Initial, Loading, Data, Error).

6. **Freezed**: Todos los modelos y DTOs usan `@freezed` para inmutabilidad.

7. **Injectable**: Todas las clases inyectables usan `@injectable` (lowercase) para clases normales o `@Injectable` (uppercase) para implementaciones de interfaces.

---

## Ejemplo de Error Común a Evitar

**❌ INCORRECTO - Parámetro faltante en Repository:**
```dart
// Repository NO extrae pageSize
_remoteSource.searchFeature(
  id: searchData.id,
  query: searchData.query,
  // ❌ Falta: size: searchData.pageSize
);
```

**✅ CORRECTO - Todos los parámetros pasados:**
```dart
// Repository extrae TODOS los parámetros
_remoteSource.searchFeature(
  id: searchData.id,
  query: searchData.query,
  size: searchData.pageSize,  // ✅ Incluido
  page: searchData.page,      // ✅ Incluido
);
```

---

## Comandos Útiles

```bash
# Generar código (freezed, json_serializable, retrofit, injectable)
flutter pub run build_runner build --delete-conflicting-outputs

# Solo generar código de un paquete específico
cd packages/features/[feature_name]
flutter pub run build_runner build --delete-conflicting-outputs

# Limpiar y regenerar
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs

# Ejecutar tests
flutter test
```

---

## Recursos de Referencia

- **Ejemplo completo**: Ver `packages/features/store/lib/src/category_products/` como referencia
- **Base classes**: `packages/libraries/remote_client/lib/src/repository/`
- **Documentación**: `docs/rules.md`

---

## Notas Finales

1. **Siempre verificar que TODOS los parámetros se propaguen** desde el BLoC hasta el Service.
2. **El Domain Layer es el núcleo**: No debe conocer nada sobre HTTP, JSON, o frameworks.
3. **Las dependencias fluyen hacia adentro**: Las capas externas dependen de las internas, nunca al revés.
4. **Usar tipos del dominio en interfaces**: Los repositorios retornan `Either<DomainException, DomainModel>`, no DTOs.
5. **Tests primero**: Crear tests para verificar la propagación de parámetros en Repository y RemoteSource.
```

Este resumen está listo para copiar y pegar. Incluye:
- Explicación de la arquitectura
- Flujo de datos completo
- Estructura de carpetas
- Dependencias necesarias
- Orden de implementación paso a paso
- Ejemplos de código para cada capa
- Checklist de verificación
- Patrones y convenciones
- Errores comunes a evitar
- Comandos útiles

¿Quieres que agregue algo más o aclarar alguna sección?