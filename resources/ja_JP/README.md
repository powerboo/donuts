[English](https://github.com/powerboo/donuts/blob/main/README.md) | [日本語](https://github.com/powerboo/donuts/blob/main/resources/ja_JP/README.md)

Focus domain modeling and UI.

# モチベーション

- ドメイン駆動設計におけるレイヤードアーキテクチャボイラープレートを生成できます
- entity を書いたら repository,factory,application_service を生成します
- 生成したコードは自身のプロジェクトに合わせて拡張できるようにする予定です

- ドメイン駆動設計のいいところと悪いところ(面倒なところ)
- いいところ
  - ビジネスにとって大事なドメイン知識をそのまま記述できる
  - コードの保守を行いやすくなる
- 面倒なところ
  - ボイラープレートが多い
    - repository
    - factory
    - application_service
- Repository や factory,application_service はドメインの Entity (aggregate_root)を操作するものです。

- ならば Entity から生成すればいいのでは？というのが本ライブラリの出発点です。

  - 例えば Entity を復元したり、追加したり削除したりする
  - repository の find,all,delete,save, factory の create など
  - あとは Entity のメソッドを実行するところがあればいい

- donuts を使うことで Entity や Value object のモデリングに集中できるようになります

実際のシステム開発で大事なところは下記の二つだと考えています

1. UI
2. データモデリング

これらを繋ぐコードを書くのは退屈です。だから donuts で自動化します

### コード例

定義

```dart
// aggregate_root

```

生成されたコード

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

# How to use

## install

```sh

```

## Run the generator

## generated class

生成されたボイラープレートは以下の通り。
ddd + レイヤードアーキテクチャを採用している

- factory
- factory_impl
- repository
- repository_impl
- in_memory_repository_impl
- application_service
- list_state
- single_state
- list_view
- detail_view
- create_modal

# Roadmap

- Extension generated class.生成されたクラスは拡張することができます
- generate interface for [method_to_swagger_yaml](https://pub.dev/packages/method_to_swagger_yaml)
