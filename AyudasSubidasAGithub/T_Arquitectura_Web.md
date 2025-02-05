- **Arquitectura Web**
	- [Curso de Aplicaciones Web: Clase 14 - MVC, MVP y MVVM](https://www.youtube.com/watch?v=LiudFkofPfw)
		- 

			- **MVC**
				- Descripción:
					- Separación de los datos y como se ven estos datos.
					- Respetar la separación y como ser fieles a los beneficios de la separación de responsabilidades
				- Mandamientos
					- No queremos lógica de dominieo en la vista 
						- Una cosa es visualizar los datos y exteriorizarlos para que otros puedan consumirlos y otra como estos datos son computados / controlados y son verificados.
					- No queremos que el modelo sepa ni de vistas ni de lógica de domineo.
						- El modelo debe estar pensado alrededor de los datos y deberían ser independiente de como se visualizan y como se prosesan de acuerdo con una necesidad del negocio en particular.
				- Model
					- Datos
				- Controler
					- Controla la Vista y el Modelo 
				- View
					- Forma de exteriorizar / visualizar los datos 
					
					
					
				- **Grafico** 
				
				
				                ┌--------------------┐
				                |                    |
				    ┌-----------|    CONTROLLER      |--------┐
				    |           |                    |        |
				    |           └--------------------┘        |
				    |                                         |
				    |                                         |
				    |                                         |
				    |                                         |
				    V                                         V
				┌--------------------┐             ┌--------------------┐
				|                    |             |                    |
				|     MODEL          | <---------- |         VIEW       |
				|                    |             |                    |
				└--------------------┘             └--------------------┘
				
				                  V              C                M
				                  |              |                |
				Evento de usuario |              |                |
				----------------->|Invoca acción |                |
				  click en        |------------->|       Tarea    | 
				  "Add Post"      | addPost(txt) |--------------->|
				                  |              |  insertData(d) |
				                  |              |                |
				                  |              |                |
				                  |consulta (pued|e)              |
				                  |--------------|--------------->|
				                  |  getPost()   |                |
				                  |              |                |
				                  |              |                |
				                  |              |      respuesta |
				                  |<-------------|----------------|
				                  |              |          datos |
				
				
			- **MVP**
				- Descripción:
					- Es una variación del MVC en la que renombra al Controlador como Presenter.
					- Ya no existe vínculo entre la vista y el modelo.
						- La vista ya no tiene la capacidad de consultar el modelo. Así si es que necesita datos lo hará a través del presentador.
					- Presenter se comunica de manera bidireccional con la vista.
						- La vista conoce al presentador y el presentador conoce a la vista.
						- Presentador asume toda la lógica de presentación. Aquella lógica que hay que implementar para estructurar y mostrar la información. De esta forma el presentador está más orientado a la vista y dejamos de tener un síntoma tradicional del MVC que es "Fat controllers", la vista depende del presentador para obtener los datos del modelo.
						- La vista es más pasiva, más trivial, tiene menos procesamiento y simplemente se limita a mostrar los datos en coordinación con el presentador.
					- Refleja mejor la separación de capas
					- Objetos más simples (fáciles de testear)
					- La vista y el presentador pueden tener mayor acoplamiento.
					- Hay que crear más presentadores que controladores es decir más presentadores pero pequeños, quitando los "Fat controllers".
				- Mandamientos
					- 
					
				- **Grafico** 
				
				
				                ┌--------------------┐
				                |                    |
				    ┌-----------|     PRESENTER      |<-------┐
				    |           |                    |        |
				    |           └--------------------┘        |
				    |                                         |
				    |                                         |
				    |                                         |
				    |                                         |
				    V                                         V
				┌--------------------┐             ┌--------------------┐
				|                    |             |                    |
				|     MODEL          | XXXXXXXXXXX |         VIEW       |
				|                    |             |                    |
				└--------------------┘             └--------------------┘
				
				                  V              P                M
				                  |              |                |
				Evento de usuario |              |                |
				----------------->|Invoca acción |                |
				  click en        |------------->|       Tarea    | 
				  "Add Post"      | addPost(txt) |--------------->|
				                  |              |  insertData(d) |
				                  |              |                |
				                  |              |                |
				                  |              |      entidades |
				                  |              |<---------------|
				                  |              |          datos |
				                  |              |                |
				                  |              |                |
				                  | actualizar UI|                |
				                  |<-------------|                |
				                  |  showPost(ds)|                |
				
			- **MVVM**
				- Descripción:
					- Es una variación del MVC en la que renombra al Controlador como View Model.
					- Parte de tecnologías de Microsoft que han sido adoptadas globalmente.
					- View Model es una abstracción de la vista, de manera similar al MVP 
					- Vista no puede acceder al Modelo.
					- La coneción entre el VM y el View es unidireccional, la vista conoce al VM pero no al revés.
						- La vista puede comunicarse con el VM y solicitarle algo en particular del Modelo de datos como por ejemplo agregar una imagen a un post o reservar un pasaje a una aerolínea y el VM mediante un esquema basado en subscripciones 
						- El esquema basado en suscripciones implica por lo general un "Data Binding" entre la vista y el VM, esto significa que hay algunos datos que se visualizan en la vista que van a estar vinculados con algunas informaciones del VM que a su vez pueden estar vinculadas con el modelo. (Similar al patron Observer)
						
					- El modelo también está suscrito al VM de esta forma puede modificar modificaciones al modelos de datos al VM  
					
				- Mandamientos
					- 
					
				- **Grafico** 
				
				
				                ┌--------------------┐
				                |                    |
				    ┌-----------|     VIEW MODEL     |<-------┐
				    |           |                    |        |
				    |           └--------------------┘        |
				    |                                         |
				    |                                         |
				    |                                         |
				    |                                         |
				    V                                         |
				┌--------------------┐             ┌--------------------┐
				|                    |             |                    |
				|     MODEL          | XXXXXXXXXXX |         VIEW       |
				|                    |             |                    |
				└--------------------┘             └--------------------┘
				
				
				                  V              VM               M
				                  |              |                |
				Evento de usuario |              |                |
				----------------->|Evento UI     |                |
				  click en        |------------->|Actualizar Model| 
				  "Add Post"      | addPost(txt) |--------------->|
				                  |              |  insertData(d) |
				                  |              |                |
				                  |              |                |
				                  |              |      datos     |
				                  |              |<---------------|
				                  |              | model notifica |
				                  |              | al mundo model |
				                  |              | ha cambiado    |
				                  |              |                |
				                  |              |                |
				                  |         datos|                |
				                  |<-------------|                |
				                  |vm notifica al|                |
				                  |mundo update  |                |
				                  |mostrado      |                |
				                  |              |                |
								  
								  		
				- [Código Estudiante: Patron MVVM en .NET MAUI](https://www.youtube.com/watch?v=ZVJV6bj2qSw) 
					- 
						- Grafico 
						
				    ViewModel updates 
				    the model   ┌--------------------┐ Data Binding 
				                |                    | and Commands
				    ┌-----------|     VIEW MODEL     |<-------┐
				    |           |                    |        |
				    |           └--------------------┘        |
				    |                 A       V               |
				    |       Send      A       V    Send       |
				    |    notificationsA       V notifications |
				    |             >>> A       V >>>           |
				    V             A                V          |
				┌--------------------┐             ┌--------------------┐
				|                    |             |                    |
				|     MODEL          | XXXXXXXXXXX |         VIEW       |
				|                    |             |                    |
				└--------------------┘             └--------------------┘

- **MVVM**
  - [fahrenheit256: Proyecto en Javascript Vanilla + Bootstrap + Patron MVVM - Lista de colores : Metodos de array](https://www.youtube.com/watch?v=hwTM1YW3Azw)
    - Excelente tutorial paso a paso.
    - Topa 
      - Patron Observador / Observer Pattern
      - Patron Estrategia / Strategy Pattern
    - 
