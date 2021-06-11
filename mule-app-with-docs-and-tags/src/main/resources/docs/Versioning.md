Assets in Exchange use _semantic versioning_. Each version number has a major version, minor version, and patch version, separated by periods.

For example, version `1.2.3` has major version 1, minor version 2, and patch version 3.


## When to Change Version Numbers

Each time you change an asset, change the version number to indicate the type of change.

1) Always increase the major, minor, or patch version by adding one.

For example, increase from `1.2.9` to `1.2.10`, then to `1.2.11`.

2) Increase the patch version when you make a bug fix that is backward compatible.

For example, increase from `0.0.3` to `0.0.4`.

3) Increase the minor version and reset the patch version to zero when you add functionality that is backward compatible.

For example, increase from `0.2.4` to `0.3.0`.

4) Increase the major version and reset the minor and patch versions to zero when you make a change that is not backward compatible.

For example, increase from `7.3.5` to `8.0.0`.


## Unofficial Conventions

- Initial development usually uses a major component of zero, such as `0.y.z`.
- When the code is used in production, increase to a major component of one or higher, such as `1.0.0`.

## Minor Version Properties

Some asset properties and derived properties apply to a minor version. For example, a tag uploaded for version `1.2.3` of an asset is also applied to version `1.2.4`, because both have the same minor version `1.2`. Properties that apply to a minor version include the asset reviews, tags, and documentation.

## Version Agnostic Properties

Version agnostic properties apply to all versions of the asset. These properties are the asset’s icon, name, and description.

## See Also

- https://docs.mulesoft.com/exchange/to-change-raml-version
- https://semver.org/
