<div align="center">

<!-- Add your logo here -->
<img width="200" height="200" alt="SnapShield" src="https://github.com/user-attachments/assets/8ac2e5af-c42c-43f8-bb39-18f7adc47b50" />

# 🛡️ SnapShield

A lightweight Swift package that protects sensitive content in your iOS, VisionOS, MacOS and tvOS apps from screenshots, screen recordings, and screen sharing.

[![Swift Version](https://img.shields.io/badge/Swift-6.2-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2016%2B%20%7C%20tvOS%2016%2B-blue.svg)](https://developer.apple.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![SPM Compatible](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swift.org/package-manager)

</div>

## 🎯 Features

- 🔒 **Complete Protection** - Secures content from screenshots, screen recordings, and screen sharing
- 🎨 **Customizable Placeholders** - Show custom views when content is being captured
- ⚡ **Easy Integration** - Simple SwiftUI modifier API
- 🪶 **Lightweight** - Zero dependencies, minimal footprint
- 📱 **Cross-Platform** - Works on iOS and tvOS
- 🎮 **Example Project Included** - Learn from real-world implementations
- 🎮 **Example Project Included** - Learn from real-world implementations

## 📸 Demo

### Normal View vs Screenshot

<!-- Add screenshot showing normal app view -->
**Normal View:**

https://github.com/user-attachments/assets/7a6c29a3-26b5-4264-92fc-e62959e52638


<!-- Add screenshot showing what appears when screenshot is taken -->
**When Screenshot/Recording:**

https://github.com/user-attachments/assets/dc37695e-a6b6-434a-8473-a19e9a9be6cc



## 🚀 Installation

### Swift Package Manager

#### Option 1: Install via Xcode

1. Open your project in Xcode
2. Go to **File** → **Add Package Dependencies**
3. Enter the package URL:
   ```
   https://github.com/EmadBeyrami/SnapShield.git
   ```
4. Click **Add Package**
5. Select your desired version (Dependency Rule)
6. Click **Add Package** again to confirm

#### Option 2: Install via Package.swift

Add SnapShield to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/EmadBeyrami/SnapShield.git", from: "1.0.0")
]
```

Then add it to your target dependencies:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["SnapShield"]
    )
]
```

## ⚡ Quick Start

After installing the package, import SnapShield and start protecting your content:

```swift
import SwiftUI
import SnapShield

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Hide content completely
            Text("Password: MySecret123")
                .snapShield()
            
            // Show custom placeholder
            Text("Credit Card: 1234-5678-9012-3456")
                .snapShield {
                    Text("🔒 Protected")
                        .font(.headline)
                }
        }
    }
}
```

That's it! Your sensitive content is now protected from screenshots, screen recordings, and screen sharing.

## 🎮 Example Project

Want to see SnapShield in action? Check out the included example project in the repository!

The example app demonstrates:
- **Basic Protection** - Simple content hiding with `.snapShield()`
- **Custom Placeholders** - Showing custom views during screenshots
- **Bank Card Demo** - Realistic credit card protection with styled placeholder
- **Multiple Protected Views** - Combining different protection strategies in one screen

To run the example:
```bash
git clone https://github.com/EmadBeyrami/SnapShield.git
cd SnapShield
open SnapShieldExample/SnapShieldExample.xcodeproj
```

Then build and run on a simulator or device to test screenshot protection!

> **💡 Tip:** To test the protection, run the app on a real device and try taking screenshots (Power + Volume Up) or start screen recording. You'll see the protected content is replaced with either a blank view or your custom placeholder!

## 📖 Usage

Import SnapShield in your SwiftUI views:

```swift
import SwiftUI
import SnapShield
```

### Basic Usage - Hide Content

Simply hide sensitive content when screenshots or recordings are attempted:

```swift
Text("Secret Password: 12345")
    .snapShield()
```

The content will be completely hidden (blank) during screenshots, screen recordings, or screen sharing.

### Advanced Usage - Custom Placeholder

Show a custom view when content is being captured:

```swift
Text("Credit Card: 1234-5678-9012-3456")
    .snapShield {
        VStack {
            Image(systemName: "lock.shield")
                .font(.system(size: 60))
                .foregroundColor(.red)
            Text("Protected Content")
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
```

## 💡 Examples

### Simple Text Placeholder

```swift
VStack {
    Text("Bank Account: 123456789")
    Text("Balance: $50,000")
}
.snapShield {
    Text("🔒 This content is hidden")
        .font(.title)
        .foregroundColor(.gray)
}
```

### Image Placeholder

```swift
Image("sensitiveDocument")
    .resizable()
    .scaledToFit()
    .snapShield {
        Image("protectedPlaceholder")
            .resizable()
            .scaledToFit()
    }
```

### Styled Placeholder

```swift
PersonalInfoView()
    .snapShield {
        ZStack {
            Color.black
            VStack(spacing: 20) {
                Image(systemName: "eye.slash.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                Text("Content Protected")
                    .font(.title)
                    .foregroundColor(.white)
                Text("This information cannot be captured")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
```

### Bank Card Example

Protect sensitive financial information with a professional placeholder:

```swift
struct BankCardView: View {
    var body: some View {
        // Your card UI design
        ZStack {
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack(alignment: .leading, spacing: 20) {
                Text("4532 1234 5678 9010")
                    .font(.system(size: 24, design: .monospaced))
                Text("JOHN DOE")
                // ... more card details
            }
        }
        .snapShield {
            // Placeholder shown in screenshots
            ZStack {
                LinearGradient(colors: [.gray, .gray.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                VStack(spacing: 15) {
                    Image(systemName: "lock.shield.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                    Text("Card Information Protected")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
```

### Multiple Protected Views

You can protect different sections with different strategies on the same screen:

```swift
ScrollView {
    VStack(spacing: 20) {
        // Section 1: Completely hidden
        VStack {
            Text("Password: super_secret_123")
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .snapShield()
        
        // Section 2: Custom placeholder
        VStack {
            Text("API Key: sk_live_abcd1234efgh5678")
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .snapShield {
            VStack {
                Image(systemName: "key.fill")
                    .font(.largeTitle)
                Text("API Key Hidden")
            }
            .padding()
        }
        
        // Section 3: Not protected (public info)
        VStack {
            Text("Public Info: This is visible in screenshots")
        }
        .padding()
        .background(Color.green.opacity(0.1))
    }
}
```

### Custom View Component

Create reusable placeholder components:

```swift
struct ProtectedPlaceholder: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "hand.raised.fill")
                .font(.system(size: 80))
                .foregroundColor(.red)
            Text("Screenshot Blocked")
                .font(.title2)
                .bold()
            Text("This content is protected for your security")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

// Usage
SensitiveDataView()
    .snapShield {
        ProtectedPlaceholder()
    }
```

### Alert-Style Protection

```swift
VStack(spacing: 15) {
    Image(systemName: "creditcard.fill")
        .font(.system(size: 50))
    Text("Credit Card: 1234-5678-9012-3456")
    Text("CVV: 123")
    Text("Exp: 12/25")
}
.padding()
.snapShield {
    ZStack {
        Color.red.opacity(0.2)
        VStack(spacing: 15) {
            Image(systemName: "exclamationmark.shield.fill")
                .font(.system(size: 60))
                .foregroundColor(.red)
            Text("Protected Content")
                .font(.headline)
            Text("Screenshots are not allowed")
                .font(.caption)
        }
    }
}
```

For more examples, check out the **SnapShieldExample** project in the repository!

## 🔧 How It Works

SnapShield leverages iOS's secure text field behavior to protect your content. When you mark a view with `.snapShield()`:

1. The content is rendered inside a secure container (similar to password fields)
2. During screenshots, screen recordings, or screen sharing, the secure container becomes invisible
3. If you've provided a custom placeholder, it appears in place of the hidden content
4. Normal app usage is unaffected - users see and interact with content normally

This technique works for:
- 📸 **Screenshots** - iOS system screenshots
- 🎥 **Screen Recording** - Built-in screen recording
- 🖥️ **Screen Sharing** - AirPlay, screen mirroring, and video calls

## 📋 Requirements

- iOS 16.0+ / tvOS 16.0+
- Swift 6.2+
- Xcode 16.0+

## 🎯 Use Cases

SnapShield is perfect for protecting:

- 💳 Credit card information
- 🔐 Passwords and authentication codes
- 💰 Bank account details
- 📄 Personal identification documents
- 💊 Medical records
- 📊 Confidential business data
- 🔑 API keys and secrets
- 📱 2FA codes

## ⚠️ Important Notes

> **📝 Note:** This is a clever workaround since Apple doesn't provide an official API for content protection. While it works perfectly now, there's a possibility it might stop working in future iOS updates. I'll do my best to update the package with alternative solutions if that happens! 🛠️

- SnapShield prevents casual content capture but is not a security guarantee
- Determined users with physical access or jailbroken devices may bypass protections
- Use SnapShield as part of a comprehensive security strategy
- Always follow security best practices for handling sensitive data

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Emad Beyrami**

- GitHub: [@EmadBeyrami](https://github.com/EmadBeyrami)
- Repository: [SnapShield](https://github.com/EmadBeyrami/SnapShield)

## 🙏 Acknowledgments

- Inspired by the need for better content protection in modern iOS apps
- Thanks to the Swift community for feedback and suggestions

## 📮 Support

If you have any questions or issues, please:

- 🐛 Open an issue on [GitHub Issues](https://github.com/EmadBeyrami/SnapShield/issues)
- 💬 Start a discussion on [GitHub Discussions](https://github.com/EmadBeyrami/SnapShield/discussions)
- ⭐ Star the repository if you find it useful!

---

Made with ❤️ by [Emad Beyrami](https://github.com/EmadBeyrami)

**⭐ If you find SnapShield useful, please consider giving it a star on [GitHub](https://github.com/EmadBeyrami/SnapShield)! ⭐**
