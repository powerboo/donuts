[English](https://github.com/powerboo/donuts/blob/main/packages/donuts/README.md) | [日本語](https://github.com/powerboo/donuts/blob/main/resources/ja_JP/README.md)

Focus domain modeling and UI.

- You can generate a layered architecture boilerplate for domain-driven design
- Once you have written the entity, you can generate the repository, factory, and application_service.
- The generated code will be extensible to suit your project(now develop)

# Motivation

- Domain-Driven Design is a Good Practice. But Domain-driven design has good point and boring stuff point.

- **Good Point**
  - Can be written directly from domain knowledge that is important to the business
  - Code is easier to maintain etc.
- **Boring stuff Point**

  - Many boiler plates
    - ex.
      - repository
      - factory
      - application_service

- Entity operate by factory, repository, application_service.

### Code Example

define

```dart
// aggregate_root
```

generated code

```dart
// factory

// factory_impl

// repository

// repository_impl

// in_memory_repository_impl

// application_service

// list_state

// single_state

// list view

// detail view

// create modal
```

# Roadmap

- Extension generated class
- generate interface for [method_to_swagger_yaml](https://pub.dev/packages/method_to_swagger_yaml)
