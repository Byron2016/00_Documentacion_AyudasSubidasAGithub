- Covariance, Contravariance, Preconditions, Postconditions, Invariants

  - [Design Patterns: Liskov Substitution Principle Explained Practically in C# (The L in SOLID)](https://www.youtube.com/watch?v=-3UXq2krhyw&list=RDQMXGFDNO2iiQk&index=3)

    - Covariance

      - Definición (6.15)
        - Covariance habla sobre que el tipo de retorno de un método. Dice que si usted tiene un tipo de datos de retorno este **no puede cambiar**.

    - Contravariance

      - Definición (7.42)
        - Contravariance habla sobre que el tipo de input de un método (parámetros). Dice que si usted tiene un tipo de datos de ingreso a un método este **no puede cambiar**.

    - Preconditions

      - Definición (8.10)

        - Preconditions usted no puede fortalecerlas, Ejemplo

          ```cs
          public class Manager: Employee
          {
            public override void CalculatePerHourRate(int rank)
            {
              if(rank < 0 || rank > 5)
              {
                throw new Exception(); // NO SE PUEDE HACER
              }
              decimal baseAmount = 19.75M;
              Salary = baseAmount + (rank * 4);
            }
          }
          ```

    - Postconditions

      - Definición (9.24)

        - Postconditions usted no puede debilitar las post conditions lo que significa que no puede ser estricto de que viene, no puede retornar un valor dentro de un rango

  - [Preconditions, Postconditions, Invariants: How They Help Write Robust Programs - Andrzej Krzemieński](https://www.youtube.com/watch?v=JfZaNVgU3kI)
    - Preconditions
    - Postconditions
    - Invariants
    - Functions contract
    - Strong and weak contracts
    - Checking contract violation
    - Constrained types for enforcing contracts
    - Language support
