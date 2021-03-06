import ReactiveCocoa
import Result
import UIKit

private enum Associations {
  private static var attributedText = 0
  private static var font = 1
  private static var text = 2
  private static var textColor = 3
}

public extension Rac where Object: UILabel {
  public var attributedText: Signal<NSAttributedString, NoError> {
    nonmutating set {
      let prop: MutableProperty<NSAttributedString> = lazyMutableProperty(
        object,
        key: &Associations.attributedText,
        setter: { [weak object] in object?.attributedText = $0 },
        getter: { [weak object] in object?.attributedText ?? .init(string: "") })

      prop <~ newValue.observeForUI()
    }

    get {
      return .empty
    }
  }

  public var text: Signal<String, NoError> {
    nonmutating set {
      let prop: MutableProperty<String> = lazyMutableProperty(
        object,
        key: &Associations.text,
        setter: { [weak object] in object?.text = $0 },
        getter: { [weak object] in object?.text ?? "" })

      prop <~ newValue.observeForUI()
    }

    get {
      return .empty
    }
  }

  public var font: Signal<UIFont, NoError> {
    nonmutating set {
      let prop: MutableProperty<UIFont> = lazyMutableProperty(
        object,
        key: &Associations.font,
        setter: { [weak object] in object?.font = $0 },
        getter: { [weak object] in object?.font ?? .systemFontOfSize(12.0) })

      prop <~ newValue.observeForUI()
    }

    get {
      return .empty
    }
  }

  public var textColor: Signal<UIColor, NoError> {
    nonmutating set {
      let prop: MutableProperty<UIColor> = lazyMutableProperty(
        object,
        key: &Associations.textColor,
        setter: { [weak object] in object?.textColor = $0 },
        getter: { [weak object] in object?.textColor ?? .blackColor() })

      prop <~ newValue.observeForUI()
    }

    get {
      return .empty
    }
  }
}
