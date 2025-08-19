import 'package:flutter/material.dart';
import 'package:ecommerce/src/core/constants/app_constants.dart';

/// Step indicator widget for checkout process
class CheckoutStepIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> stepTitles;
  final VoidCallback? onStepTapped;

  const CheckoutStepIndicator({
    Key? key,
    required this.currentStep,
    required this.stepTitles,
    this.onStepTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.smallPadding,
      ),
      child: Row(
        children: List.generate(
          stepTitles.length,
          (index) => Expanded(
            child: _buildStepItem(
              context,
              index,
              stepTitles[index],
              isLast: index == stepTitles.length - 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepItem(
    BuildContext context,
    int index,
    String title,
    {required bool isLast}
  ) {
    final isActive = index == currentStep;
    final isCompleted = index < currentStep;
    final isUpcoming = index > currentStep;

    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Step circle
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getStepColor(context, isActive, isCompleted),
                  border: Border.all(
                    color: _getStepBorderColor(context, isActive, isCompleted, isUpcoming),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: _getStepTextColor(context, isActive, isCompleted),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 6),
              // Step title
              Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  color: _getStepTitleColor(context, isActive, isCompleted, isUpcoming),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        // Connector line (except for last item)
        if (!isLast)
          Expanded(
            child: Container(
              height: 2,
              margin: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 20, // Offset to align with circles
              ),
              color: isCompleted
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            ),
          ),
      ],
    );
  }

  Color _getStepColor(BuildContext context, bool isActive, bool isCompleted) {
    if (isCompleted) return Theme.of(context).primaryColor;
    if (isActive) return Theme.of(context).primaryColor.withOpacity(0.1);
    return Colors.transparent;
  }

  Color _getStepBorderColor(
    BuildContext context,
    bool isActive,
    bool isCompleted,
    bool isUpcoming,
  ) {
    if (isCompleted || isActive) return Theme.of(context).primaryColor;
    return Colors.grey.shade300;
  }

  Color _getStepTextColor(BuildContext context, bool isActive, bool isCompleted) {
    if (isCompleted) return Colors.white;
    if (isActive) return Theme.of(context).primaryColor;
    return Colors.grey.shade600;
  }

  Color _getStepTitleColor(
    BuildContext context,
    bool isActive,
    bool isCompleted,
    bool isUpcoming,
  ) {
    if (isCompleted || isActive) return Theme.of(context).primaryColor;
    return Colors.grey.shade600;
  }
}
