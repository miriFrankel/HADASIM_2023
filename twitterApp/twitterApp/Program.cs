using System;

class Program
{
    static void Main(string[] args)
    {
        int choice;
        //main menue instructions
        do
        {
            Console.WriteLine("Choose a tower type:");
            Console.WriteLine("1. Rectangular Tower");
            Console.WriteLine("2. Triangular Tower");
            Console.WriteLine("3. Exit");

            choice = int.Parse(Console.ReadLine() ?? " ");

            switch (choice)
            {
                case 1:
                    RectangleTower();
                    break;
                case 2:
                    TriangleTower();
                    break;
                case 3:
                    break;
                default:
                    Console.WriteLine("Invalid choice!");
                    break;
            }
        } while (choice != 3);
    }

    static void RectangleTower()
    {
        int height, width;

        Console.WriteLine("Enter tower height (must be greater than or equal to 2):");
        height = int.Parse(Console.ReadLine()??" ");

        Console.WriteLine("Enter tower width:");
        width = int.Parse(Console.ReadLine() ?? " ");
        //throw fails
        if (height < 2)
        {
            Console.WriteLine("Tower height must be greater than or equal to 2!");
            return;
        }
        //calculate area
        if (Math.Abs(height - width) > 5)
        {
            Console.WriteLine("Tower area: " + (height * width));
        }
        //calculate perimeter
        else
        {
            Console.WriteLine("Tower perimeter: " + (2 * (height + width)));
        }
    }

    static void TriangleTower()
    {
        int choice, height, width;

        Console.WriteLine("Enter tower height (must be greater than or equal to 2):");
        height = int.Parse(Console.ReadLine() ?? " ");

        Console.WriteLine("Enter tower width:");
        width = int.Parse(Console.ReadLine() ?? " ");
        //throw fails
        if (height < 2)
        {
            Console.WriteLine("Tower height must be greater than or equal to 2!");
            return;
        }

        if (width % 2 == 0 || width > 2 * height)
        {
            Console.WriteLine("Unable to print triangle!");
            return;
        }

        do
        {
            //second menu for Triangle
            Console.WriteLine("Choose an action:");
            Console.WriteLine("1. Calculate Perimeter");
            Console.WriteLine("2. Print Triangle");

            choice = int.Parse(Console.ReadLine() ?? " ");

            switch (choice)
            {
                case 1:
                    Console.WriteLine("Triangle perimeter: " + (width + Math.Sqrt(Math.Pow((double)width / 2, 2) + Math.Pow(height, 2))));
                    break;
                case 2:
                    PrintTriangle(width, height);
                    break;
                default:
                    Console.WriteLine("Invalid choice!");
                    break;
            }
        } while (choice != 1 && choice != 2);
    }

    static void PrintTriangle(int width, int height)
    {
        int spaces = (width - 1) / 2;
        int stars = 1;
        int sumToPrint = 0;

        for (int i = 0; i < height;)
        {
            //calculationg the sum of lines to print
            if (stars == 1 || stars == width)
                sumToPrint = 1;
            else if (stars == 3)
                sumToPrint = ((height - 2) / ((width - 2) / 2)) + ((height - 2) % ((width - 2) / 2));
            else
                sumToPrint = (height - 2) / ((width - 2) / 2);
            //loop for printing every line
            for (int j = 0; j < sumToPrint; j++)
            {
                //print spaces
                for (int k = 0; k < spaces; k++)
                {
                    Console.Write(" ");
                }
                //print the srats
                for (int k = 0; k < stars; k++)
                {
                    Console.Write("*");
                }
                i++;
                Console.WriteLine();
            }

            spaces--;
            stars += 2;
        }
    }

}
