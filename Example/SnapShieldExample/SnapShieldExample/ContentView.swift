//
//  ContentView.swift
//  SnapShieldExample
//

import SwiftUI
import SnapShield

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Basic Protection") {
                    BasicProtectionExample()
                }
                
                NavigationLink("Custom Placeholder") {
                    CustomPlaceholderExample()
                }
                
                NavigationLink("Bank Card Demo") {
                    BankCardExample()
                }
                
                NavigationLink("Multiple Protected Views") {
                    MultipleProtectedViewsExample()
                }
            }
            .navigationTitle("SnapShield Examples")
        }
    }
}

// MARK: - Example 1: Basic Protection
struct BasicProtectionExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Basic Protection")
                .font(.title)
                .bold()
            
            Text("Try taking a screenshot!")
                .foregroundColor(.secondary)
            
            // This content will be hidden in screenshots
            VStack {
                Text("🔒 Protected Content")
                    .font(.headline)
                Text("This will not appear in screenshots")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .snapShield()
        }
        .padding()
    }
}

// MARK: - Example 2: Custom Placeholder
struct CustomPlaceholderExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Custom Placeholder")
                .font(.title)
                .bold()
            
            Text("Screenshot will show custom view")
                .foregroundColor(.secondary)
            
            // This shows a custom view in screenshots
            VStack(spacing: 15) {
                Image(systemName: "creditcard.fill")
                    .font(.system(size: 50))
                Text("Credit Card: 1234-5678-9012-3456")
                    .font(.title3)
                Text("CVV: 123")
                Text("Exp: 12/25")
            }
            .padding()
            .background(Color.green.opacity(0.1))
            .cornerRadius(10)
            .snapShield()
//            .snapShield {
//                ZStack {
//                    Color.red.opacity(0.2)
//                    VStack(spacing: 15) {
//                        Image(systemName: "exclamationmark.shield.fill")
//                            .font(.system(size: 60))
//                            .foregroundColor(.red)
//                        Text("Protected Content")
//                            .font(.headline)
//                            .foregroundColor(.red)
//                        Text("Screenshots are not allowed")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
//                    }
//                }
//                .cornerRadius(10)
//            }
        }
        .padding()
    }
}

// MARK: - Example 3: Bank Card Demo
struct BankCardExample: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Bank Card Demo")
                    .font(.title)
                    .bold()
                
                // Protected card view
                BankCardView(
                    cardNumber: "4532 1234 5678 9010",
                    cardHolder: "JOHN DOE",
                    expiryDate: "12/25",
                    cvv: "123"
                )
//                .snapShield {
//                    BankCardPlaceholder()
//                }
                
                Text("Try taking a screenshot of the card!")
                    .foregroundColor(.secondary)
                    .padding()
            }
            .padding()
        }
    }
}

struct BankCardView: View {
    let cardNumber: String
    let cardHolder: String
    let expiryDate: String
    let cvv: String
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "wave.3.right")
                        .font(.title)
                    Spacer()
                    Text("Bank")
                        .font(.title3)
                        .bold()
                }
                
                Spacer()
                
                Text(cardNumber)
                    .font(.system(size: 24, design: .monospaced))
                    .tracking(2)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("CARD HOLDER")
                            .font(.caption)
                            .opacity(0.7)
                        Text(cardHolder)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("EXPIRES")
                            .font(.caption)
                            .opacity(0.7)
                        Text(expiryDate)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("CVV")
                            .font(.caption)
                            .opacity(0.7)
                        Text(cvv)
                            .font(.subheadline)
                    }
                }
            }
            .padding()
            .foregroundColor(.white)
        }
        .frame(height: 220)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

struct BankCardPlaceholder: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.gray, .gray.opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(spacing: 15) {
                Image(systemName: "lock.shield.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                Text("Card Information Protected")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Screenshots are disabled for security")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .frame(height: 220)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

// MARK: - Example 4: Multiple Protected Views
struct MultipleProtectedViewsExample: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Multiple Protected Sections")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                
                // Section 1: Hidden
                VStack(alignment: .leading) {
                    Text("Section 1: Hidden")
                        .font(.headline)
                    Text("Password: super_secret_123")
                        .font(.system(.body, design: .monospaced))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.red.opacity(0.1))
                .cornerRadius(10)
                .snapShield()
                
                // Section 2: Custom placeholder
                VStack(alignment: .leading) {
                    Text("Section 2: Custom")
                        .font(.headline)
                    Text("API Key: sk_live_abcd1234efgh5678")
                        .font(.system(.body, design: .monospaced))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)
//                .snapShield {
//                    VStack {
//                        Image(systemName: "key.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(.orange)
//                        Text("API Key Hidden")
//                            .foregroundColor(.orange)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.orange.opacity(0.1))
//                    .cornerRadius(10)
//                }
                
                // Section 3: Not protected
                VStack(alignment: .leading) {
                    Text("Section 3: Not Protected")
                        .font(.headline)
                    Text("Public Info: This is visible in screenshots")
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
