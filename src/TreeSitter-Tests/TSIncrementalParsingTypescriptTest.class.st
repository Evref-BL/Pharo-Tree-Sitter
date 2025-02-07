Class {
	#name : 'TSIncrementalParsingTypescriptTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'typescriptLanguage'
	],
	#category : 'TreeSitter-Tests-IncrementalParsing-Typescript',
	#package : 'TreeSitter-Tests',
	#tag : 'IncrementalParsing-Typescript'
}

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTree: oldTree forBasicExample: oldString [ 

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := 'function printHello(): void { console.log(''Hello!''); console.log(''hi!''); }'.

	aTSInputEdit := TSInputEdit new.

	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: oldString size .
	oldPoint := aTSInputEdit createPointWithRow: 0 andColumn: oldString size . 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: newString size .   
	
	aTSInputEdit
		startByte: oldString size;
		oldEndByte: oldString size;
		newEndByte: newString size;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree. 
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForDeleteBeginingExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringDeleteBeginning.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 1 andColumn: 33. 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.   
	
	aTSInputEdit
		startByte: 0;
		oldEndByte: 69;
		newEndByte: 0;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForDeleteEndExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringDeleteEnd.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 9 andColumn: 51.
	oldPoint := aTSInputEdit createPointWithRow: 9 andColumn: 51. 
	newPoint := aTSInputEdit createPointWithRow: 9 andColumn: 51.   
	
	aTSInputEdit
		startByte: 224;
		oldEndByte: 255;
		newEndByte: 224;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForDeleteMiddleExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringDeleteMiddle.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 6 andColumn: 36.
	oldPoint := aTSInputEdit createPointWithRow: 6 andColumn: 42. 
	newPoint := aTSInputEdit createPointWithRow: 6 andColumn: 36.   
	
	aTSInputEdit
		startByte: 141;
		oldEndByte: 147;
		newEndByte: 141;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForInsertBeginingExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringInsertBeginning.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0. 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: 10.   
	
	aTSInputEdit
		startByte: 0;
		oldEndByte: 0;
		newEndByte: 10;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForInsertEndExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringInsertEnd.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 11 andColumn: 27.
	oldPoint := aTSInputEdit createPointWithRow: 11 andColumn: 27. 
	newPoint := aTSInputEdit createPointWithRow: 12 andColumn: 21.   
	
	aTSInputEdit
		startByte: 255;
		oldEndByte: 255;
		newEndByte: 278;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForInsertMiddleExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringInsertMiddle.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 7 andColumn: 1.
	oldPoint := aTSInputEdit createPointWithRow: 7 andColumn: 1. 
	newPoint := aTSInputEdit createPointWithRow: 9 andColumn: 22.   
	
	aTSInputEdit
		startByte: 169;
		oldEndByte: 169;
		newEndByte: 195;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForUpdateBeginingExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringUpdateBegining.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 0 andColumn: 9. 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: 1.   
	
	aTSInputEdit
		startByte: 0;
		oldEndByte: 9;
		newEndByte: 1;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForUpdateEndExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringUpdateEnd.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 11 andColumn: 26.
	oldPoint := aTSInputEdit createPointWithRow: 11 andColumn: 27. 
	newPoint := aTSInputEdit createPointWithRow: 11 andColumn: 27.   
	
	aTSInputEdit
		startByte: 254;
		oldEndByte: 255;
		newEndByte: 255;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForUpdateMiddleExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringUpdateMiddle.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 9 andColumn: 43.
	oldPoint := aTSInputEdit createPointWithRow: 9 andColumn: 47. 
	newPoint := aTSInputEdit createPointWithRow: 9 andColumn: 48.   
	
	aTSInputEdit
		startByte: 216;
		oldEndByte: 220;
		newEndByte: 221;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> longStringExample [

	"long typescript code copied from a Bootstrap project on github https://github.com/twbs/bootstrap/blob/main/js/src/tooltip.js"

	^ '/**
 * --------------------------------------------------------------------------
 * Bootstrap tooltip.js
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/main/LICENSE)
 * --------------------------------------------------------------------------
 */

import * as Popper from ''@popperjs/core''
import BaseComponent from ''./base-component.js''
import EventHandler from ''./dom/event-handler.js''
import Manipulator from ''./dom/manipulator.js''
import {
  defineJQueryPlugin, execute, findShadowRoot, getElement, getUID, isRTL, noop
} from ''./util/index.js''
import { DefaultAllowlist } from ''./util/sanitizer.js''
import TemplateFactory from ''./util/template-factory.js''

/**
 * Constants
 */

const NAME = ''tooltip''
const DISALLOWED_ATTRIBUTES = new Set([''sanitize'', ''allowList'', ''sanitizeFn''])

const CLASS_NAME_FADE = ''fade''
const CLASS_NAME_MODAL = ''modal''
const CLASS_NAME_SHOW = ''show''

const SELECTOR_TOOLTIP_INNER = ''.tooltip-inner''
const SELECTOR_MODAL = `.${CLASS_NAME_MODAL}`

const EVENT_MODAL_HIDE = ''hide.bs.modal''

const TRIGGER_HOVER = ''hover''
const TRIGGER_FOCUS = ''focus''
const TRIGGER_CLICK = ''click''
const TRIGGER_MANUAL = ''manual''

const EVENT_HIDE = ''hide''
const EVENT_HIDDEN = ''hidden''
const EVENT_SHOW = ''show''
const EVENT_SHOWN = ''shown''
const EVENT_INSERTED = ''inserted''
const EVENT_CLICK = ''click''
const EVENT_FOCUSIN = ''focusin''
const EVENT_FOCUSOUT = ''focusout''
const EVENT_MOUSEENTER = ''mouseenter''
const EVENT_MOUSELEAVE = ''mouseleave''

const AttachmentMap = {
  AUTO: ''auto'',
  TOP: ''top'',
  RIGHT: isRTL() ? ''left'' : ''right'',
  BOTTOM: ''bottom'',
  LEFT: isRTL() ? ''right'' : ''left''
}

const Default = {
  allowList: DefaultAllowlist,
  animation: true,
  boundary: ''clippingParents'',
  container: false,
  customClass: '''',
  delay: 0,
  fallbackPlacements: [''top'', ''right'', ''bottom'', ''left''],
  html: false,
  offset: [0, 6],
  placement: ''top'',
  popperConfig: null,
  sanitize: true,
  sanitizeFn: null,
  selector: false,
  template: ''<div class="tooltip" role="tooltip">'' +
            ''<div class="tooltip-arrow"></div>'' +
            ''<div class="tooltip-inner"></div>'' +
            ''</div>'',
  title: '''',
  trigger: ''hover focus''
}

const DefaultType = {
  allowList: ''object'',
  animation: ''boolean'',
  boundary: ''(string|element)'',
  container: ''(string|element|boolean)'',
  customClass: ''(string|function)'',
  delay: ''(number|object)'',
  fallbackPlacements: ''array'',
  html: ''boolean'',
  offset: ''(array|string|function)'',
  placement: ''(string|function)'',
  popperConfig: ''(null|object|function)'',
  sanitize: ''boolean'',
  sanitizeFn: ''(null|function)'',
  selector: ''(string|boolean)'',
  template: ''string'',
  title: ''(string|element|function)'',
  trigger: ''string''
}

/**
 * Class definition
 */

class Tooltip extends BaseComponent {
  constructor(element, config) {
    if (typeof Popper === ''undefined'') {
      throw new TypeError(''Bootstrap\''s tooltips require Popper (https://popper.js.org/docs/v2/)'')
    }

    super(element, config)

    // Private
    this._isEnabled = true
    this._timeout = 0
    this._isHovered = null
    this._activeTrigger = {}
    this._popper = null
    this._templateFactory = null
    this._newContent = null

    // Protected
    this.tip = null

    this._setListeners()

    if (!this._config.selector) {
      this._fixTitle()
    }
  }

  // Getters
  static get Default() {
    return Default
  }

  static get DefaultType() {
    return DefaultType
  }

  static get NAME() {
    return NAME
  }

  // Public
  enable() {
    this._isEnabled = true
  }

  disable() {
    this._isEnabled = false
  }

  toggleEnabled() {
    this._isEnabled = !this._isEnabled
  }

  toggle() {
    if (!this._isEnabled) {
      return
    }

    if (this._isShown()) {
      this._leave()
      return
    }

    this._enter()
  }

  dispose() {
    clearTimeout(this._timeout)

    EventHandler.off(this._element.closest(SELECTOR_MODAL), EVENT_MODAL_HIDE, this._hideModalHandler)

    if (this._element.getAttribute(''data-bs-original-title'')) {
      this._element.setAttribute(''title'', this._element.getAttribute(''data-bs-original-title''))
    }

    this._disposePopper()
    super.dispose()
  }

  show() {
    if (this._element.style.display === ''none'') {
      throw new Error(''Please use show on visible elements'')
    }

    if (!(this._isWithContent() && this._isEnabled)) {
      return
    }

    const showEvent = EventHandler.trigger(this._element, this.constructor.eventName(EVENT_SHOW))
    const shadowRoot = findShadowRoot(this._element)
    const isInTheDom = (shadowRoot || this._element.ownerDocument.documentElement).contains(this._element)

    if (showEvent.defaultPrevented || !isInTheDom) {
      return
    }

    // TODO: v6 remove this or make it optional
    this._disposePopper()

    const tip = this._getTipElement()

    this._element.setAttribute(''aria-describedby'', tip.getAttribute(''id''))

    const { container } = this._config

    if (!this._element.ownerDocument.documentElement.contains(this.tip)) {
      container.append(tip)
      EventHandler.trigger(this._element, this.constructor.eventName(EVENT_INSERTED))
    }

    this._popper = this._createPopper(tip)

    tip.classList.add(CLASS_NAME_SHOW)

    // If this is a touch-enabled device we add extra
    // empty mouseover listeners to the body''s immediate children;
    // only needed because of broken event delegation on iOS
    // https://www.quirksmode.org/blog/archives/2014/02/mouse_event_bub.html
    if (''ontouchstart'' in document.documentElement) {
      for (const element of [].concat(...document.body.children)) {
        EventHandler.on(element, ''mouseover'', noop)
      }
    }

    const complete = () => {
      EventHandler.trigger(this._element, this.constructor.eventName(EVENT_SHOWN))

      if (this._isHovered === false) {
        this._leave()
      }

      this._isHovered = false
    }

    this._queueCallback(complete, this.tip, this._isAnimated())
  }

  hide() {
    if (!this._isShown()) {
      return
    }

    const hideEvent = EventHandler.trigger(this._element, this.constructor.eventName(EVENT_HIDE))
    if (hideEvent.defaultPrevented) {
      return
    }

    const tip = this._getTipElement()
    tip.classList.remove(CLASS_NAME_SHOW)

    // If this is a touch-enabled device we remove the extra
    // empty mouseover listeners we added for iOS support
    if (''ontouchstart'' in document.documentElement) {
      for (const element of [].concat(...document.body.children)) {
        EventHandler.off(element, ''mouseover'', noop)
      }
    }

    this._activeTrigger[TRIGGER_CLICK] = false
    this._activeTrigger[TRIGGER_FOCUS] = false
    this._activeTrigger[TRIGGER_HOVER] = false
    this._isHovered = null // it is a trick to support manual triggering

    const complete = () => {
      if (this._isWithActiveTrigger()) {
        return
      }

      if (!this._isHovered) {
        this._disposePopper()
      }

      this._element.removeAttribute(''aria-describedby'')
      EventHandler.trigger(this._element, this.constructor.eventName(EVENT_HIDDEN))
    }

    this._queueCallback(complete, this.tip, this._isAnimated())
  }

  update() {
    if (this._popper) {
      this._popper.update()
    }
  }

  // Protected
  _isWithContent() {
    return Boolean(this._getTitle())
  }

  _getTipElement() {
    if (!this.tip) {
      this.tip = this._createTipElement(this._newContent || this._getContentForTemplate())
    }

    return this.tip
  }

  _createTipElement(content) {
    const tip = this._getTemplateFactory(content).toHtml()

    // TODO: remove this check in v6
    if (!tip) {
      return null
    }

    tip.classList.remove(CLASS_NAME_FADE, CLASS_NAME_SHOW)
    // TODO: v6 the following can be achieved with CSS only
    tip.classList.add(`bs-${this.constructor.NAME}-auto`)

    const tipId = getUID(this.constructor.NAME).toString()

    tip.setAttribute(''id'', tipId)

    if (this._isAnimated()) {
      tip.classList.add(CLASS_NAME_FADE)
    }

    return tip
  }

  setContent(content) {
    this._newContent = content
    if (this._isShown()) {
      this._disposePopper()
      this.show()
    }
  }

  _getTemplateFactory(content) {
    if (this._templateFactory) {
      this._templateFactory.changeContent(content)
    } else {
      this._templateFactory = new TemplateFactory({
        ...this._config,
        // the `content` var has to be after `this._config`
        // to override config.content in case of popover
        content,
        extraClass: this._resolvePossibleFunction(this._config.customClass)
      })
    }

    return this._templateFactory
  }

  _getContentForTemplate() {
    return {
      [SELECTOR_TOOLTIP_INNER]: this._getTitle()
    }
  }

  _getTitle() {
    return this._resolvePossibleFunction(this._config.title) || this._element.getAttribute(''data-bs-original-title'')
  }

  // Private
  _initializeOnDelegatedTarget(event) {
    return this.constructor.getOrCreateInstance(event.delegateTarget, this._getDelegateConfig())
  }

  _isAnimated() {
    return this._config.animation || (this.tip && this.tip.classList.contains(CLASS_NAME_FADE))
  }

  _isShown() {
    return this.tip && this.tip.classList.contains(CLASS_NAME_SHOW)
  }

  _createPopper(tip) {
    const placement = execute(this._config.placement, [this, tip, this._element])
    const attachment = AttachmentMap[placement.toUpperCase()]
    return Popper.createPopper(this._element, tip, this._getPopperConfig(attachment))
  }

  _getOffset() {
    const { offset } = this._config

    if (typeof offset === ''string'') {
      return offset.split('','').map(value => Number.parseInt(value, 10))
    }

    if (typeof offset === ''function'') {
      return popperData => offset(popperData, this._element)
    }

    return offset
  }

  _resolvePossibleFunction(arg) {
    return execute(arg, [this._element, this._element])
  }

  _getPopperConfig(attachment) {
    const defaultBsPopperConfig = {
      placement: attachment,
      modifiers: [
        {
          name: ''flip'',
          options: {
            fallbackPlacements: this._config.fallbackPlacements
          }
        },
        {
          name: ''offset'',
          options: {
            offset: this._getOffset()
          }
        },
        {
          name: ''preventOverflow'',
          options: {
            boundary: this._config.boundary
          }
        },
        {
          name: ''arrow'',
          options: {
            element: `.${this.constructor.NAME}-arrow`
          }
        },
        {
          name: ''preSetPlacement'',
          enabled: true,
          phase: ''beforeMain'',
          fn: data => {
            // Pre-set Popper''s placement attribute in order to read the arrow sizes properly.
            // Otherwise, Popper mixes up the width and height dimensions since the initial arrow style is for top placement
            this._getTipElement().setAttribute(''data-popper-placement'', data.state.placement)
          }
        }
      ]
    }

    return {
      ...defaultBsPopperConfig,
      ...execute(this._config.popperConfig, [undefined, defaultBsPopperConfig])
    }
  }

  _setListeners() {
    const triggers = this._config.trigger.split('' '')

    for (const trigger of triggers) {
      if (trigger === ''click'') {
        EventHandler.on(this._element, this.constructor.eventName(EVENT_CLICK), this._config.selector, event => {
          const context = this._initializeOnDelegatedTarget(event)
          context.toggle()
        })
      } else if (trigger !== TRIGGER_MANUAL) {
        const eventIn = trigger === TRIGGER_HOVER ?
          this.constructor.eventName(EVENT_MOUSEENTER) :
          this.constructor.eventName(EVENT_FOCUSIN)
        const eventOut = trigger === TRIGGER_HOVER ?
          this.constructor.eventName(EVENT_MOUSELEAVE) :
          this.constructor.eventName(EVENT_FOCUSOUT)

        EventHandler.on(this._element, eventIn, this._config.selector, event => {
          const context = this._initializeOnDelegatedTarget(event)
          context._activeTrigger[event.type === ''focusin'' ? TRIGGER_FOCUS : TRIGGER_HOVER] = true
          context._enter()
        })
        EventHandler.on(this._element, eventOut, this._config.selector, event => {
          const context = this._initializeOnDelegatedTarget(event)
          context._activeTrigger[event.type === ''focusout'' ? TRIGGER_FOCUS : TRIGGER_HOVER] =
            context._element.contains(event.relatedTarget)

          context._leave()
        })
      }
    }

    this._hideModalHandler = () => {
      if (this._element) {
        this.hide()
      }
    }

    EventHandler.on(this._element.closest(SELECTOR_MODAL), EVENT_MODAL_HIDE, this._hideModalHandler)
  }

  _fixTitle() {
    const title = this._element.getAttribute(''title'')

    if (!title) {
      return
    }

    if (!this._element.getAttribute(''aria-label'') && !this._element.textContent.trim()) {
      this._element.setAttribute(''aria-label'', title)
    }

    this._element.setAttribute(''data-bs-original-title'', title) // DO NOT USE IT. Is only for backwards compatibility
    this._element.removeAttribute(''title'')
  }

  _enter() {
    if (this._isShown() || this._isHovered) {
      this._isHovered = true
      return
    }

    this._isHovered = true

    this._setTimeout(() => {
      if (this._isHovered) {
        this.show()
      }
    }, this._config.delay.show)
  }

  _leave() {
    if (this._isWithActiveTrigger()) {
      return
    }

    this._isHovered = false

    this._setTimeout(() => {
      if (!this._isHovered) {
        this.hide()
      }
    }, this._config.delay.hide)
  }

  _setTimeout(handler, timeout) {
    clearTimeout(this._timeout)
    this._timeout = setTimeout(handler, timeout)
  }

  _isWithActiveTrigger() {
    return Object.values(this._activeTrigger).includes(true)
  }

  _getConfig(config) {
    const dataAttributes = Manipulator.getDataAttributes(this._element)

    for (const dataAttribute of Object.keys(dataAttributes)) {
      if (DISALLOWED_ATTRIBUTES.has(dataAttribute)) {
        delete dataAttributes[dataAttribute]
      }
    }

    config = {
      ...dataAttributes,
      ...(typeof config === ''object'' && config ? config : {})
    }
    config = this._mergeConfigObj(config)
    config = this._configAfterMerge(config)
    this._typeCheckConfig(config)
    return config
  }

  _configAfterMerge(config) {
    config.container = config.container === false ? document.body : getElement(config.container)

    if (typeof config.delay === ''number'') {
      config.delay = {
        show: config.delay,
        hide: config.delay
      }
    }

    if (typeof config.title === ''number'') {
      config.title = config.title.toString()
    }

    if (typeof config.content === ''number'') {
      config.content = config.content.toString()
    }

    return config
  }

  _getDelegateConfig() {
    const config = {}

    for (const [key, value] of Object.entries(this._config)) {
      if (this.constructor.Default[key] !== value) {
        config[key] = value
      }
    }

    config.selector = false
    config.trigger = ''manual''

    // In the future can be replaced with:
    // const keysWithDifferentValues = Object.entries(this._config).filter(entry => this.constructor.Default[entry[0]] !== this._config[entry[0]])
    // `Object.fromEntries(keysWithDifferentValues)`
    return config
  }

  _disposePopper() {
    if (this._popper) {
      this._popper.destroy()
      this._popper = null
    }

    if (this.tip) {
      this.tip.remove()
      this.tip = null
    }
  }

  // Static
  static jQueryInterface(config) {
    return this.each(function () {
      const data = Tooltip.getOrCreateInstance(this, config)

      if (typeof config !== ''string'') {
        return
      }

      if (typeof data[config] === ''undefined'') {
        throw new TypeError(`No method named "${config}"`)
      }

      data[config]()
    })
  }
}

/**
 * jQuery
 */

defineJQueryPlugin(Tooltip)

export default Tooltip'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringDeleteBeginning [

	"deleting the interface at the beginning"

	^ 'function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringDeleteEnd [

	"remove the log at the end"

	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringDeleteMiddle [

	"remove space between firstName and LastName"

	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringInsertBeginning [

	"let's say a new statement is added at the begining"

	^ 'let x = 1;
interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringInsertEnd [

	"Let's say another log is added at the end"

	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));
console.log("End !");'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringInsertMiddle [

	"let's say the developer added a log in the middle"

	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

console.log("Begin!");

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringUpdateBegining [
	
	"let's say the developer intends to make changes and replace the interface by a const"
	
	^ 'c Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringUpdateEnd [
	
	"let's say by mistake ; replaced by . at the end"
	
	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user)).'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringUpdateMiddle [

	"Updating value of last name "
	
	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "Frost" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> originalStringToParse [

	"original string where modifications will applied at the begining, middle and end for many cases: add update and delete"

	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'running' }
TSIncrementalParsingTypescriptTest >> setUp [

	super setUp.

	parser := TSParser new.
	typescriptLanguage := TSLanguage typescript .
	parser language: typescriptLanguage.
]

{ #category : 'running' }
TSIncrementalParsingTypescriptTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingBasic [

	| originalString originalTree newTree|

	originalString := 'function printHello(): void { console.log(''Hello!''); }'.
	originalTree := parser parseString: originalString.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert:  originalTree rootNode collectNamedChild first collectNamedChild fourth collectNamedChild size equals: 1.
	
	newTree := self editTree: originalTree forBasicExample: originalString.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild first collectNamedChild fourth collectNamedChild size equals: 2.
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingDeleteBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild first type equals: 'interface_declaration'.
			
	newTree := self editTreeForDeleteBeginingExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 3.
	self assert:  newTree rootNode collectNamedChild first type equals: 'function_declaration'. 
	self assert:  newTree rootNode endByte equals: self newStringDeleteBeginning size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingDeleteEnd [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild fourth type equals: 'expression_statement'.  
			
	newTree := self editTreeForDeleteEndExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert: newTree rootNode collectNamedChild size equals: 3.	
	self assert: newTree rootNode endByte equals: self newStringDeleteEnd size . 
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingDeleteMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild second collectNamedChild third firstNamedChild firstNamedChild firstNamedChild firstNamedChild type equals: 'binary_expression'. "before deleting we had 3 levels of firstNamedChild"
			
	newTree := self editTreeForDeleteMiddleExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 4.
	self assert:  newTree rootNode collectNamedChild second collectNamedChild third firstNamedChild firstNamedChild firstNamedChild type equals: 'binary_expression'. "after deleting we have 2 levels of firstNamedChild" 
	self assert:  newTree rootNode endByte equals: self newStringDeleteMiddle size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingInsertBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild first type equals: 'interface_declaration'.
			
	newTree := self editTreeForInsertBeginingExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 5.
	self assert:  newTree rootNode collectNamedChild first type equals: 'lexical_declaration'.	
	self assert:  newTree rootNode endByte equals: self newStringInsertBeginning size .
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingInsertEnd [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild fourth type equals: 'expression_statement'.
			
	newTree := self editTreeForInsertEndExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 5.
	self assert:  newTree rootNode collectNamedChild fifth type equals: 'expression_statement'.
	self assert:  newTree rootNode endByte equals: self newStringInsertEnd size .
	
	
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingInsertMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild third type equals: 'lexical_declaration'.
			
	newTree := self editTreeForInsertMiddleExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 5.
	self assert:  newTree rootNode collectNamedChild third type equals: 'expression_statement'. 	
	self assert:  newTree rootNode endByte equals: self newStringInsertMiddle size .
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingUpdateBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild first type equals: 'interface_declaration'.
			
	newTree := self editTreeForUpdateBeginingExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 5.
	self assert:  newTree rootNode collectNamedChild first type equals: 'ERROR'.
 	self assert:  newTree rootNode collectNamedChild second type equals: 'statement_block'.
	self assert:  newTree rootNode endByte equals: self newStringUpdateBegining size .
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingUpdateEnd [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild fourth type equals: 'expression_statement'.
			
	newTree := self editTreeForUpdateEndExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 4.
	self assert:  newTree rootNode collectNamedChild fourth type equals: 'ERROR'.
	self assert:  newTree rootNode endByte equals: self newStringUpdateEnd size . 
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingUpdateMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild first type equals: 'interface_declaration'.
			
	newTree := self editTreeForUpdateMiddleExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild first type equals: 'interface_declaration'.
	self assert:  newTree rootNode endByte equals: self newStringUpdateMiddle size .
	
	

]
