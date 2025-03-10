# ARCHTECHTURE

![archtecture](https://github.com/toshiossada/weather_test/assets/2637049/e336557f-ef0a-400b-a62d-64792e0fe984)

The `ARCHTECHTURE` is based on Clean Archtecture split on modules

![image](https://github.com/toshiossada/weather_test/assets/2637049/4b06aee9-a2d3-40f9-80f2-513a31eb5ded)

## CORE MODULE

![image](https://github.com/toshiossada/weather_test/assets/2637049/5c7db08f-a201-41ca-aa69-3d55201dde3e)

In `CORE MODULE` There are all features that will be shared across all modules, as Adapters, Extensions, Helpers, etc.

## HOME MODULE

At `HOME MODULE` there is a clean archtecture enviroment, as Domain (with usecases, entities, etc), Infra(with Datasource, Models, Repositories, etc) and Presentation (with Pages, Widgets, Stores, controles, etc).

![image]![image](https://github.com/user-attachments/assets/e6e7feb0-df74-4c75-8e97-f7701e86ccb1)

### DOMAIN

![image](https://github.com/toshiossada/weather_test/assets/2637049/75987ec7-221e-412b-ba5a-baf2dd6d99e8)

At `DOMAIN` layer we have enums, abstracts of repositories, entities and a use case.

### INFRA

At `INFRA` Layer we have `DATASOURCES` and `REPOSITORIES`

#### DATASOURCE

The `DATASOURCE` has responsability to call de `HttpAdapter` to Request DATA from API.

#### Repositories

The `REPOSITORIES` has the responsibility  to make a bridge between `USECASE` and `DATASOURCE` and convert `MODELS` to `ENTITIES` using the `MAPPERS`

### PRESENTATION

![image](https://github.com/toshiossada/weather_test/assets/2637049/61c5da2c-a57b-4aba-bca8-231503bb5504)

The `PRESENTATION` Layer is structured between Pages, Stores, Controllers and Widgets.

The `Stores, Widgets and Controllers` outside the `Pages` folders that means the resource is shared across all presentations.

![image](https://github.com/toshiossada/weather_test/assets/2637049/673c197f-dfa3-4ea9-b8a2-4972ef2f55a1)

#### PAGES

Each Page should has a controller and could a store and one or more widgets.

![image](https://github.com/toshiossada/weather_test/assets/2637049/593da6cd-740e-48be-bb91-1c39bf1a74da)
