# Hugo Extended Docker Image

[![license](https://img.shields.io/badge/license-MIT-green.svg)](https://gitlab.com/movative/hugo-extended/-/blob/master/LICENSE)
[![pipeline status](https://gitlab.com/prvt-ah/hugo-extended/badges/master/pipeline.svg)](https://gitlab.com/prvt-ah/hugo-extended/-/commits/master)
[![](https://images.microbadger.com/badges/image/movative/hugo-extended.svg)](https://microbadger.com/images/movative/hugo-extended "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/movative/hugo-extended.svg)](https://microbadger.com/images/movative/hugo-extended "Get your own version badge on microbadger.com")

[Hugo](https://gohugo.io/) is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites fun again.

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
