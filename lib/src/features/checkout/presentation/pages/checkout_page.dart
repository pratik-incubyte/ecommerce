import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';

import 'package:ecommerce/src/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/address.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/checkout.dart';
import 'package:ecommerce/src/features/checkout/presentation/widgets/checkout_step_indicator.dart';
import 'package:ecommerce/src/features/checkout/presentation/widgets/steps/address_step.dart';
import 'package:ecommerce/src/features/checkout/presentation/widgets/steps/shipping_step.dart';
import 'package:ecommerce/src/features/checkout/presentation/widgets/steps/payment_step.dart';
import 'package:ecommerce/src/features/checkout/presentation/widgets/steps/review_step.dart';

/// Checkout page for processing orders
class CheckoutPage extends StatefulWidget {
  final String userId;

  const CheckoutPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _promoCodeController = TextEditingController();

  String _selectedShippingMethod = 'standard';
  String _selectedPaymentMethod = 'credit_card';

  Timer? _debounceTimer;
  bool _isInitialized = false;
  int _currentStep = 0;

  final List<String> _stepTitles = ['Address', 'Shipping', 'Payment', 'Review'];

  @override
  void initState() {
    super.initState();
    // Set dummy prefilled address values for testing
    _firstNameController.text = 'John';
    _lastNameController.text = 'Doe';
    _addressLine1Controller.text = '123 Main Street';
    _addressLine2Controller.text = 'Apt 4B';
    _cityController.text = 'New York';
    _stateController.text = 'NY';
    _postalCodeController.text = '10001';
    _countryController.text = 'United States';
  }

  void _initializeAfterBuild() {
    // Initialize checkout calculation after widget is built and BlocProvider is available
    if (!_isInitialized && mounted) {
      _isInitialized = true;
      _calculateCheckoutDebounced();
    }
  }

