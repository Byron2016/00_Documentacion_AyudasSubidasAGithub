- NetMentor: [Patrón Opciones en C# | Saca provecho de la configuración con IOptions](https://www.youtube.com/watch?v=uR_bff8xOB8)

  - [blog](https://www.netmentor.es/entrada/options-pattern)
  - Options pattern es un patron que nos permite encapsular y separar la lógica de nuestra configuración del resto de componentes.
  - Seguimos la lógica utilizada en "C_Sharp_EF_IConfiguration_01.md"

  - Inicial

    - En los ficheros "appsettings.json" / "appsettings.Development.json".

      ```json
      {
        "EmailService": {
          "SmtpServer": "server",
          "from": "from@gmail.com"
        }
      }
      ```

    - En "WebPersonalBackend.EmailService/EmailConfiguration.cs".

      ```cs
        public class EmailConfiguration{
          public string SmtpServer { get; set; }
          public string From { get; set; }
        }
      ```

    - En "WebPersonalBackend.EmailService/IEmailSender.cs".

      ```cs
        public class IEmailSender{
          Task<Result<bool>> SendEmail(string to, string subject, string body);
        }
      ```

    - En "WebPersonalBackend.EmailService/EmailSender.cs".

      ```cs
        public class EmailSender: IEmailSender {
          private readonly EmailConfiguration _configuration;

          public EmailSender(EmailConfiguration confg){
            _configuration = config;
          }
          public async Task<Result<bool>> SendEmail(string to, string subject, string body){
            Console.WriteLine("This simulates the an email being Sent");
            Console.WriteLine($"Email configuration Server: {_configuration.SmtpServer}, From: {_configuration.From}");
            Console.WriteLine($"Email dato to {to}, subject: {subject, body: {body}}");
            return true;
          }
        }
      ```

    - En "Starup.cs".

      ```cs
        public class Startup{
          private IConfiguration _configuration;
          public Startup(Iconfiguration configuration){
            _configuration = configuration
          }
          public void Configuration(IServiceColleciton services){
            services.AddSingleton(x => {
              EmailConfiguration emailConfiguration = new EmailConfiguration();
              _configuration.Bind("EmailService", emailConfiguration);
              return emailConfiguration;
            })
            .addScoped<IEmailSender, EmailSender>();
          }
        }
      ```

  - Configurando IOptions

    - Hay que cambiar la forma como inyectamos nuestra configuración dentro del inyector de depenpencias.
    - Utilizar la librería <code>using Microsoft.Extensions.Options</code>
    - <code>using Microsoft.Extensions.Options</code> nos permite utilizar un servicio que se llama <code>services.Configure</code>

      ```cs
        using Microsoft.Extensions.Options
        public class Startup{
          private IConfiguration _configuration;
          public Startup(Iconfiguration configuration){
            _configuration = configuration
          }
          public void Configuration(IServiceColleciton services){

            // services.AddSingleton(x => {
            //   EmailConfiguration emailConfiguration = new EmailConfiguration();
            //   _configuration.Bind("EmailService", emailConfiguration);
            //   return emailConfiguration;
            // })
            // .addScoped<IEmailSender, EmailSender>();
            services.Configure<EmailConfiguration>(_configuration.GetSection("EmailService"));
            // 6.45 Podemos añadir configuraciones extras
            services.PostConfigure<EmailConfiguration>(config => {
              if(string.IsNullOrWhiteSpace(config.SmtpServer))
                throw new Exception("el server está vacío");
            })
            services.addScoped<IEmailSender, EmailSender>();
          }
        }
      ```

    - Cuando utilizamos <code>services.Configure</code> lo que hace por detrás el lenguaje es añadirnos tres interfaces

      - <code>IOptions</code>

        ```cs
          public class EmailSender: IEmailSender {
            private readonly EmailConfiguration _configuration;
            // public EmailSender(EmailConfiguration confg){
            //   _configuration = config;
            // }
            public EmailSender(IOptions<EmailConfiguration> config){
              // Esta forma hace el mismo trabajo que la versión anterior, la diferencia más notable es que ahora notamos que es una configuración inyectada a través de appsettings.json.
              // Cabe mencionar que IOptions<EmailConfiguration> se crea como SINGLETON, por tanto se puede incluir en cualquier objeto.
              _configuration = config.Value;
            }
            public async Task<Result<bool>> SendEmail(string to, string subject, string body){
              Console.WriteLine("This simulates the an email being Sent");
              Console.WriteLine($"Email configuration Server: {_configuration.SmtpServer}, From: {_configuration.From}");
              Console.WriteLine($"Email dato to {to}, subject: {subject, body: {body}}");
              return true;
            }
          }
        ```

      - <code>IOptionsSnapshot</code>

        ```cs
          public class EmailSender: IEmailSender {
            private readonly EmailConfiguration _configuration;
            public EmailSender(IOptionsSnapshot<EmailConfiguration> config){
              // Esta forma lo que hace es capturar los valores en ese momento (snapshot) y los almacena, y utiliza esos mismos valores durante toda la request.
              // Se ACTUALIZA appSettings, entonces captura los nuevos valores sin necesidad de volver a desplegar la aplicación.
              _configuration = config.Value;
            }
            ....
          }
        ```

      - <code>IOptionsMonitor</code>

        ```cs
          public class EmailSender: IEmailSender {
            private readonly EmailConfiguration _emailConfiguration => _options.CurrentValue;
            private readonly IOptionsMonitor<EmailConfiguration> _options;
            public EmailSender(IOptionsMonitor<EmailConfiguration> config){
              // Esta forma lo que hace es: imagina que tienes una reques en donde un proceso tarda 20 minutos, en donde tienes que enviar un email al principio y al final, actualizo el email, entonces al final enviará el email actualizado.
              _options = config;
            }
            public async Task<Result<bool>> SendEmail(string to, string subject, string body){
              Console.WriteLine("This simulates the an email being Sent");
              Console.WriteLine($"Email configuration Server: {_emailConfiguration.SmtpServer}, From: {_emailConfiguration.From}");
              Console.WriteLine($"Email dato to {to}, subject: {subject, body: {body}}");
              return true;
            }
          }
        ```
