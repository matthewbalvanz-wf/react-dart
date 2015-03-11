import 'dart:js';

import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';
import 'package:react/react_client.dart' as reactClient;
import 'package:react/react_test_utils.dart';

import 'test_components.dart';


void main() {

  useHtmlConfiguration();
  reactClient.setClientConfiguration();

  var component;
  var domNode;

  void testEvent(Function event) {
    component = renderIntoDocument(eventComponent({}));
    domNode = getDomNode(component);
    expect(domNode.text, equals(''));
    event(findRenderedDOMComponentWithTag(component, 'div'));
    expect(domNode.text, equals('success'));
  }

  group('Simulate event', () {
    tearDown(() {
      component = null;
      domNode = null;
    });

    test('blur', () => testEvent(Simulate.blur));
    test('change', () => testEvent(Simulate.change));
    test('click', () => testEvent(Simulate.click));
    test('copy', () => testEvent(Simulate.copy));
    test('cut', () => testEvent(Simulate.cut));
    test('doubleClick', () => testEvent(Simulate.doubleClick));
    test('drag', () => testEvent(Simulate.drag));
    test('dragEnd', () => testEvent(Simulate.dragEnd));
    test('dragEnter', () => testEvent(Simulate.dragEnter));
    test('dragExit', () => testEvent(Simulate.dragExit));
    test('dragLeave', () => testEvent(Simulate.dragLeave));
    test('dragOver', () => testEvent(Simulate.dragOver));
    test('dragStart', () => testEvent(Simulate.dragStart));
    test('drop', () => testEvent(Simulate.drop));
    test('focus', () => testEvent(Simulate.focus));
    test('input', () => testEvent(Simulate.input));
    test('keyDown', () => testEvent(Simulate.keyDown));
    test('keyPress', () => testEvent(Simulate.keyPress));
    test('keyUp', () => testEvent(Simulate.keyUp));
    test('mouseDown', () => testEvent(Simulate.mouseDown));
    test('mouseMove', () => testEvent(Simulate.mouseMove));
    test('mouseOut', () => testEvent(Simulate.mouseOut));
    test('mouseOver', () => testEvent(Simulate.mouseOver));
    test('mouseUp', () => testEvent(Simulate.mouseUp));
    test('paste', () => testEvent(Simulate.paste));
    test('scroll', () => testEvent(Simulate.scroll));
    test('submit', () => testEvent(Simulate.submit));
    test('touchCancel', () => testEvent(Simulate.touchCancel));
    test('touchEnd', () => testEvent(Simulate.touchEnd));
    test('touchMove', () => testEvent(Simulate.touchMove));
    test('touchStart', () => testEvent(Simulate.touchStart));
    test('wheel', () => testEvent(Simulate.wheel));
  });

  test('findAllInRenderedTree', () {
    component = renderIntoDocument(sampleComponent({}));
    var jsFunc = new JsFunction.withThis((c) => c.tagName == 'div');
    var results = findAllInRenderedTree(component, jsFunc);
    expect(results.length, equals(2));
  });
  
  test('findRenderedDOMComponentWithTag', () {
    component = renderIntoDocument(sampleComponent({}));
    var h1 = findRenderedDOMComponentWithTag(component, 'h1');
    expect(h1['tagName'], equals('H1'));
  });

  group('isCompositeComponent', () {

    test('returns true when element is a React component', () {
      component = renderIntoDocument(eventComponent({}));
      expect(isCompositeComponent(component), isTrue);
    });

    test('returns false when element is not a React component', () {
      expect(isCompositeComponent(eventComponent), isFalse);
    });

  });

  // TODO: isCompositeComponentWithClass
  // TODO: isDOMComponent
  // TODO: isElement
  // TODO: isElementOfType
  // TODO: isTextComponent
  // TODO: scryRenderedDOMComponentsWithClass
  // TODO: renderIntoDocument
  // TODO: getDomNode

}