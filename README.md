# ZrLog Docker Legacy

本仓库已经降级为历史参考仓库。ZrLog 的 Dockerfile、Docker 镜像构建和正式发布流程已经合并回主仓库 `94fzb/zrlog`，后续不要再从本仓库发布镜像或维护版本号。

## 当前维护位置

- Dockerfile: <https://github.com/94fzb/zrlog/tree/main/docker>
- 正式镜像发布 workflow: <https://github.com/94fzb/zrlog/blob/main/.github/workflows/docker-release-publish.yml>
- 预览镜像发布 workflow: <https://github.com/94fzb/zrlog/blob/main/.github/workflows/docker-preview-publish.yml>
- 发布规则说明: <https://github.com/94fzb/zrlog/blob/main/doc/release.md>

## 推荐使用方式

新用户直接使用主仓发布的镜像：

```shell
docker run -p 8080:8080 -v "$(pwd)/conf:/opt/zrlog/conf" zrlog/zrlog
```

需要修改 Docker 构建逻辑时，请在主仓 `zrlog/docker` 下修改，并通过主仓 workflow 验证。

## 本仓库保留内容

本仓库仅保留早期独立 Docker 仓库的脚本和 Dockerfile，方便追溯历史实现：

- `Dockerfile`
- `preview/Dockerfile`
- `build.sh`
- `install.sh`
- `start.sh`
- `stop.sh`
- `upgrade.sh`
- `config/base-config.properties`

这些文件不再作为正式发布来源。旧的自动版本更新、release 镜像发布和 preview 镜像发布 workflow 已移除，避免和主仓 Docker 发布链路重复。
