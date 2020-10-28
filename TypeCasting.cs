using System;

class TypeCasting
{
	static void Main(string[] args)
	{
		string inputString = Console.ReadLine();
		Console.WriteLine("Input: " + inputString + "InputType: " + inputString.GetType());
		
		double doubleCast;
		bool result = double.TryParse(inputString, out doubleCast);
		
		Console.WriteLine("Casting successful: " + result);
		Console.WriteLine("Content: " + doubleCast);
	}
}
