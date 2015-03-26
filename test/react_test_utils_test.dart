import 'dart:js';

import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';
import 'package:react/react.dart';
import 'package:react/react_client.dart' as reactClient;
import 'package:react/react_test_utils.dart';

import 'test_components.dart';


void main() {

  useHtmlConfiguration();
  reactClient.setClientConfiguration();

  var component;
  var domNode;
  var _React = context['React'];
  var _Object = context['Object'];

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

  test('findRenderedDOMComponentWithClass', () {
    component = renderIntoDocument(sampleComponent({}));
    var spanComponent = findRenderedDOMComponentWithClass(component, 'span1');

    expect(spanComponent['tagName'], equals('SPAN'));
  });

  test('findRenderedDOMComponentWithTag', () {
    component = renderIntoDocument(sampleComponent({}));
    var h1Component = findRenderedDOMComponentWithTag(component, 'h1');

    expect(h1Component['tagName'], equals('H1'));
  });

  test('findRenderedComponentWithType', () {
    component = renderIntoDocument(div({}, [sampleComponent({})]));
    var result = findRenderedComponentWithType(component, sampleComponent);
    expect(isCompositeComponentWithType(result, sampleComponent), isTrue);
  });

  group('isCompositeComponent', () {
    test('returns true when element is a React component', () {
      component = renderIntoDocument(eventComponent({}));

      expect(isCompositeComponent(component), isTrue);
    });

    test('returns false when element is not a React component', () {
      component = renderIntoDocument(div({}));

      expect(isCompositeComponent(component), isFalse);
    });
  });

  group('isCompositeComponentWithType', () {
    var renderedInstance = renderIntoDocument(sampleComponent({}));

    test('returns true when element is a React component with class', () {
      expect(isCompositeComponentWithType(
          renderedInstance, sampleComponent), isTrue);
    });

    test('returns false when element is not a React component with class', () {
      expect(isCompositeComponentWithType(
          renderedInstance, eventComponent), isFalse);
    });
  });

  group('isDOMComponent', () {
    test('returns true when argument is a DOM component', () {
      component = renderIntoDocument(sampleComponent({}));
      var h1Element = findRenderedDOMComponentWithTag(component, 'h1');

      expect(isDOMComponent(h1Element), isTrue);
    });

    test('returns false when argument is not a DOM component', () {
      expect(isDOMComponent(h1({})), isFalse);
    });
  });

  group('isElement', () {
    test('returns true argument is an element', () {
      expect(isElement(div({})), isTrue);
    });

    test('returns false argument is not an element', () {
      expect(isElement(sampleComponent), isFalse);
    });
  });

  group('isElementOfType', () {
    test('returns true argument is an element of type', () {
      expect(isElementOfType(div({}), div), isTrue);
    });

    test('returns false argument is not an element of type', () {
      expect(isElementOfType(div({}), span), isFalse);
    });
  });

  test('scryRenderedComponentsWithType', () {
    component = renderIntoDocument(div({}, [
        sampleComponent({}), sampleComponent({}), eventComponent({})]));

    var results = scryRenderedComponentsWithType(component, sampleComponent);

    expect(results.length, 2);
    expect(isCompositeComponentWithType(results[0], sampleComponent), isTrue);
    expect(isCompositeComponentWithType(results[1], sampleComponent), isTrue);
  });

  test('scryRenderedDOMComponentsWithClass', () {
    component = renderIntoDocument(div({}, [
        div({'className': 'divClass'}),
        div({'className': 'divClass'}),
        span({})
    ]));

    var results = scryRenderedDOMComponentsWithClass(component, 'divClass');

    expect(results.length, 2);
    expect(results[0]['tagName'], equals('DIV'));
    expect(results[1]['tagName'], equals('DIV'));
  });

  test('scryRenderedDOMComponentsWithTag', () {
    component = renderIntoDocument(div({}, [div({}), div({}), span({})]));

    var results = scryRenderedDOMComponentsWithTag(component, 'div');

    expect(results.length, 3);
    expect(results[0]['tagName'], equals('DIV'));
    expect(results[1]['tagName'], equals('DIV'));
    expect(results[2]['tagName'], equals('DIV'));
  });

  test('renderIntoDocucment', () {
    var reactComponent = renderIntoDocument(sampleComponent({}));
    var divElements = scryRenderedDOMComponentsWithTag(reactComponent, 'div');
    var h1Elements = scryRenderedDOMComponentsWithTag(reactComponent, 'h1');
    var spanElements = scryRenderedDOMComponentsWithTag(reactComponent, 'span');

    expect(divElements.length, equals(3));
    // First div should be the parent div created by renderIntoDocument()
    expect(getDomNode(
        divElements[0]).text, equals('A headerFirst divSecond div'));
    expect(getDomNode(divElements[1]).text, equals('First div'));
    expect(getDomNode(divElements[2]).text, equals('Second div'));
    expect(h1Elements.length, equals(1));
    expect(getDomNode(h1Elements[0]).text, equals('A header'));
    expect(spanElements.length, equals(1));
    expect(getDomNode(spanElements[0]).text, equals(''));
  });

  test('getDOMNode', () {
    component = renderIntoDocument(sampleComponent({}));
    var h1Element = findRenderedDOMComponentWithTag(component, 'h1');
    var h1DomNode = getDomNode(h1Element);

    expect(h1DomNode.nodeName, 'H1');
    expect(h1DomNode.text, 'A header');
  });
}