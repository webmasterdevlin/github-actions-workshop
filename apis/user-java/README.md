# Overview

This server was generated by the [swagger-codegen](https://github.com/swagger-api/swagger-codegen) project.  
By using the [OpenAPI-Spec](https://github.com/swagger-api/swagger-core), you can easily generate a server stub.  
This is an example of building a swagger-enabled server in Java using the SpringBoot framework.

The underlying library integrating swagger to SpringBoot is [springfox](https://github.com/springfox/springfox).

Start your server as an simple java application.

You can view the api documentation in swagger-ui by pointing to
[http://localhost:8080/api/swagger-ui.html](http://localhost:8080/api/swagger-ui.html)

Change default port value in `src/main/resources/application.properties`.

## Build the project

1. Install Maven [https://maven.apache.org/install.html](https://maven.apache.org/install.html) and setup the environment path accordingly

2. Go into the project root directory that has the pom.xml and run `mvn clean install`

## Run only the tests

`mvn test`

## Run the application

1. Modify the `src/main/resources/application.properties` values with valid SQL Server values.

   ```java
   spring.datasource.url=someurl
   spring.datasource.username=username
   spring.datasource.password=password
   ```

1. Start the API: `mvn spring-boot:run`

### POST API Example

This curl command creates a new user with ID 1234.

```bash
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ \
   "createdAt":"2018-08-07", \
   "deleted": false, \
   "firstName": "Hacker", \
   "fuelConsumption": 0, \
   "hardAccelerations": 0, \
   "hardStops": 0, \
   "id": "1234", \
   "lastName": "Test", \
   "maxSpeed": 0, \
   "profilePictureUri": "https://pbs.twimg.com/profile_images/1003946090146693122/IdMjh-FQ_bigger.jpg", \
   "ranking": 0, \
   "rating": 0, \
   "totalDistance": 0, \
   "totalTime": 0, \
   "totalTrips": 0, \
   "updatedAt": "2018-08-07", \
   "userId": "Hacker3" \
 }' 'http://localhost:8080/api/user/1234'
```

### PATCH API Example

This updates the `fuelConsumption` and `hardStops` fields from the user created above.

```bash
curl -X PATCH --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ \
  "fuelConsumption":20, \
  "hardStops":74371 \
}
```