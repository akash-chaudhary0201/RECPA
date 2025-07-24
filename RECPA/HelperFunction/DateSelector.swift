import UIKit

class DatePickerHelper {
    
    static func showCenteredDatePicker(
        on viewController: UIViewController,
        dateFormat: String = "dd MMM yyyy",
        onDateSelected: @escaping (String) -> Void
    ) {
        // Background overlay
        let overlayView = UIView()
        overlayView.frame = viewController.view.bounds
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        overlayView.alpha = 0
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        
        // Container for date picker
        let containerView = UIView()
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.translatesAutoresizingMaskIntoConstraints = false

        // Date Picker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(datePicker)
        overlayView.addSubview(containerView)
        viewController.view.addSubview(overlayView)

        // Constraints for date picker in container
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            datePicker.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            datePicker.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            datePicker.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])

        // Constraints for centered container
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 320)
        ])

        // Constraints for overlay
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            overlayView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor),
            overlayView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor)
        ])

        // Fade-in animation
        UIView.animate(withDuration: 0.25) {
            overlayView.alpha = 1
        }

        // Handle date selection
        datePicker.addAction(UIAction { _ in
            let formatter = DateFormatter()
            formatter.dateFormat = dateFormat
            let formatted = formatter.string(from: datePicker.date)

            onDateSelected(formatted)

            // Fade out and remove
            UIView.animate(withDuration: 0.25, animations: {
                overlayView.alpha = 0
            }, completion: { _ in
                overlayView.removeFromSuperview()
            })
        }, for: .valueChanged)
    }
}
