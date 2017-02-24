//
//  AppDelegate.swift
//  Factoring Buddy
//
//  Created by Russell Gordon on 2/24/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // MARK: Outlets
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var a: NSTextField!
    @IBOutlet weak var b: NSTextField!
    @IBOutlet weak var c: NSTextField!
    @IBOutlet weak var result: NSTextField!
    @IBOutlet weak var button: NSButton!
    
    // MARK: AppDelegate
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    // MARK: Core logic

    // Factors the expression given
    @IBAction func factor(_ sender: Any) {
        
        let intA = Int(a.intValue)
        let intB = Int(b.intValue)
        let intC = Int(c.intValue)
        
        // DEBUG:
        print("a is: \(intA)")
        print("b is: \(intB)")
        print("c is: \(intC)")
        
        // Factor the expression
        print("factors of c are:")
        var output = ""
        if intC != 0 {
            
            // Get factors
            guard let factors = getFactors(for: intC) else {
                print("\(intC) has no factors!")
                return
            }
            print(factors)
            
            // Consider the factors in order
            for factor in factors {
                
                // Get the quotient for this factor
                let quotient = intC / factor
                
                // Do this factor (divisor) and the quotient have a sum equal to "b"?
                // If so, the expression is factored
                if quotient + factor == intB {
                    
                    // Assemble string with the factored form
                    output = formatOutput(m: quotient, n: factor)
                    
                    break
                }
                
            }

        } else {
            
            // Handles case where final term is 0
            output = formatOutput(m: 0, n: intB)
        }
        
        // Update the view
        if output == "" {
            result.stringValue = "not possible"
        } else {
            result.stringValue = output
        }
        
        // Set focus to the button
        if button.acceptsFirstResponder {
            
            // Set the focus to the button
            self.window.makeFirstResponder(button)
            
            // Set the textfields so the sign is visible
            if intB >= 0 {
                b.stringValue = "+" + String(intB)
            } else {
                b.stringValue = String(intB)
            }
            if intC >= 0 {
                c.stringValue = "+" + String(intC)
            } else {
                c.stringValue = String(intC)
            }

        }
        
    }
    
    // Get the list of factors for a given coefficient
    func getFactors(for coefficient : Int) -> [Int]? {
        
        // Create an array to store factors in
        var factors : [Int] = []
        
        // Iterate and determine factors of this
        if coefficient == -1 && coefficient == 1 {
            
            // When coeficient is 1 or -1, the only factors are the coefficient itself
            return [coefficient]
            
        } else if coefficient == 0 {
            
            // Cannot have any factors when coefficient is zero
            return nil
            
        } else {
            
            // Decide what direction to step through possible divisors in
            var step = 0
            if coefficient > 0 {
                step = -1
            } else {
                step = 1
            }
            
            // Iterate and find factors, obtaining highest magnitude factors first
            for i in stride(from: coefficient, through: step * -1, by: step) {
                
                // When remainder is zero, "i" is a factor of the coefficient
                if coefficient % i == 0 {
                    factors.append(i) // append the factor
                    if coefficient < 0 {
                        factors.append(-i) // append the factor with the opposite sign
                    }
                }
                
            }
            
        }
        
        // Return the list of factors
        return factors
        
    }
    
    // Produce the factored form as a string
    func formatOutput(m : Int, n : Int) -> String {
        
        var formattedOutput = ""
        
        formattedOutput = "(x "
        if m >= 0 {
            formattedOutput += "+ "
        } else {
            formattedOutput += "- "
        }
        formattedOutput += String(abs(m)) + ")(x "
        if n >= 0 {
            formattedOutput += "+ "
        } else {
            formattedOutput += "- "
        }
        formattedOutput += String(abs(n)) + ")"
        
        return formattedOutput
    }
    

}

