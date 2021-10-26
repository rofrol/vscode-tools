## vscode tools

Make vscode use correct nodejs version according from `.nvmrc` or `.node-version` using .

Underneath this tools run [fnm](https://github.com/Schniz/fnm) to set `nodejs` from `.nvmrc`.

It applies to running `npm`, `yarn` or `gulp` from `tasks.json` or integrated terminal in linux.

You may freely change it to use `nvm` instead of `fnm` or modifyt for integrated terminals on others OS-es.

PR-s welcomes.

## Why not engines and engine=strict?

Yarn ignores [`engine=strict`](https://docs.npmjs.com/cli/v7/using-npm/config#engine-strict).

Yarn ignores `preinstall` from package.json scripts.

And vscode [does not](https://github.com/microsoft/vscode/issues/102746#issuecomment-659940381) let you set `runtimeExecutable` in `tasks.json` like it does for `launch.json`.

## How to use it?

`fnm` will read `.nvmrc` to set wanted `nodejs` version.

Copy `.nvmrc` to your `projects`.

Copy `settings.json` to your `<project>/.vscode` directory. Modify paths accordingly in `settings.json`.

Task has to be of `shell` type. You can copy example `tasks.json` to your `<project>/.vscode`.
