<img src="https://github.com/ShivanshGaur6096/WalkAround/assets/39719492/5e3e0ab4-ffb8-4bec-ac93-fb614c22648c.png" width="10%" height="10%"> 

# WalkAround - Online Shopping iOS Application

<img src="https://github.com/ShivanshGaur6096/WalkAround/assets/39719492/e3486d29-f97e-4b5e-a40a-d592a0b9a1a4.png" width="35%" height="35%">
<img src="https://github.com/ShivanshGaur6096/WalkAround/assets/39719492/500072c0-d38e-412c-b9ed-def3c069ba38.png" width="35%" height="35%">
<img src="https://github.com/ShivanshGaur6096/WalkAround/assets/39719492/3122c957-b6a3-4e35-9701-20b0f654cb25.png" width="35%" height="35%">
<img src="https://github.com/ShivanshGaur6096/WalkAround/assets/39719492/4f1880b7-4b52-4d10-a74c-23a167261e10.png" width="35%" height="35%">


## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Features](#features)
- [Upcoming Features](#upcomingfeatures)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Architecture](#architecture)
- [Dependencies](#dependencies)
- [Usage - InApp Purchase](#usage)
- [Contributing](#contributing)

## Introduction
Welcome to WalkAround, your go-to online shopping companion for iOS! This iOS application is designed to provide a seamless and enjoyable shopping experience for users. It's built with Swift 5.0 and supports iOS devices running version 15.2 and above. The app utilizes the Model-View-ViewModel (MVVM) architecture for maintainability and robustness.

WalkAround leverages the Kingfisher 7.7.0 library to efficiently download and cache product images, ensuring swift loading and smooth browsing. Additionally, we've included a custom color extension that allows you to easily specify colors using hex values.

## Requirements
- iOS 15.2+
- Xcode 12.0+
- Swift 5.0

## Features
- User-friendly online shopping interface.
- Efficient image loading and caching using Kingfisher.
- In-App Purchase of Prime membership.
- Product catalog with detailed descriptions.
- Custom color extension for simple hex value color usage.
- Using Constants file reduce the amount of mistakes such as typing in the wrong code and access file globally
- All the images used in this app were AI generated from [Playground AI](https://playgroundai.com/)

## Upcoming Features
- Seamless navigation and checkout process.
- Wishlist and cart management.
- Payment and App Security Animations.
- Animations

## Getting Started

### Prerequisites
Make sure you have the following software installed on your development machine:

- [Xcode](https://developer.apple.com/xcode/)
- [Swift](https://swift.org/download/)

### Installation
1. Clone this repository to your local machine.

```shell
git clone https://github.com/ShivanshGaur6096/WalkAround.git
```

2. Open the project in Xcode.

3. Build and run the application on your iOS device or simulator.

## Architecture
WalkAround follows the Model-View-ViewModel (MVVM) architecture pattern to separate concerns and improve code maintainability. The key components include:

- **Model:** Represents the data and business logic of the application.
- **View:** Displays the user interface elements and responds to user interactions.
- **ViewModel:** Acts as an intermediary between the Model and View, providing data and handling user input.

The MVVM architecture promotes code reusability and testability.

## Dependencies
WalkAround relies on the following external libraries:

- **Kingfisher 7.7.0:** Used for efficient image downloading and caching.

## Usage
Feel free to use and customize WalkAround for your own online shopping project. You can easily modify the product catalog, appearance, and behavior to suit your needs.

### InAppPurchase Usage
To add your own product 
```
import StoreKit
// Add your own product here and add it in Configuration.storekit to test it on simulator
    enum Product: String, CaseIterable {
        case becomePrimeMember = "com.myapp.primeMembership"
        case buyEarlyAccessPass = "com.myapp.earlyAccessPass"
    }
```
To use InApp purchase and see the product listen in Configuration file. 
Edit Scheme > Run(Degug) > Options > Select Configuration.storekit file in StoreKit configuration.
and to manage transactions go to Xcode Debug > StoreKit > Manage Transactions...

### Colour Extension Usage
To use the custom color extension, simply import the extension file and use it to define colors in your app using hex values.

```swift
import UIKit

let customColor = UIColor(hex: 0xRRGGBB)
```

## Contributing
We welcome contributions to make WalkAround even better. If you have ideas, bug fixes, or new features to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and test thoroughly.
4. Create a pull request with a clear description of your changes.
---

Thank you for choosing WalkAround for your online shopping app development. If you have any questions or need further assistance, please don't hesitate to [contact us](mailto:shivanshgaur96@gmail.com). Happy coding!
