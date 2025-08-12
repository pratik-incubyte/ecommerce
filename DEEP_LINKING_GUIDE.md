# Deep Linking Implementation Guide

## Overview
This e-commerce app supports comprehensive deep linking functionality, allowing users to navigate directly to specific content via URLs or app links.

## Supported Deep Link Patterns

### Custom Scheme Links (ecommerce://)
- **Products**: `ecommerce://products/[productId]`
- **Cart**: `ecommerce://cart`
- **Checkout**: `ecommerce://cart/checkout?promo=[promoCode]`
- **Orders**: `ecommerce://orders/[orderId]`
- **Order Tracking**: `ecommerce://orders/[orderId]/track`
- **Profile**: `ecommerce://profile`
- **Wishlist**: `ecommerce://wishlist`
- **Deals**: `ecommerce://deals?category=[categoryName]`
- **Search**: `ecommerce://home/search?q=[searchQuery]`
- **Category**: `ecommerce://home/category/[categoryId]?name=[categoryName]`

### HTTPS Links (Universal/App Links)
Replace `ecommerce.example.com` with your actual domain:
- **Products**: `https://ecommerce.example.com/products/[productId]`
- **Share Product**: `https://ecommerce.example.com/share/product/[productId]`
- **Promo Campaigns**: `https://ecommerce.example.com/promo/[promoCode]`
- **Email Verification**: `https://ecommerce.example.com/verify-email?token=[token]`
- **Password Reset**: `https://ecommerce.example.com/reset-password?token=[token]`

## Testing Deep Links

### Android Testing
```bash
# Test product deep link
adb shell am start -W -a android.intent.action.VIEW -d "ecommerce://products/123" com.example.ecommerce

# Test promo code deep link
adb shell am start -W -a android.intent.action.VIEW -d "ecommerce://promo/SUMMER2024" com.example.ecommerce

# Test order tracking
adb shell am start -W -a android.intent.action.VIEW -d "ecommerce://orders/ORD-456/track" com.example.ecommerce

# Test search with query
adb shell am start -W -a android.intent.action.VIEW -d "ecommerce://home/search?q=shoes" com.example.ecommerce

# Test HTTPS link
adb shell am start -W -a android.intent.action.VIEW -d "https://ecommerce.example.com/products/789" com.example.ecommerce
```

### iOS Testing
```bash
# Test using xcrun simctl (iOS Simulator)
xcrun simctl openurl booted "ecommerce://products/123"
xcrun simctl openurl booted "ecommerce://cart/checkout?promo=SAVE20"
xcrun simctl openurl booted "ecommerce://orders/ORD-789"

# Test HTTPS links
xcrun simctl openurl booted "https://ecommerce.example.com/share/product/456"
```

### Testing in Flutter
```bash
# Run the app with a deep link
flutter run --route="/products/123"
flutter run --route="/cart/checkout?promo=WELCOME10"
```

## Authentication Flow with Deep Links

Protected routes automatically redirect to login when accessed without authentication:
1. User clicks: `ecommerce://orders/123`
2. If not authenticated, redirects to: `/login?redirect=/orders/123`
3. After successful login, user is redirected to original destination

## Share Functionality

Products can be shared using special share links that track referrals:
- Share URL: `https://ecommerce.example.com/share/product/[productId]`
- Redirects to: `/products/[productId]?ref=share`

## Promo Code Integration

Direct checkout with promo codes:
- Link: `ecommerce://promo/SUMMER2024`
- Redirects to: `/cart/checkout?promo=SUMMER2024`

## Implementation Details

### Android Configuration
Located in `android/app/src/main/AndroidManifest.xml`:
- Custom scheme: `ecommerce`
- HTTPS host: `ecommerce.example.com`
- Auto-verification enabled for App Links

### iOS Configuration
Located in `ios/Runner/Info.plist`:
- URL Scheme: `ecommerce`
- Bundle URL Name: `com.example.ecommerce`
- Associated domains for Universal Links

### Router Configuration
The app uses GoRouter with:
- Named routes for easy navigation
- Query parameter support
- Path parameters for dynamic content
- Authentication guards for protected routes
- Redirect handlers for special links

## Marketing Campaign Examples

### Email Campaigns
```html
<!-- Product promotion -->
<a href="https://ecommerce.example.com/products/PROD-2024">View Product</a>

<!-- Discount campaign -->
<a href="https://ecommerce.example.com/promo/BLACKFRIDAY">Get 50% Off</a>

<!-- Category deals -->
<a href="https://ecommerce.example.com/deals?category=electronics">Electronics Sale</a>
```

### Social Media Sharing
```javascript
// Share product on social media
const shareUrl = 'https://ecommerce.example.com/share/product/ABC123';
const message = 'Check out this amazing product!';
```

### QR Codes
Generate QR codes for:
- `ecommerce://products/[productId]` - Direct product access
- `ecommerce://promo/[code]` - Instant discount application
- `ecommerce://cart` - Quick cart access

## Production Setup

### 1. Domain Configuration
Replace `ecommerce.example.com` with your actual domain in:
- `android/app/src/main/AndroidManifest.xml`
- `ios/Runner/Info.plist`
- Router configuration

### 2. Apple App Site Association (iOS)
Host this file at `https://yourdomain.com/.well-known/apple-app-site-association`:
```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "TEAMID.com.example.ecommerce",
        "paths": [
          "/products/*",
          "/share/*",
          "/promo/*",
          "/verify-email",
          "/reset-password"
        ]
      }
    ]
  }
}
```

### 3. Android App Links (assetlinks.json)
Host this file at `https://yourdomain.com/.well-known/assetlinks.json`:
```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.example.ecommerce",
      "sha256_cert_fingerprints": ["YOUR_APP_SIGNING_CERTIFICATE_SHA256"]
    }
  }
]
```

## Troubleshooting

### Common Issues

1. **Deep links not working on Android**
   - Verify package name matches in AndroidManifest.xml
   - Check if app is installed
   - Ensure intent filters are properly configured

2. **Universal Links not working on iOS**
   - Verify Associated Domains entitlement
   - Check apple-app-site-association file is accessible
   - Ensure proper Team ID and Bundle ID

3. **Authentication redirects failing**
   - Check redirect parameter encoding
   - Verify auth state management
   - Ensure protected routes are properly configured

### Debug Mode
Enable GoRouter debug logging:
```dart
GoRouter(
  debugLogDiagnostics: true,
  // ... other configuration
)
```

## Analytics Integration

Track deep link usage:
```dart
// In router configuration
redirect: (context, state) {
  // Track deep link source
  if (state.uri.queryParameters.containsKey('ref')) {
    analytics.logEvent('deep_link_opened', {
      'source': state.uri.queryParameters['ref'],
      'path': state.matchedLocation,
    });
  }
  // ... rest of redirect logic
}
```

## Security Considerations

1. **Validate tokens**: Always validate email verification and password reset tokens server-side
2. **Sanitize parameters**: Sanitize all query parameters and path parameters
3. **Rate limiting**: Implement rate limiting for sensitive deep links
4. **HTTPS only**: Use HTTPS for production Universal/App Links
5. **Authentication**: Properly secure protected routes

## Support

For issues or questions about deep linking:
1. Check GoRouter logs with `debugLogDiagnostics: true`
2. Verify platform-specific configurations
3. Test with adb (Android) or xcrun (iOS) commands
4. Review authentication flow for protected routes