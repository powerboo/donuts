[English](https://github.com/powerboo/donuts/blob/main/packages/donuts/README.md) | [日本語](https://github.com/powerboo/donuts/blob/main/resources/ja_JP/README.md)

<p align="center">
  <img src="https://github.com/powerboo/donuts/raw/main/resources/icon/donuts.png" width="200">
</p>

Focus on domain modeling and UI.

- You can generate a layered architecture boilerplate for Domain-Driven Design.
- Once you have written the `entity`, you can generate the `repository`, `factory`, and `application service`.
- The generated code will be extensible to suit your project.

# Motivation

- Domain-Driven design is a Good Practice. But Domain-Driven design has good points and boring stuff points.

- **Good Point**

  - Can be written directly from domain knowledge that is important to the business
  - Code is easier to maintain etc.

- **Boring stuff Point**

  - Many boiler plates.for example `repository`, `factory`, and `application service`

- The `factory`, `repository`, and `application service` operate `entity`. Then, if `entity` can be defined, they can be generated.

### Code Example

define

```dart
// aggregate_root
```

generated code

```dart
// factory

```

<details>

<summary>detail</summary>

```dart
// repository

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

</details>

### Get Start

Set the target folder for the builder to `domain`
If you don't do this, the init build time will become very long. (Over 30 minutes~)

```yaml
targets:
  $default:
    builders:
      # ------------------------------------------------------------
      # factory
      # ------------------------------------------------------------
      donuts|abstractInterfaceFactoryBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|factoryImplBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|factoryProviderBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      # ------------------------------------------------------------
      # repository
      # ------------------------------------------------------------
      donuts|abstractInterfaceRepositoryBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|repositoryImplBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|inMemoryRepositoryImplBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|repositoryProviderBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|abstractInterfaceApiBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"

      # ------------------------------------------------------------
      # application service
      # ------------------------------------------------------------
      donuts|abstractInterfaceApplicationServiceBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|applicationServiceImplBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|applicationServiceProviderBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      # ------------------------------------------------------------
      # state
      # ------------------------------------------------------------
      donuts|listStateBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|singleStateBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      # ------------------------------------------------------------
      # view
      # ------------------------------------------------------------
      donuts|listViewBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|detailViewBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
      donuts|createModalBuilder:
        enabled: true
        generate_for:
          include:
            - "lib/domain/*"
            - "lib/domain/**/*"
```

### Generate list view router list

generate `GoRouter` routes navigate to ListView
[https://pub.dev/packages/annotation_indexer](https://pub.dev/packages/annotation_indexer)

# TODO

- [ ] Make any class usable within an extended `part of` file

- [ ] plan 1: Allow the specification of imports in the @AggregatorRoot annotation

- [ ] generate interface for [method_to_swagger_yaml](https://pub.dev/packages/method_to_swagger_yaml)

- [ ] Generate code using `riverpod` and `flutter_hooks` considering dependencies
- [ ] Allow injecting initial in-memory data from outside
- [ ] Optimize performance
  - [ ] Reduce the initial build time which takes more than 15 minutes
