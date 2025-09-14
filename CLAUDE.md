# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

QRADM is a Ruby on Rails 6.1.4 application for managing events, groups, activities, sanctions, and extra points in a camp/event setting. The application includes both a web interface and a mobile API, with QR code generation for group management.

## Development Commands

### Docker Development (Primary Method)
```bash
# First time setup
docker-compose build
docker-compose up
# In a new terminal:
docker-compose exec web bash
rails db:create
rails db:migrate
rails db:seed

# Regular development
docker-compose up
# Stop with Ctrl+C
```

### Direct Rails Commands (when inside container)
```bash
rails server                    # Start server
rails console                  # Rails console
rails db:migrate               # Run migrations
rails db:seed                  # Seed database
rails db:reset                 # Reset database
rake                           # Run all tests
```

### Frontend Assets
```bash
yarn install                   # Install JavaScript dependencies
bin/webpack                    # Compile assets
bin/webpack-dev-server         # Development asset server
```

## Application Architecture

### Core Models and Relationships
- **Event**: Top-level container for camps/events
- **Group**: Teams/groups within an event (has QR code generation)
- **Person**: Individual participants belonging to groups
- **User**: Authentication and authorization (Devise-based)
- **Activity**: Tasks/activities that groups can complete for points
- **Sanction**: Penalty points that can be applied to groups
- **ExtraPoint**: Bonus points that can be awarded to groups
- **Parameter**: System configuration values

### Key Model Features
- Groups use `protokoll` gem for auto-generated codes (pattern: `GROUP%y%m#####`)
- Activities and People also use protokoll for code generation
- Groups calculate total scores: `activities - sanctions + extra_points`
- Category system based on total points (ORO, PLATA, BRONCE, MADERA)
- QR code generation for groups using `rqrcode` gem

### API Structure
Mobile API is organized under `/api/v1/mobile/` namespace with:
- **AuthController**: User authentication (sign_up, log_in, log_out)
- **EventsController**: Event listing
- **GroupsController**: Group management and QR scanning
- **ActivityController**: Activity management and assignments
- **ExtraPointController**: Extra point management
- **SanctionController**: Sanction management

### Authentication
- Web: Devise-based authentication with custom registrations controller
- Mobile API: Token-based authentication using `app_token` or email lookup
- API uses `HTTP_CODE` header for user identification

### Key Gems
- `devise`: Authentication
- `grape`: API framework (though controllers use Rails API)
- `grape-active_model_serializers`: API serialization
- `pg_search`: Search functionality
- `protokoll`: Auto-generated codes
- `rqrcode`: QR code generation
- `rack-cors`: CORS handling for API

### Database
- PostgreSQL 9.6.2 (via Docker)
- Timezone: America/La_Paz
- Locale: Spanish (es)

### Development Environment
- Ruby 2.7.5
- Node.js 14.x
- Yarn for JavaScript dependencies
- Webpacker 5.0 for asset compilation
- Bootstrap 4.3.1 for styling

### Import/Export Features
- Groups support CSV import/export functionality
- CSV uses semicolon (`;`) as separator
- Import creates both Group and User records

### Services Available
- Web application: http://localhost:3200
- Database: PostgreSQL on port 5432
- pgAdmin: http://localhost:8080 (postgres@linuxhint.com / 12345678)