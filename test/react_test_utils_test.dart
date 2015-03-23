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

  // This is intended only to make a simple representation of react elements
  // as JS objects for testings purposes.
  JsObject createReactElement(
      String componentType, Map properties, List childrenComponents) {
    var proto = new JsObject(_Object);
    proto['render'] = () => null;
    proto['setState'] = () => null;

    var props = new JsObject(_Object);
    properties.forEach((k, v) => props[k] = v);

    var renderedChildren;
    if (childrenComponents.length > 0) {
      renderedChildren = new JsObject(_Object);
      for (var i = 0; i < childrenComponents.length; i++) {
        renderedChildren['.${i}'] = childrenComponents[i];
      }
    }

    var component = new JsObject(_Object);
    component['constructor'] = componentType.toLowerCase();
    component['mountComponent'] = () => null;
    component['props'] = props;
    component['tagName'] = componentType.toUpperCase();
    component['__proto__'] = proto;
    component['_renderedChildren'] = renderedChildren;

    return component;
  };

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
    var type = new JsObject(_Object);
    type['type'] = 'span';

    var divChild = createReactElement('div', {}, []);
    var spanChild = createReactElement('span', {}, []);
    var component = createReactElement('div', {}, [divChild, spanChild]);

    expect(findRenderedComponentWithType(component, type), spanChild);
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

  group('isCompositeComponentWithType', () {
    var proto = new JsObject(_Object);
    proto['render'] = () => null;
    proto['setState'] = () => null;

    var divType = new JsObject(_Object);
    divType['type'] = 'div';

    var spanType = new JsObject(_Object);
    spanType['type'] = 'span';

    var compositeComponent = new JsObject(_Object);
    compositeComponent['constructor'] = divType['type'];
    compositeComponent['__proto__'] = proto;

    test('returns true when element is a React component with class', () {
      expect(isCompositeComponentWithType(
          compositeComponent, divType), isTrue);
    });

    test('returns false when element is not a React component with class', () {
      expect(isCompositeComponentWithType(
          compositeComponent, spanType), isFalse);
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
    var proto = new JsObject(_Object);
    proto['_isReactElement'] = true;

    var divType = new JsObject(_Object);
    divType['type'] = 'div';

    var spanType = new JsObject(_Object);
    spanType['type'] = 'span';

    var divElement = new JsObject(_Object);
    divElement['type'] = 'div';
    divElement['__proto__'] = proto;

    test('returns true argument is an element of type', () {
      expect(isElementOfType(divElement, divType), isTrue);
    });

    test('returns false argument is not an element of type', () {
      expect(isElementOfType(divElement, spanType), isFalse);
    });
  });

  test('scryRenderedComponentsWithType', () {
    var type = new JsObject(_Object);
    type['type'] = 'div';

    var divChild = createReactElement('div', {}, []);
    var spanChild = createReactElement('span', {}, []);
    var reactComponent = createReactElement('div', {}, [divChild, spanChild]);

    var results = scryRenderedComponentsWithType(reactComponent, type);

    expect(results.length, 2);
    expect(results[0]['tagName'], equals('DIV'));
    expect(results[1]['tagName'], equals('DIV'));
  });

  test('scryRenderedDOMComponentsWithClass', () {
    var divChild = createReactElement('div', {'className': 'class1'}, []);
    var spanChild = createReactElement('span', {'className': 'class1'}, []);
    var reactComponent = createReactElement(
        'div', {'className': 'class2'}, [divChild, spanChild]);

    var results = scryRenderedDOMComponentsWithClass(reactComponent, 'class1');

    expect(results.length, 2);
    expect(results[0]['tagName'], equals('DIV'));
    expect(results[1]['tagName'], equals('SPAN'));
  });

  test('scryRenderedDOMComponentsWithTag', () {
    var divChild = createReactElement('div', {}, []);
    var spanChild = createReactElement('span', {}, []);
    var reactComponent = createReactElement(
        'div', {'className': 'class2'}, [divChild, spanChild]);

    var results = scryRenderedDOMComponentsWithTag(reactComponent, 'div');

    expect(results.length, 2);
    expect(results[0]['tagName'], equals('DIV'));
    expect(results[1]['tagName'], equals('DIV'));
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