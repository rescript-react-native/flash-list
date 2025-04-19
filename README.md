# `@rescript-react-native/flash-list`

[![Build Status](https://github.com/rescript-react-native/flash-list/workflows/Build/badge.svg)](https://github.com/rescript-react-native/flash-list/actions)
[![Version](https://img.shields.io/npm/v/@rescript-react-native/flash-list.svg)](https://www.npmjs.com/@rescript-react-native/flash-list)
[![ReScript Forum](https://img.shields.io/discourse/posts?color=e6484f&label=ReScript%20Forum&server=https%3A%2F%2Fforum.rescript-lang.org)](https://forum.rescript-lang.org/)

[ReScript](https://rescript-lang.org) bindings for
[`flash-list`](https://github.com/Shopify/flash-list).

Exposed as `FlashList` module.

`@rescript-react-native/flash-list` X.y.\* means it's compatible with
`@shopify/flash-list` X.y.\*

## Installation

When
[`@shopify/flash-list`](https://github.com/Shopify/flash-list)
is properly installed & configured by following their installation instructions,
you can install the bindings:

```console
npm install @rescript-react-native/flash-list
# or
yarn add @rescript-react-native/flash-list
```

`@rescript-react-native/flash-list` should be added to `bs-dependencies` in your
`rescript.json`:

```diff
{
  //...
  "bs-dependencies": [
    "@rescript/react",
    "rescript-react-native",
    // ...
+    "@rescript-react-native/flash-list"
  ],
  //...
}
```

## Usage

### Methods

#### `<FlashList>`

```rescript
open ReactNative;

@react.component
let make = () => {
  <FlashList
    data={[{"id": "1", "name": "Foo"}]}
    keyExtractor={(item, _) => item["id"]}
    renderItem={({item}) =>
      <View>
        <Text> {item["name"]->React.string} </Text>
      </View>}
  />
}
```

---

## Changelog

Check the [changelog](./CHANGELOG.md) for more informations about recent
releases.

---

## Contribute

Read the
[contribution guidelines](https://github.com/rescript-react-native/.github/blob/master/CONTRIBUTING.md)
before contributing.

## Code of Conduct

We want this community to be friendly and respectful to each other. Please read
[our full code of conduct](https://github.com/rescript-react-native/.github/blob/master/CODE_OF_CONDUCT.md)
so that you can understand what actions will and will not be tolerated.