  void _calculateCheckoutDebounced() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted && _isInitialized) {
        _calculateCheckout();
      }
    });
  }

  void _calculateCheckout() {
    // Only calculate if the widget is properly initialized and mounted
    if (!mounted || !_isInitialized) return;

    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final address1 = _addressLine1Controller.text.trim();
    final city = _cityController.text.trim();
    final state = _stateController.text.trim();
    final postal = _postalCodeController.text.trim();
    final country = _countryController.text.trim();

    // Debug: Check which fields are filled
    // print('CheckoutPage - Address validation: firstName=${firstName.isNotEmpty}, lastName=${lastName.isNotEmpty}, address1=${address1.isNotEmpty}, city=${city.isNotEmpty}, state=${state.isNotEmpty}, postal=${postal.isNotEmpty}, country=${country.isNotEmpty}');

    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        address1.isNotEmpty &&
        city.isNotEmpty &&
        state.isNotEmpty &&
        postal.isNotEmpty &&
        country.isNotEmpty) {
      final address = _buildAddress();
      // print('CheckoutPage - All required fields filled, dispatching calculation');

      // Use a post-frame callback to ensure the BLoC event is triggered safely
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<CheckoutBloc>().add(
            CheckoutEvent.calculateCheckout(
              userId: widget.userId.toString(), // Ensure userId is string
              shippingMethod: _selectedShippingMethod,
              shippingAddress: address.toMap(),
              promoCode: _promoCodeController.text.trim().isNotEmpty
                  ? _promoCodeController.text.trim()
                  : null,
            ),
          );
        }
      });
    } else {
      print('CheckoutPage - Missing required fields, not calculating');
    }
  }

  Address _buildAddress() {
    return Address(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      addressLine1: _addressLine1Controller.text,
      addressLine2: _addressLine2Controller.text.isNotEmpty
          ? _addressLine2Controller.text
          : null,
      city: _cityController.text,
      state: _stateController.text,
      postalCode: _postalCodeController.text,
      country: _countryController.text,
    );
  }

  void _processCheckout(Checkout checkout) {
    // Process payment first
    context.read<CheckoutBloc>().add(
      CheckoutEvent.processPayment(
        paymentMethod: _selectedPaymentMethod,
        amount: checkout.totalAmount,
        paymentDetails: {
          'cardNumber': '4111111111111111', // Dummy card
          'expiryMonth': '12',
          'expiryYear': '2025',
          'cvv': '123',
          'cardHolderName':
              '${_firstNameController.text} ${_lastNameController.text}',
        },
      ),
    );
  }

  void _handleCheckout(CheckoutState state) {
    try {
      state.when(
        initial: () {
          if (_canProceedFromAddressStep()) {
            _calculateCheckout();
          } else {
            _showErrorMessage('Please complete all required fields');
          }
        },
        calculating: () {
          _showInfoMessage('Calculating order details...');
        },
        calculated: (checkout, _) {
          _processCheckout(checkout);
        },
        shippingMethodsLoaded: (_, checkout) {
          if (checkout != null) {
            _processCheckout(checkout);
          } else {
            _calculateCheckout();
          }
        },
        addressValidated: (_, __, checkout) {
          if (checkout != null) {
            _processCheckout(checkout);
          } else {
            _calculateCheckout();
          }
        },
        processingPayment: (_) {
          // Already processing payment - do nothing
        },
        paymentProcessed: (_, checkout) => _processCheckout(checkout),
        completingCheckout: (_, __) {
          // Already completing checkout - do nothing
        },
        checkoutCompleted: (_) {
          // Already completed - do nothing
        },
        error: (message, checkout) {
          if (checkout != null) {
            _processCheckout(checkout);
          } else {
            // Try to calculate if we have valid address data
            if (_canProceedFromAddressStep()) {
              _calculateCheckout();
            } else {
              _showErrorMessage('Error: $message');
            }
          }
        },
        promoCodeApplied: (_, checkout) => _processCheckout(checkout),
        promoCodeRemoved: (checkout) => _processCheckout(checkout),
      );
    } catch (e) {
      debugPrint('CheckoutPage: Error in _handleCheckout - $e');
      _showErrorMessage('An error occurred. Please try again.');
    }
  }

  void _showErrorMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _showInfoMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
      );
    }
  }

  void _goToNextStep() {
    if (_currentStep < _stepTitles.length - 1) {
      setState(() {
        _currentStep++;
      });

      // Trigger checkout calculation when reaching the review step
      if (_currentStep == 3 && _canProceedFromAddressStep()) {
        _calculateCheckout();
      }
    }
  }

  void _goToPreviousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  bool _canProceedFromAddressStep() {
    final canProceed =
        _firstNameController.text.trim().isNotEmpty &&
        _lastNameController.text.trim().isNotEmpty &&
        _addressLine1Controller.text.trim().isNotEmpty &&
        _cityController.text.trim().isNotEmpty &&
        _stateController.text.trim().isNotEmpty &&
        _postalCodeController.text.trim().isNotEmpty &&
        _countryController.text.trim().isNotEmpty;

    // print('CheckoutPage - Can proceed from address step: $canProceed');
    return canProceed;
  }

  Widget _buildCurrentStep(CheckoutState state) {
    switch (_currentStep) {
      case 0:
        return AddressStep(
          formKey: _formKey,
          firstNameController: _firstNameController,
          lastNameController: _lastNameController,
          addressLine1Controller: _addressLine1Controller,
          addressLine2Controller: _addressLine2Controller,
          cityController: _cityController,
          stateController: _stateController,
          postalCodeController: _postalCodeController,
          countryController: _countryController,
          onChanged: () {
            setState(() {}); // Trigger rebuild to update button state
            _calculateCheckoutDebounced();
          },
          onNext: () {
            if (_canProceedFromAddressStep()) {
              _goToNextStep();
            }
          },
          canProceed: _canProceedFromAddressStep(),
        );
      case 1:
        return ShippingStep(
          selectedShippingMethod: _selectedShippingMethod,
          onShippingMethodChanged: (value) {
            setState(() {
              _selectedShippingMethod = value;
            });
            _calculateCheckoutDebounced();
          },
          onNext: _goToNextStep,
          onBack: _goToPreviousStep,
        );
      case 2:
        return PaymentStep(
          selectedPaymentMethod: _selectedPaymentMethod,
          onPaymentMethodChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value;
            });
          },
          promoCodeController: _promoCodeController,
          onPromoCodeChanged: () {
            setState(() {}); // Trigger rebuild for promo code changes
            _calculateCheckoutDebounced();
          },
          onNext: _goToNextStep,
          onBack: _goToPreviousStep,
        );
      case 3:
        return ReviewStep(
          state: state,
          formKey: _formKey,
          shippingAddress: _buildAddress(),
          selectedShippingMethod: _selectedShippingMethod,
          selectedPaymentMethod: _selectedPaymentMethod,
          promoCode: _promoCodeController.text.trim(),
          onPlaceOrder: () => _handleCheckout(state),
          onBack: _goToPreviousStep,
          onNavigateBack: () => Navigator.of(context).pop(),
          onTriggerCalculation: _calculateCheckout,
        );
      default:
        return AddressStep(
          formKey: _formKey,
          firstNameController: _firstNameController,
          lastNameController: _lastNameController,
          addressLine1Controller: _addressLine1Controller,
          addressLine2Controller: _addressLine2Controller,
          cityController: _cityController,
          stateController: _stateController,
          postalCodeController: _postalCodeController,
          countryController: _countryController,
          onChanged: () {
            setState(() {}); // Trigger rebuild to update button state
            _calculateCheckoutDebounced();
          },
          onNext: () {
            if (_canProceedFromAddressStep()) {
              _goToNextStep();
            }
          },
          canProceed: _canProceedFromAddressStep(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.titleLarge?.color,
      ),
      body: BlocConsumer<CheckoutBloc, CheckoutState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            calculating: () {},
            calculated: (checkout, _) {},
            shippingMethodsLoaded: (_, __) {},
            addressValidated: (_, __, ___) {},
            promoCodeApplied: (_, __) {},
            promoCodeRemoved: (_) {},
            processingPayment: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing payment...')),
              );
            },
            paymentProcessed: (paymentResult, checkout) {
              // Complete checkout after successful payment
              context.read<CheckoutBloc>().add(
                CheckoutEvent.completeCheckout(
                  checkout: checkout,
                  paymentResult: paymentResult,
                ),
              );
            },
            completingCheckout: (_, __) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Completing your order...')),
              );
            },
            checkoutCompleted: (order) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Order #${order.id} placed successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              
              // Force a frame to render to ensure button state is updated
              WidgetsBinding.instance.addPostFrameCallback((_) {
                // Add a longer delay to ensure UI updates are visible
                Future.delayed(const Duration(milliseconds: 1000), () {
                  if (mounted) {
                    GoRouter.of(context).goNamed('orders');
                  }
                });
              });
            },
            error: (message, _) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
          );
        },
        builder: (context, state) {
          // Initialize after BlocProvider is available
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _initializeAfterBuild(),
          );
          return Column(
            children: [
              // Step indicator
              CheckoutStepIndicator(
                currentStep: _currentStep,
                stepTitles: _stepTitles,
              ),

              // Current step content
              Expanded(
                child: Form(key: _formKey, child: _buildCurrentStep(state)),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    _promoCodeController.dispose();
    super.dispose();
  }
}
