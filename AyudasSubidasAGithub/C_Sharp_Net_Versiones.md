- Versiones de .NET

  - [EDteam: ¿Qué es .NET? Guía definitiva para entender la plataforma de Microsoft](https://www.youtube.com/watch?v=fuTDzzarQGg)
  - [campusMVP.es: .NET vs .NET Core vs .NET Framework vs .NET Standard 🤯 ¡Fuera DUDAS!](https://www.youtube.com/watch?v=zWfIl2Za-es)
  - [IAmTimCorey: 62. .NET Framework vs .NET Core vs .NET vs .NET Standard vs C#](https://www.youtube.com/watch?v=4olO9UjRiww)

  - [kudvenkat: What is ASP.NET Core 5](https://www.youtube.com/watch?v=t3zj0c244UE)

    - Es necesario entender que es
      - .NET Framework
      - .NET Core
      - .NET
      - One.NET
    - .NET Framework Releases
      - .NET Framework 1.0 (Febrero 2002)
      - 1.1 2.0 3.0 3.5 4 4.5 4.5.1 4.5.2 4.6 4.6.1 4.6.2 4.7 4.7.1 4.7.2 4.8 (Abril 2019)
      - Fue construída para windows, lo que significa que puede ser usada únicamento para construir aplicaciones en la plataforma windows.
      - NO es un cross-platform, lo que significa que no puede usarse par construir aplicaicones en Linux o macOS.
    - .NET Core
      - SI es un cross-platform, lo que significa que si puede usarse par construir aplicaicones en Windows, Linux o macOS.
      - 1.0 (Junio 2016) 1.1 (nov 2016) 2.0 (ago 2017) 2.1 (may 2018) 2.2 (dic 2018) 3.0 (sep 2019)
    - .NET 5.0

      - El la próxima "major release" de .Net Core 3.1
      - No se le llamó.Net Core 4.0 para
        - Evitar confusiones con este nuevo .NET 5.0 y el tradicional .NET Framework 4.x.
        - El nombre Core es eliminado del nombre para enfatizar y reforzar esto, es decir, .NET 5.0 es la implementación principal y única de .NET en el futuro.
          .NET Framework 1.0 2.0 3.0 4.0
          One .NET .NET 5.0
          .NET Core 1.0 2.0 3.0
      - SI es un cross-platform, pero el punto clave para mantener en mente es

        - que este nuevo .NET 5.0 soporta muchos más tipos de aplicaciones y plataformas que .NET Core o .NET Framework.
        - Otro importante punto para mantener en mente en cuanto a lo que respecta a las convenciones de nombres, ASP.NET Core 5 se basa en .NET 5.0, pero tenga en cuenta que conserva el nombre "Core" para evitar confundirlo con ASP.NET MVC 5.0. En la misma línea, Entity Framework Core 5.0 retiene el nombre "Core" para evitar confusiones con Entity Framework 5.

          ASP.NET Core 5.0 ASP.NET MVC 5.0  
          .NET 5.0
          Entity Framework Core 5.0 Entity Framework 5.0

        Así estos dos términos ASP.NET Core 5 y ASP.NET Core en .NET 5.0 son usados intercambiablemente, asi mismo Entity Framework Core 5.0 y Entity Framework Core 5.0 en .NET 5.0 son usados intercambiablemente

      - Qué es One.NET

        - Microsoft quiere crear una plataforma .NET unificada en lugar de herramientas separadas, runtimes y frameworks como .NET Framework, .NET Core, Xamarin, Mono, .NET Standard, etc. Ellos quieren consolidar, tomar lo mejor de estos diferentes frameworks y crear una plataforma unificada .NET que todos pueden usar.

- [Instalar .NET](https://dotnet.microsoft.com/en-us/)

- [Como solucionar el error mmc exe en windows 10](https://mundowin.com/como-solucionar-el-error-mmc-exe-en-windows-10/)
  - Dism.exe /Online /Cleanup-image /Restorehealth
  - sfc /scannow
