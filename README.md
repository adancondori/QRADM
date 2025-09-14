# QRADM - Sistema de Gestión de Actividades de Campamentos

QRADM es una aplicación Ruby on Rails para gestionar eventos, grupos, actividades, sanciones y puntos extra en un entorno de campamentos. Incluye una interfaz web y una API móvil con generación de códigos QR para gestión de grupos.

## Tecnologías

- **Backend**: Ruby 2.7.5, Rails 6.1.4
- **Base de datos**: PostgreSQL 9.6.2
- **Frontend**: Bootstrap 4.3.1, Webpacker 5.0
- **Containerización**: Docker y Docker Compose
- **Autenticación**: Devise
- **APIs**: Grape (para endpoints móviles)

## Instalación y Configuración

### Primera vez (Setup completo)

1. **Clonar el repositorio**
   ```bash
   git clone <repository-url>
   cd QRADM
   ```

2. **Construir los contenedores**
   ```bash
   docker-compose build
   ```

3. **Levantar los servicios**
   ```bash
   docker-compose up -d
   ```

4. **Configurar la base de datos**
   ```bash
   # Crear las bases de datos
   docker-compose exec web rails db:create
   
   # Ejecutar migraciones
   docker-compose exec web rails db:migrate
   
   # Ejecutar seeds (crea usuario administrador)
   docker-compose exec web rails db:seed
   ```

5. **Instalar dependencias JavaScript**
   ```bash
   docker-compose exec web yarn install
   ```

6. **Compilar assets**
   ```bash
   docker-compose exec web bin/webpack
   ```

### Uso diario

```bash
# Iniciar la aplicación
docker-compose up

# Parar la aplicación
docker-compose down
```

## URLs y Accesos

- **Aplicación web**: http://localhost:3200
- **Base de datos PostgreSQL**: puerto 5432
- **pgAdmin**: http://localhost:8080
  - Email: postgres@linuxhint.com
  - Password: 12345678

## Comandos Útiles

### Desarrollo
```bash
# Acceder al contenedor web
docker-compose exec web bash

# Ver logs
docker-compose logs web

# Reiniciar servicios
docker-compose restart web

# Ejecutar migraciones
docker-compose exec web rails db:migrate

# Abrir consola de Rails
docker-compose exec web rails console

# Ejecutar tests
docker-compose exec web rails test
```

### Assets y Frontend
```bash
# Recompilar assets
docker-compose exec web bin/webpack

# Instalar dependencias JS
docker-compose exec web yarn install

# Precompilar assets para producción
docker-compose exec web rails assets:precompile
```

## Estructura del Proyecto

### Modelos Principales
- **Event**: Contenedor principal para campamentos/eventos
- **Group**: Equipos/grupos dentro de un evento (genera códigos QR)
- **Person**: Participantes individuales pertenecientes a grupos
- **User**: Autenticación y autorización (basado en Devise)
- **Activity**: Tareas/actividades que pueden completar los grupos
- **Sanction**: Puntos de penalización aplicables a grupos
- **ExtraPoint**: Puntos de bonificación otorgables a grupos
- **Parameter**: Valores de configuración del sistema

### API Móvil
La API está disponible bajo `/api/v1/mobile/` e incluye:
- Autenticación de usuarios
- Gestión de eventos y grupos
- Escaneo de códigos QR
- Gestión de actividades, sanciones y puntos extra

### Sistema de Puntuación
Los grupos acumulan puntos mediante:
- **Total = Actividades - Sanciones + Puntos Extra**
- Categorías basadas en puntos totales (ORO, PLATA, BRONCE, MADERA)

## Solución de Problemas Comunes

### Error de Bootstrap
Si encuentras errores relacionados con Bootstrap, ejecuta:
```bash
docker-compose exec web yarn install
docker-compose exec web bin/webpack
docker-compose restart web
```

### Error de Base de Datos
```bash
# Recrear base de datos
docker-compose exec web rails db:drop db:create db:migrate db:seed
```

### Problemas con Assets
```bash
# Limpiar y recompilar
docker-compose exec web rails assets:clobber
docker-compose exec web bin/webpack
```

## Desarrollo

### Agregar nuevas gemas
1. Editar `Gemfile`
2. Ejecutar: `docker-compose exec web bundle install`
3. Reconstruir imagen: `docker-compose build web`

### Agregar dependencias JavaScript
1. Ejecutar: `docker-compose exec web yarn add <package-name>`
2. Recompilar: `docker-compose exec web bin/webpack`

## Deployment

Para producción, consultar los scripts de deployment:
- `./run.sh bash`
- `/deployment/docker/compose/deployment/deploy.sh s100`