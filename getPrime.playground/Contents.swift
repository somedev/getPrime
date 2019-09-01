import Foundation

extension Array where Element:Equatable {
    func nextIndex(of value:Element, from:Int) -> Int? {
        if from >= self.count {
            return nil
        }
        for i in from..<self.count {
            if self[i] == value {
                return i
            }
        }
        return nil
    }
}

let maxNum:Int = 1000

//Sieve of Eratosthenes
func getPrimes(container: inout [Bool], primes: inout [Int]) -> [Int] {
    guard let last = primes.last else { return [] }
    for i in (last-1)..<container.count {
        let v = i+1
        if v%last == 0 && i > last {
            container[i] = false
        }
    }
    
    if let nextIndex = container.nextIndex(of: true, from: last) {
        primes.append(nextIndex+1)
        return getPrimes(container: &container, primes: &primes)
    }
    
    
    return primes
    
}

func generatePrimes(till:Int) -> [Int] {
    if till < 1 {
        return []
    }
    var primesAccumulator:[Int] = [1, 2]
    var sieveContainer:[Bool] = Array(repeating: true, count: till)
    return getPrimes(container: &sieveContainer, primes: &primesAccumulator)
}

let generated = generatePrimes(till: maxNum)

print("\(generated)")
