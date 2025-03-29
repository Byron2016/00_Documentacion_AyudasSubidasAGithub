- NetMentor: [Importar configuración correctamente a nuestras aplicaciones | Iconfiguration en .NET](https://www.youtube.com/watch?v=i1mUTXmwvlk)

  - NOTA: Para los secrets revisar usar secrets.
  - NOTA: En propiedades tenemos "launchSetting.json" que nos permite simular el entorno.

    ```json
    {
      "profiles": {
        "IIS Express": {
          "enviromentVariables": {
            "ASPNETCORE_ENVIROMENT": "Production"
          }
        },
        "WebPersonal.BackEnd": {
          "enviromentVariables": {
            "ASPNETCORE_ENVIROMENT": "Production"
          }
        }
      }
    }
    ```

  - Web API

    - Forma 1

      - En los ficheros "appsettings.json" / "appsettings.Development.json" es en donde se especifica dicha configuración.
        ```json
        {
          "database": {
            "read": {
              "connectionString": "Server=127.0.0.1;Port=3306;Database=webpersonal;Uid=webpersonaluser;password=webpersonalpass;Allow User Variables=true"
            }
          }
        }
        ```
      - Para acceder a los ficheros "appsettings.json" / "appsettings.Development.json" se lo hace a través del IConfiguration, el cual viene añadido por defecto con el framework .NET, está metida en el inyector de dependencias y se puede acceder desde cualquier clase. Microsoft nos da En el "Startup"

        ```cs
          public class Startup{
            private IConfiguration _configuration;

            public Startup(Iconfiguration configuration){
              _configuration = configuration
            }

            public void Configuration(IServiceColleciton services){
              services.AddScoped<DBConnection>(x => new MySqlConnection(_configuration["database:read:connectionString"]))
            }
          }
        ```

    - Forma 2

      - En los ficheros "appsettings.json" / "appsettings.Development.json" es en donde se especifica dicha configuración.
        ```json
        {
          "database": {
            "Server": "127.0.0.1",
            "Port": "3306",
            "DatabaseName": "webpersonal",
            "User": "webpersonaluser",
            "Password": "webpersonalpass",
            "AllowUserVariables": true
          }
        }
        ```
      - Para acceder a los ficheros "appsettings.json" / "appsettings.Development.json" se lo hace a través del IConfiguration, el cual viene añadido por defecto con el framework .NET, está metida en el inyector de dependencias y se puede acceder desde cualquier clase. Microsoft nos da En el "Startup"

        - Crear "./Settings/DatabaseSettings.cs"

          ```cs
            public static class DatabaseSettings{
              public static string  BuildConnectionString(Iconfiguration config){
                StringBuilder sb = new StringBuilder();
                sb.Append($"Server={config["database.server"]};")
                sb.Append($"Port={config["database.port"]};")
                sb.Append($"Database={config["database.DatabaseName"]};")
                sb.Append($"Uid={config["database.user"]};")
                sb.Append($"password={config["database.Password"]};")
                if (config.GetValue<bool>("database:AllowUserVariables" ) == true){
                  sb.Append("Allow User Variables=true;");
                }
                return sb.ToString();
              }
            }
          ```

        - En el "Startup.cs"

          ```cs
            public class Startup{
              private IConfiguration _configuration;
              public Startup(Iconfiguration   configuration){
                _configuration = configuration
              }
              public void Configuration (IServiceColleciton services){
                services.AddScoped<DBConnection>(x  => new MySqlConnection (DatabaseSettings. BuildConnectionString  (_configuration))
              }
            }
          ```

    - Forma 3

      - En los ficheros "appsettings.json" / "appsettings.Development.json" es en donde se especifica dicha configuración.

        ```json
        {
          "database": {
            "Server": "127.0.0.1",
            "Port": "3306",
            "DatabaseName": "webpersonal",
            "User": "webpersonaluser",
            "Password": "webpersonalpass",
            "AllowUserVariables": true
          }
        }
        ```

      - Para acceder a los ficheros "appsettings.json" / "appsettings.Development.json" se lo hace a través del IConfiguration, el cual viene añadido por defecto con el framework .NET, está metida en el inyector de dependencias y se puede acceder desde cualquier clase. Microsoft nos da En el "Startup"

        - Crear "./Settings/DatabaseSettings.cs"

          ```cs
            public static class DatabaseSettings{
              public static string  BuildConnectionString(Iconfiguration config){
                IConfiguration section = config.GetSection("databse");
                StringBuilder sb = new StringBuilder();
                sb.Append($"Server={section.GetValue<string>("server")};")
                sb.Append($"Port={section.GetValue<string>("port")};")
                sb.Append($"Database={section.GetValue<string>("DatabaseName")};")
                sb.Append($"Uid={section.GetValue<string>("user")};")
                sb.Append($"password={section.GetValue<string>("Password")};")
                if (section.GetValue<bool>("database:AllowUserVariables" ) == true){
                  sb.Append("Allow User Variables=true;");
                }
                return sb.ToString();
              }
            }
          ```

        - En el "Startup.cs"

          ```cs
            public class Startup{
              private IConfiguration _configuration;
              public Startup(Iconfiguration   configuration){
                _configuration = configuration
              }
              public void Configuration (IServiceColleciton services){
                services.AddScoped<DBConnection>(x  => new MySqlConnection (DatabaseSettings. BuildConnectionString  (_configuration))
              }
            }
          ```

    - Forma 4 (La mejor)

      - En los ficheros "appsettings.json" / "appsettings.Development.json" es en donde se especifica dicha configuración.

        ```json
        {
          "database": {
            "Server": "127.0.0.1",
            "Port": "3306",
            "DatabaseName": "webpersonal",
            "User": "webpersonaluser",
            "Password": "webpersonalpass",
            "AllowUserVariables": true
          }
        }
        ```

      - Para acceder a los ficheros "appsettings.json" / "appsettings.Development.json" se lo hace a través del IConfiguration, el cual viene añadido por defecto con el framework .NET, está metida en el inyector de dependencias y se puede acceder desde cualquier clase. Microsoft nos da En el "Startup"

        - Convertir nuestro objeto de Settings a un objeto en .NET. Crear "./Settings/DatabaseConfiguration.cs"

          ```cs
            public static class DatabaseConfiguration{
              public string Server {get; set;}
              public string Port {get; set;}
              public string Database {get; set;}
              public string User {get; set;}
              public string Password {get; set;}
              public string AllowUserVariables {get; set;}
              public string Server {get; set;}
              }
            }
          ```

        - Crear "./Settings/DatabaseSettings.cs"

          ```cs
            public static class DatabaseSettings{
              public static string  BuildConnectionString(Iconfiguration config){
                // Usaremos el binding del config.
                DatabaseConfiguration dbConfig = new DatabaseConfiguration();
                config.Bind("database", dbConfig);
                IConfiguration section = config.GetSection("databse");
                StringBuilder sb = new StringBuilder();
                sb.Append($"Server={dbConfig.server};")
                sb.Append($"Port={dbConfig.Port};")
                sb.Append($"Database={dbConfig.DatabaseName};")
                sb.Append($"Uid={dbConfig.User};")
                sb.Append($"password={dbConfig.Password};")
                if (dbConfig.AllowUserVariables){
                  sb.Append("Allow User Variables=true;");
                }
                return sb.ToString();
              }
            }
          ```

        - En el "Startup.cs"

          ```cs
            public class Startup{
              private IConfiguration _configuration;
              public Startup(Iconfiguration   configuration){
                _configuration = configuration
              }
              public void Configuration (IServiceColleciton services){
                services.AddScoped<DBConnection>(x  => new MySqlConnection (DatabaseSettings. BuildConnectionString  (_configuration))
              }
            }
          ```

- Felipe Gavilan Programa: [SQL Server Como Proveedor de Configuración - IConfiguration con Una Base de Datos](https://www.youtube.com/watch?v=sfviUF_EJGw)
  - Poner la configuración en base de datos.
  - TODO pasar lo del vídeo. PENDIENTE. 
