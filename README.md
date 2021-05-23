# Hugo Extended Docker Image
<img src="https://github.com/movative/hugo-extended-docker/blob/main/hugo.png" alt="HUGO Icon" align="left" height="80" width="80" vspace="6"/>

[![license](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/movative/platformio-core-docker/blob/main/LICENSE)
[![](https://images.microbadger.com/badges/image/movative/hugo-extended.svg)](https://microbadger.com/images/movative/hugo-extended "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/movative/hugo-extended.svg)](https://microbadger.com/images/movative/hugo-extended "Get your own version badge on microbadger.com")

[Hugo](https://gohugo.io/) is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites fun again.<br><br>

### Continuous Deployment
This Docker image also comes with:
- npm
- yarn
- and pre installed npm packages:
    -  postcss-cli
    -  autoprefixer

So you're Hugo Site works with SASS support out of the box.

You can use this image to automatically build your Static Hugo Website with [gitlab pages](https://docs.gitlab.com/ee/user/project/pages/).
Just create the following .gitlab-ci.yml in the hugo folder:
```
image: movative/hugo-extended
variables:
    GIT_SUBMODULE_STRATEGY: recursive
test:
    script:
        - hugo
    except:
        - master
pages:
    script:
        - hugo
    artifacts:
        paths:
            - public
    only:
	    - master
```
