library react.test_utils;

import 'dart:html';
import 'package:react/react.dart';
import 'dart:js';


JsObject _TestUtils = context['React']['addons']['TestUtils'];
JsObject _Simulate = _TestUtils['Simulate'];


/// Event simulation interface.
///
/// Provides methods for each type of event that can be handled by a React
/// component.  All methods are used in the same way:
///
///   Simulate.{eventName}([JsObject] element, [Map] eventData)
///
/// This should include all events documented at:
/// http://facebook.github.io/react/docs/events.html
class Simulate {

  static blur(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('blur', [element, eventData]);

  static change(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('change', [element, eventData]);

  static click(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('click', [element, eventData]);
      
  static contextMenu(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('contextMenu', [element, eventData]);
      
  static copy(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('copy', [element, eventData]);
      
  static cut(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('cut', [element, eventData]);
      
  static doubleClick(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('doubleClick', [element, eventData]);
      
  static drag(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('drag', [element, eventData]);
      
  static dragEnd(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('dragEnd', [element, eventData]);
      
  static dragEnter(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('dragEnter', [element, eventData]);

  static dragExit(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('dragExit', [element, eventData]);

  static dragLeave(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('dragLeave', [element, eventData]);

  static dragOver(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('dragOver', [element, eventData]);

  static dragStart(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('dragStart', [element, eventData]);

  static drop(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('drop', [element, eventData]);

  static focus(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('focus', [element, eventData]);

  static input(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('input', [element, eventData]);

  static keyDown(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('keyDown', [element, eventData]);

  static keyPress(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('keyPress', [element, eventData]);

  static keyUp(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('keyUp', [element, eventData]);

  static mouseDown(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('mouseDown', [element, eventData]);

  static mouseMove(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('mouseMove', [element, eventData]);

  static mouseOut(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('mouseOut', [element, eventData]);

  static mouseOver(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('mouseOver', [element, eventData]);

  static mouseUp(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('mouseUp', [element, eventData]);

  static paste(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('paste', [element, eventData]);

  static scroll(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('scroll', [element, eventData]);

  static submit(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('submit', [element, eventData]);

  static touchCancel(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('touchCancel', [element, eventData]);

  static touchEnd(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('touchEnd', [element, eventData]);

  static touchMove(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('touchMove', [element, eventData]);

  static touchStart(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('touchStart', [element, eventData]);

  static wheel(JsObject element, [Map eventData = const{}]) =>
      _Simulate.callMethod('wheel', [element, eventData]);

}

/// Traverse all components in tree and accumulate all components where
/// test(component) is true. This is not that useful on its own, but it's
/// used as a primitive for other test utils
///
/// Included in Dart for completeness
List findAllInRenderedTree(JsObject inst, JsFunction test) {
  return _TestUtils.callMethod('findAllInRenderedTree', [inst, test]);
}

/// Like scryRenderedDOMComponentsWithClass() but expects there to be one
/// result, and returns that one result, or throws exception if there is
/// any other number of matches besides one.
JsObject findRenderedDOMComponentWithClass(JsObject root, String className) {
  return _TestUtils.callMethod(
      'findRenderedDOMComponentWithClass', [root, className]);
}

/// Like scryRenderedDOMComponentsWithTag() but expects there to be one result,
/// and returns that one result, or throws exception if there is any other
/// number of matches besides one.
JsObject findRenderedDOMComponentWithTag(JsObject element, String tag) {
  return _TestUtils.callMethod(
      'findRenderedDOMComponentWithTag', [element, tag]);
}

/// Same as scryRenderedComponentsWithType() but expects there to be one result
/// and returns that one result, or throws exception if there is any other
/// number of matches besides one.
JsObject findRenderedComponentWithType(JsObject root, JsObject componentType) {
  return _TestUtils.callMethod(
      'findRenderedComponentWithType', [root, componentType]);
}

/// Returns true if element is a composite component.
/// (created with React.createClass()).
bool isCompositeComponent(JsObject element) {
  return _TestUtils.callMethod('isCompositeComponent', [element]);
}

/// Returns true if instance is a composite component.
/// (created with React.createClass()) whose type is of a React componentClass.
bool isCompositeComponentWithType(JsObject element, JsFunction componentClass) {
  return _TestUtils.callMethod(
      'isCompositeComponentWithType', [element, componentClass]);
}

/// Returns true if instance is a DOM component (such as a <div> or <span>).
bool isDOMComponent(Element element) {
  return _TestUtils.callMethod('isDOMComponent', [element]);
}

/// Returns true if element is any ReactElement.
bool isElement(element) {
  return _TestUtils.callMethod('isElement', [element]);
}

/// Returns true if element is a ReactElement whose type is of a
/// React componentClass.
bool isElementOfType(JsObject element, JsFunction componentClass) {
  return _TestUtils.callMethod('isElementOfType', [element, componentClass]);
}

/// Finds all instances of components with type equal to componentClass.
JsObject scryRenderedComponentsWithType(JsObject root, JsObject componentType) {
  return _TestUtils.callMethod(
      'scryRenderedComponentsWithType', [root, componentType]);
}

/// Finds all instances of components in the rendered tree that are DOM
/// components with the class name matching className.
List scryRenderedDOMComponentsWithClass(JsObject root, String className) {
  return _TestUtils.callMethod(
      'scryRenderedDOMComponentsWithClass', [root, className]);
}

/// Finds all instances of components in the rendered tree that are DOM
/// components with the tag name matching tagName.
JsObject scryRenderedDOMComponentsWithTag(JsObject root, String tagName) {
  return _TestUtils.callMethod(
      'scryRenderedDOMComponentsWithTag', [root, tagName]);
}

/// Render a Component into a detached DOM node in the document.
JsObject renderIntoDocument(Component instance) {
  var div = new DivElement();
  return _TestUtils.callMethod('renderIntoDocument', [instance, div]);
}

Element getDomNode(JsObject object) => object.callMethod('getDOMNode', []);

/// Pass a mocked component module to this method to augment it with useful
/// methods that allow it to be used as a dummy React component. Instead of
/// rendering as usual, the component will become a simple <div> (or other tag
/// if mockTagName is provided) containing any provided children.
JsObject mockComponent(JsObject module, String mockTagName) {
  return _TestUtils.callMethod(
      'mockComponent', [module, mockTagName]);
}