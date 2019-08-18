import Foundation

extension Int {
    private static var primeTesters:[Int] = [2, 3, 5, 7]
    
    private func moduloRemain(for prime:Int) -> Int {
        let power = Int(pow(Double(prime), Double(self - 1)))
        let remain = power % self
        return Int(remain)
    }
    
    //Use Fermat's little theorem to test for primes
    var isPrime:Bool {
        if self < 2 {
            return false
        }
        for prime in Int.primeTesters {
            if moduloRemain(for: prime) != 1 {
                return false
            }
        }
        return true
    }
}

let digits:[Int] = Array(1...9)

func generateNumbers(from digits:[Int]) -> [Int] {
    return [987654312, 987654321]
}

func findLargest() -> Int? {
    //make sure numbers aer sorted
    let numbers = generateNumbers(from: digits).sorted()
    for n in numbers.reversed() {
        if n.isPrime {
            return n
        }
    }

    return nil
}

if let result = findLargest() {
    print("Result is: \(result)")
}
else {
    print("Can't find prime number")
}
