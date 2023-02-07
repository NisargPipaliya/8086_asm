#include<stdio.h>
#include<conio.h>

extern far int tarea(base,length);
int main(){
int area;
int base = 16;
int length = 13;
area = tarea(base,length);
printf("triangle area is : %d",area);
getch();
}