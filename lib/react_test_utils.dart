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
List findAllInRenderedTree(JsObject tree, JsFunction test) {
  return _TestUtils.callMethod('findAllInRenderedTree', [tree, test]);
}


/// Find a DOM element by tag name expecting a single result.
JsObject findRenderedDOMComponentWithTag(JsObject element, String tag) {
  return _TestUtils.callMethod(
      'findRenderedDOMComponentWithTag', [element, tag]);
}


/// Returns true if element is a composite component.
/// (created with React.createClass()).
bool isCompositeComponent(JsObject element) {
  return _TestUtils.callMethod('isCompositeComponent', [element]);
}


/// Returns true if instance is a composite component.
/// (created with React.createClass()) whose type is of a React componentClass.
bool isCompositeComponentWithClass(JsObject element, JsFunction componentClass) {
  return _TestUtils.callMethod(
      'isCompositeComponentWithclass', [element, componentClass]);
}


/// Returns true if instance is a DOM component (such as a <div> or <span>).
bool isDOMComponent(Element element) {
  return _TestUtils.callMethod('isDOMComponent', [element]);
}

/// Returns [true] if element is any ReactElement.
bool isElement(element) {
  return _TestUtils.callMethod('isElement', [element]);
}

/// Returns true if element is a ReactElement whose type is of a React componentClass.
bool isElementOfType(JsObject element, JsFunction componentClass) {
  return _TestUtils.callMethod('isElementOfType', [componentClass]);
}


/// Returns true if instance is a plain text component.
bool isTextComponent(JsObject element) {
  return _TestUtils.callMethod('isTextComponent', [element]);
}


/// Finds all instances of components in the rendered tree that are DOM
/// components with the class name matching className.
List scryRenderedDOMComponentsWithClass(JsObject tree, String className) {
  return _TestUtils.callMethod(
      'scryRenderedDOMComponentsWithClass', [tree, className]);
}

// TODO: continue making methods from this point


// Render a [Component] into a detached DOM node in the document.
JsObject renderIntoDocument(Component instance) {
  var div = new DivElement();
  return _TestUtils.callMethod('renderIntoDocument', [instance, div]);
}


// TODO: Would making a sub-class of JsObject be a better solution?
Element getDomNode(JsObject object) => object.callMethod('getDOMNode', []);
// TODO: mockComponent
// TODO: isElement
// TODO: isElementOfType
// TODO: isDOMComponent
// TODO: isCompositeComponent
// TODO: isCompositeComponentWithType
// TODO: isTextComponent
// TODO: findAllInRenderedTree
// TODO: scryRenderedDOMComponentsWithClass
// TODO: findRenderedDOMComponentWithClass
// TODO: scryRenderedDOMComponentsWithTag
// TODO: scryRenderedComponentsWithType
// TODO: findRenderedComponentWithType