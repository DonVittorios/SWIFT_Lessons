//
//  main.swift
//  DZ2_Victor_Denisov
//
//  Created by Виктор on 23.11.2021.
//

import Foundation

/* Задание 1
 Написать функцию, которая определяет, четное число или нет.
 */
print("Решение Задания № 1:")

// Создал функцию, принимающую один входной переметр с алгоритмом вычисления четности или не четности числа
func evenOrOddNumber (number: Int) {
    let enteredNumber = number
    let _: () = enteredNumber % 2 == 0 ? print("Было указано число: \(enteredNumber) \nЧисло четное") : print("Было указано число: \(enteredNumber) \nЧисло не четное")
}

evenOrOddNumber (number: 77)


/* Задание 2
 Написать функцию, которая определяет, делится ли число без остатка на 3.
 */
print("Решение Задания № 2:")

func divisionByThree (number: Int) {
    let enteredNumber = number
    let _: () = enteredNumber % 3 == 0 ? print("Было указано число: \(enteredNumber) \nЧисло делится на 3 без остатка") : print("Было указано число: \(enteredNumber) \nЧисло НЕ делится на 3 без остатка")
}

divisionByThree(number: 78)


/* Задание 3
 Создать возрастающий массив из 100 чисел.
 */
print("Решение Задания № 3:")

var newArray = [Int] (1...100)
print(newArray)

/* Задание 4
 Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
 */
print("Решение Задания № 4:")

// создал функцию для фильтрации значений массива
func isNewArray (number: Int) -> Bool {
    return number % 2 != 0 && number % 3 == 0
}
newArray = newArray.filter(isNewArray) // применил функцию к ранее созданному массиву
print(newArray)

/* Задание 5
 Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
 Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
 */


print("Решение Задания № 5:")

// функция добавляющая в массив число Фибоначчи
func addFibonacci (number: Int) -> Int {
    if number == 0 {
        return 0
    } else if number == 1 {
        return 1
    }
    return addFibonacci (number: number - 1) + addFibonacci (number: number - 2)
}

// добавляю 50 элементов/чисел Фибоначчи в массив
var fibArray = [Int]()
fibArray.append(0)
for i in 1...50 {
    fibArray.append(addFibonacci(number: i))
}
print(fibArray)

// TO:DO функция долго считается, мне не нравится. Нужно оптимизировать.

/* Задание 6
 Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2 * p до n, считая шагом p..
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно.
 */
print("Решение Задания № 6:")

// функция фильтрует простые числа
func primeNumbers(number: Int) -> Bool {
    if number < 2 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
// функция создает массив из 100 чисел
func arrayOfPrimeNumbers() -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if primeNumbers(number: i) {
            results.append(i)
        }
        i += 1
    }
    return results
}

print(arrayOfPrimeNumbers())
