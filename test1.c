// Calculates the area of a circle

int main()
{
	const float PI = 3.14159;
	float sum, radius;
	printf("Enter the radius of the circle.\n");
	scanf("%f", &radius);
	/*area of a circle is pi * radius * radius*/
	sum = PI * radius * radius;
	/*display the area*/
	printf("The area of a circle is %f.\n",sum);
	return 0;
}