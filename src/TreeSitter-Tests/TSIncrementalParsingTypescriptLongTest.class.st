Class {
	#name : 'TSIncrementalParsingTypescriptLongTest',
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
TSIncrementalParsingTypescriptLongTest >> editTreeForDeleteBeginingLongExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newLongStringDeleteBeginning .

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 5 andColumn: 72. 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.   
	
	aTSInputEdit
		startByte: 0;
		oldEndByte: 272;
		newEndByte: 0;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptLongTest >> editTreeForDeleteEndLongExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newLongStringDeleteEnd .

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 631 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 631 andColumn: 0. 
	newPoint := aTSInputEdit createPointWithRow: 631 andColumn: 0.   
	
	aTSInputEdit
		startByte: 16615;
		oldEndByte: 16637;
		newEndByte: 16615;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptLongTest >> editTreeForDeleteMiddleLongExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newLongStringDeleteMiddle .

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 7 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 25 andColumn: 13. 
	newPoint := aTSInputEdit createPointWithRow: 7 andColumn: 0.   
	
	aTSInputEdit
		startByte: 272;
		oldEndByte: 692;
		newEndByte: 272;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptLongTest >> editTreeForInsertBeginningLongExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newLongStringInsertBeginning .

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0. 
	newPoint := aTSInputEdit createPointWithRow: 6 andColumn: 0.   
	
	aTSInputEdit
		startByte: 0;
		oldEndByte: 0;
		newEndByte: 270;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptLongTest >> editTreeForInsertEndLongExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newLongStringInsertEnd .

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 631 andColumn: 22.
	oldPoint := aTSInputEdit createPointWithRow: 631 andColumn: 22. 
	newPoint := aTSInputEdit createPointWithRow: 632 andColumn: 27.   
	
	aTSInputEdit
		startByte: 16637;
		oldEndByte: 16637;
		newEndByte: 16666;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptLongTest >> editTreeForInsertMiddleLongExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newLongStringInsertMiddle .

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 103 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 103 andColumn: 0. 
	newPoint := aTSInputEdit createPointWithRow: 107 andColumn: 1.   
	
	aTSInputEdit
		startByte: 2849;
		oldEndByte: 2849;
		newEndByte: 2914;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptLongTest >> editTreeForUpdateBeginningLongExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newLongStringUpdateBeginning .

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 7 andColumn: 24. 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: 40.   
	
	aTSInputEdit
		startByte: 0;
		oldEndByte: 268;
		newEndByte: 40;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptLongTest >> editTreeForUpdateEndLongExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newLongStringUpdateEnd .

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 631 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 632 andColumn: 20. 
	newPoint := aTSInputEdit createPointWithRow: 632 andColumn: 27.   
	
	aTSInputEdit
		startByte: 16615;
		oldEndByte: 16637;
		newEndByte: 16644;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptLongTest >> editTreeForUpdateMiddleLongExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newLongStringUpdateMiddle .

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 80 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 94 andColumn: 4. 
	newPoint := aTSInputEdit createPointWithRow: 98 andColumn: 1.   
	
	aTSInputEdit
		startByte: 2258;
		oldEndByte: 2814;
		newEndByte: 2953;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptLongTest >> longStringExample [

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

export default Tooltip' withPlatformLineEndings
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptLongTest >> longStringExample2 [

	"long typescript code copied from a Bootstrap project on github https://github.com/twbs/bootstrap/blob/main/js/src/tooltip.js"

	^ '/**
 * --------------------------------------------------------------------------
 * Bootstrap dropdown.js
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/main/LICENSE)
 * --------------------------------------------------------------------------
 */

import * as Popper from ''@popperjs/core''
import BaseComponent from ''./base-component.js''
import EventHandler from ''./dom/event-handler.js''
import Manipulator from ''./dom/manipulator.js''
import SelectorEngine from ''./dom/selector-engine.js''
import {
  defineJQueryPlugin,
  execute,
  getElement,
  getNextActiveElement,
  isDisabled,
  isElement,
  isRTL,
  isVisible,
  noop
} from ''./util/index.js''

/**
 * Constants
 */

const NAME = ''dropdown''
const DATA_KEY = ''bs.dropdown''
const EVENT_KEY = `.${DATA_KEY}`
const DATA_API_KEY = ''.data-api''

const ESCAPE_KEY = ''Escape''
const TAB_KEY = ''Tab''
const ARROW_UP_KEY = ''ArrowUp''
const ARROW_DOWN_KEY = ''ArrowDown''
const RIGHT_MOUSE_BUTTON = 2 // MouseEvent.button value for the secondary button, usually the right button

const EVENT_HIDE = `hide${EVENT_KEY}`
const EVENT_HIDDEN = `hidden${EVENT_KEY}`
const EVENT_SHOW = `show${EVENT_KEY}`
const EVENT_SHOWN = `shown${EVENT_KEY}`
const EVENT_CLICK_DATA_API = `click${EVENT_KEY}${DATA_API_KEY}`
const EVENT_KEYDOWN_DATA_API = `keydown${EVENT_KEY}${DATA_API_KEY}`
const EVENT_KEYUP_DATA_API = `keyup${EVENT_KEY}${DATA_API_KEY}`

const CLASS_NAME_SHOW = ''show''
const CLASS_NAME_DROPUP = ''dropup''
const CLASS_NAME_DROPEND = ''dropend''
const CLASS_NAME_DROPSTART = ''dropstart''
const CLASS_NAME_DROPUP_CENTER = ''dropup-center''
const CLASS_NAME_DROPDOWN_CENTER = ''dropdown-center''

const SELECTOR_DATA_TOGGLE = ''[data-bs-toggle="dropdown"]:not(.disabled):not(:disabled)''
const SELECTOR_DATA_TOGGLE_SHOWN = `${SELECTOR_DATA_TOGGLE}.${CLASS_NAME_SHOW}`
const SELECTOR_MENU = ''.dropdown-menu''
const SELECTOR_NAVBAR = ''.navbar''
const SELECTOR_NAVBAR_NAV = ''.navbar-nav''
const SELECTOR_VISIBLE_ITEMS = ''.dropdown-menu .dropdown-item:not(.disabled):not(:disabled)''

const PLACEMENT_TOP = isRTL() ? ''top-end'' : ''top-start''
const PLACEMENT_TOPEND = isRTL() ? ''top-start'' : ''top-end''
const PLACEMENT_BOTTOM = isRTL() ? ''bottom-end'' : ''bottom-start''
const PLACEMENT_BOTTOMEND = isRTL() ? ''bottom-start'' : ''bottom-end''
const PLACEMENT_RIGHT = isRTL() ? ''left-start'' : ''right-start''
const PLACEMENT_LEFT = isRTL() ? ''right-start'' : ''left-start''
const PLACEMENT_TOPCENTER = ''top''
const PLACEMENT_BOTTOMCENTER = ''bottom''

const Default = {
  autoClose: true,
  boundary: ''clippingParents'',
  display: ''dynamic'',
  offset: [0, 2],
  popperConfig: null,
  reference: ''toggle''
}

const DefaultType = {
  autoClose: ''(boolean|string)'',
  boundary: ''(string|element)'',
  display: ''string'',
  offset: ''(array|string|function)'',
  popperConfig: ''(null|object|function)'',
  reference: ''(string|element|object)''
}

/**
 * Class definition
 */

class Dropdown extends BaseComponent {
  constructor(element, config) {
    super(element, config)

    this._popper = null
    this._parent = this._element.parentNode // dropdown wrapper
    // TODO: v6 revert #37011 & change markup https://getbootstrap.com/docs/5.3/forms/input-group/
    this._menu = SelectorEngine.next(this._element, SELECTOR_MENU)[0] ||
      SelectorEngine.prev(this._element, SELECTOR_MENU)[0] ||
      SelectorEngine.findOne(SELECTOR_MENU, this._parent)
    this._inNavbar = this._detectNavbar()
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
  toggle() {
    return this._isShown() ? this.hide() : this.show()
  }

  show() {
    if (isDisabled(this._element) || this._isShown()) {
      return
    }

    const relatedTarget = {
      relatedTarget: this._element
    }

    const showEvent = EventHandler.trigger(this._element, EVENT_SHOW, relatedTarget)

    if (showEvent.defaultPrevented) {
      return
    }

    this._createPopper()

    // If this is a touch-enabled device we add extra
    // empty mouseover listeners to the body''s immediate children;
    // only needed because of broken event delegation on iOS
    // https://www.quirksmode.org/blog/archives/2014/02/mouse_event_bub.html
    if (''ontouchstart'' in document.documentElement && !this._parent.closest(SELECTOR_NAVBAR_NAV)) {
      for (const element of [].concat(...document.body.children)) {
        EventHandler.on(element, ''mouseover'', noop)
      }
    }

    this._element.focus()
    this._element.setAttribute(''aria-expanded'', true)

    this._menu.classList.add(CLASS_NAME_SHOW)
    this._element.classList.add(CLASS_NAME_SHOW)
    EventHandler.trigger(this._element, EVENT_SHOWN, relatedTarget)
  }

  hide() {
    if (isDisabled(this._element) || !this._isShown()) {
      return
    }

    const relatedTarget = {
      relatedTarget: this._element
    }

    this._completeHide(relatedTarget)
  }

  dispose() {
    if (this._popper) {
      this._popper.destroy()
    }

    super.dispose()
  }

  update() {
    this._inNavbar = this._detectNavbar()
    if (this._popper) {
      this._popper.update()
    }
  }

  // Private
  _completeHide(relatedTarget) {
    const hideEvent = EventHandler.trigger(this._element, EVENT_HIDE, relatedTarget)
    if (hideEvent.defaultPrevented) {
      return
    }

    // If this is a touch-enabled device we remove the extra
    // empty mouseover listeners we added for iOS support
    if (''ontouchstart'' in document.documentElement) {
      for (const element of [].concat(...document.body.children)) {
        EventHandler.off(element, ''mouseover'', noop)
      }
    }

    if (this._popper) {
      this._popper.destroy()
    }

    this._menu.classList.remove(CLASS_NAME_SHOW)
    this._element.classList.remove(CLASS_NAME_SHOW)
    this._element.setAttribute(''aria-expanded'', ''false'')
    Manipulator.removeDataAttribute(this._menu, ''popper'')
    EventHandler.trigger(this._element, EVENT_HIDDEN, relatedTarget)
  }

  _getConfig(config) {
    config = super._getConfig(config)

    if (typeof config.reference === ''object'' && !isElement(config.reference) &&
      typeof config.reference.getBoundingClientRect !== ''function''
    ) {
      // Popper virtual elements require a getBoundingClientRect method
      throw new TypeError(`${NAME.toUpperCase()}: Option "reference" provided type "object" without a required "getBoundingClientRect" method.`)
    }

    return config
  }

  _createPopper() {
    if (typeof Popper === ''undefined'') {
      throw new TypeError(''Bootstrap\''s dropdowns require Popper (https://popper.js.org/docs/v2/)'')
    }

    let referenceElement = this._element

    if (this._config.reference === ''parent'') {
      referenceElement = this._parent
    } else if (isElement(this._config.reference)) {
      referenceElement = getElement(this._config.reference)
    } else if (typeof this._config.reference === ''object'') {
      referenceElement = this._config.reference
    }

    const popperConfig = this._getPopperConfig()
    this._popper = Popper.createPopper(referenceElement, this._menu, popperConfig)
  }

  _isShown() {
    return this._menu.classList.contains(CLASS_NAME_SHOW)
  }

  _getPlacement() {
    const parentDropdown = this._parent

    if (parentDropdown.classList.contains(CLASS_NAME_DROPEND)) {
      return PLACEMENT_RIGHT
    }

    if (parentDropdown.classList.contains(CLASS_NAME_DROPSTART)) {
      return PLACEMENT_LEFT
    }

    if (parentDropdown.classList.contains(CLASS_NAME_DROPUP_CENTER)) {
      return PLACEMENT_TOPCENTER
    }

    if (parentDropdown.classList.contains(CLASS_NAME_DROPDOWN_CENTER)) {
      return PLACEMENT_BOTTOMCENTER
    }

    // We need to trim the value because custom properties can also include spaces
    const isEnd = getComputedStyle(this._menu).getPropertyValue(''--bs-position'').trim() === ''end''

    if (parentDropdown.classList.contains(CLASS_NAME_DROPUP)) {
      return isEnd ? PLACEMENT_TOPEND : PLACEMENT_TOP
    }

    return isEnd ? PLACEMENT_BOTTOMEND : PLACEMENT_BOTTOM
  }

  _detectNavbar() {
    return this._element.closest(SELECTOR_NAVBAR) !== null
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

  _getPopperConfig() {
    const defaultBsPopperConfig = {
      placement: this._getPlacement(),
      modifiers: [{
        name: ''preventOverflow'',
        options: {
          boundary: this._config.boundary
        }
      },
      {
        name: ''offset'',
        options: {
          offset: this._getOffset()
        }
      }]
    }

    // Disable Popper if we have a static display or Dropdown is in Navbar
    if (this._inNavbar || this._config.display === ''static'') {
      Manipulator.setDataAttribute(this._menu, ''popper'', ''static'') // TODO: v6 remove
      defaultBsPopperConfig.modifiers = [{
        name: ''applyStyles'',
        enabled: false
      }]
    }

    return {
      ...defaultBsPopperConfig,
      ...execute(this._config.popperConfig, [undefined, defaultBsPopperConfig])
    }
  }

  _selectMenuItem({ key, target }) {
    const items = SelectorEngine.find(SELECTOR_VISIBLE_ITEMS, this._menu).filter(element => isVisible(element))

    if (!items.length) {
      return
    }

    // if target isn''t included in items (e.g. when expanding the dropdown)
    // allow cycling to get the last item in case key equals ARROW_UP_KEY
    getNextActiveElement(items, target, key === ARROW_DOWN_KEY, !items.includes(target)).focus()
  }

  // Static
  static jQueryInterface(config) {
    return this.each(function () {
      const data = Dropdown.getOrCreateInstance(this, config)

      if (typeof config !== ''string'') {
        return
      }

      if (typeof data[config] === ''undefined'') {
        throw new TypeError(`No method named "${config}"`)
      }

      data[config]()
    })
  }

  static clearMenus(event) {
    if (event.button === RIGHT_MOUSE_BUTTON || (event.type === ''keyup'' && event.key !== TAB_KEY)) {
      return
    }

    const openToggles = SelectorEngine.find(SELECTOR_DATA_TOGGLE_SHOWN)

    for (const toggle of openToggles) {
      const context = Dropdown.getInstance(toggle)
      if (!context || context._config.autoClose === false) {
        continue
      }

      const composedPath = event.composedPath()
      const isMenuTarget = composedPath.includes(context._menu)
      if (
        composedPath.includes(context._element) ||
        (context._config.autoClose === ''inside'' && !isMenuTarget) ||
        (context._config.autoClose === ''outside'' && isMenuTarget)
      ) {
        continue
      }

      // Tab navigation through the dropdown menu or events from contained inputs shouldn''t close the menu
      if (context._menu.contains(event.target) && ((event.type === ''keyup'' && event.key === TAB_KEY) || /input|select|option|textarea|form/i.test(event.target.tagName))) {
        continue
      }

      const relatedTarget = { relatedTarget: context._element }

      if (event.type === ''click'') {
        relatedTarget.clickEvent = event
      }

      context._completeHide(relatedTarget)
    }
  }

  static dataApiKeydownHandler(event) {
    // If not an UP | DOWN | ESCAPE key => not a dropdown command
    // If input/textarea && if key is other than ESCAPE => not a dropdown command

    const isInput = /input|textarea/i.test(event.target.tagName)
    const isEscapeEvent = event.key === ESCAPE_KEY
    const isUpOrDownEvent = [ARROW_UP_KEY, ARROW_DOWN_KEY].includes(event.key)

    if (!isUpOrDownEvent && !isEscapeEvent) {
      return
    }

    if (isInput && !isEscapeEvent) {
      return
    }

    event.preventDefault()

    // TODO: v6 revert #37011 & change markup https://getbootstrap.com/docs/5.3/forms/input-group/
    const getToggleButton = this.matches(SELECTOR_DATA_TOGGLE) ?
      this :
      (SelectorEngine.prev(this, SELECTOR_DATA_TOGGLE)[0] ||
        SelectorEngine.next(this, SELECTOR_DATA_TOGGLE)[0] ||
        SelectorEngine.findOne(SELECTOR_DATA_TOGGLE, event.delegateTarget.parentNode))

    const instance = Dropdown.getOrCreateInstance(getToggleButton)

    if (isUpOrDownEvent) {
      event.stopPropagation()
      instance.show()
      instance._selectMenuItem(event)
      return
    }

    if (instance._isShown()) { // else is escape and we check if it is shown
      event.stopPropagation()
      instance.hide()
      getToggleButton.focus()
    }
  }
}

/**
 * Data API implementation
 */

EventHandler.on(document, EVENT_KEYDOWN_DATA_API, SELECTOR_DATA_TOGGLE, Dropdown.dataApiKeydownHandler)
EventHandler.on(document, EVENT_KEYDOWN_DATA_API, SELECTOR_MENU, Dropdown.dataApiKeydownHandler)
EventHandler.on(document, EVENT_CLICK_DATA_API, Dropdown.clearMenus)
EventHandler.on(document, EVENT_KEYUP_DATA_API, Dropdown.clearMenus)
EventHandler.on(document, EVENT_CLICK_DATA_API, SELECTOR_DATA_TOGGLE, function (event) {
  event.preventDefault()
  Dropdown.getOrCreateInstance(this).toggle()
})

/**
 * jQuery
 */

defineJQueryPlugin(Dropdown)

export default Dropdown' withPlatformLineEndings 
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptLongTest >> longStringExample3 [

	"long typescript code copied from a Bootstrap project on github https://github.com/twbs/bootstrap/blob/main/js/src/tooltip.js"

	^ '/**
 * --------------------------------------------------------------------------
 * Bootstrap tab.js
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/main/LICENSE)
 * --------------------------------------------------------------------------
 */

import BaseComponent from ''./base-component.js''
import EventHandler from ''./dom/event-handler.js''
import SelectorEngine from ''./dom/selector-engine.js''
import { defineJQueryPlugin, getNextActiveElement, isDisabled } from ''./util/index.js''

/**
 * Constants
 */

const NAME = ''tab''
const DATA_KEY = ''bs.tab''
const EVENT_KEY = `.${DATA_KEY}`

const EVENT_HIDE = `hide${EVENT_KEY}`
const EVENT_HIDDEN = `hidden${EVENT_KEY}`
const EVENT_SHOW = `show${EVENT_KEY}`
const EVENT_SHOWN = `shown${EVENT_KEY}`
const EVENT_CLICK_DATA_API = `click${EVENT_KEY}`
const EVENT_KEYDOWN = `keydown${EVENT_KEY}`
const EVENT_LOAD_DATA_API = `load${EVENT_KEY}`

const ARROW_LEFT_KEY = ''ArrowLeft''
const ARROW_RIGHT_KEY = ''ArrowRight''
const ARROW_UP_KEY = ''ArrowUp''
const ARROW_DOWN_KEY = ''ArrowDown''
const HOME_KEY = ''Home''
const END_KEY = ''End''

const CLASS_NAME_ACTIVE = ''active''
const CLASS_NAME_FADE = ''fade''
const CLASS_NAME_SHOW = ''show''
const CLASS_DROPDOWN = ''dropdown''

const SELECTOR_DROPDOWN_TOGGLE = ''.dropdown-toggle''
const SELECTOR_DROPDOWN_MENU = ''.dropdown-menu''
const NOT_SELECTOR_DROPDOWN_TOGGLE = `:not(${SELECTOR_DROPDOWN_TOGGLE})`

const SELECTOR_TAB_PANEL = ''.list-group, .nav, [role="tablist"]''
const SELECTOR_OUTER = ''.nav-item, .list-group-item''
const SELECTOR_INNER = `.nav-link${NOT_SELECTOR_DROPDOWN_TOGGLE}, .list-group-item${NOT_SELECTOR_DROPDOWN_TOGGLE}, [role="tab"]${NOT_SELECTOR_DROPDOWN_TOGGLE}`
const SELECTOR_DATA_TOGGLE = ''[data-bs-toggle="tab"], [data-bs-toggle="pill"], [data-bs-toggle="list"]'' // TODO: could only be `tab` in v6
const SELECTOR_INNER_ELEM = `${SELECTOR_INNER}, ${SELECTOR_DATA_TOGGLE}`

const SELECTOR_DATA_TOGGLE_ACTIVE = `.${CLASS_NAME_ACTIVE}[data-bs-toggle="tab"], .${CLASS_NAME_ACTIVE}[data-bs-toggle="pill"], .${CLASS_NAME_ACTIVE}[data-bs-toggle="list"]`

/**
 * Class definition
 */

class Tab extends BaseComponent {
  constructor(element) {
    super(element)
    this._parent = this._element.closest(SELECTOR_TAB_PANEL)

    if (!this._parent) {
      return
      // TODO: should throw exception in v6
      // throw new TypeError(`${element.outerHTML} has not a valid parent ${SELECTOR_INNER_ELEM}`)
    }

    // Set up initial aria attributes
    this._setInitialAttributes(this._parent, this._getChildren())

    EventHandler.on(this._element, EVENT_KEYDOWN, event => this._keydown(event))
  }

  // Getters
  static get NAME() {
    return NAME
  }

  // Public
  show() { // Shows this elem and deactivate the active sibling if exists
    const innerElem = this._element
    if (this._elemIsActive(innerElem)) {
      return
    }

    // Search for active tab on same parent to deactivate it
    const active = this._getActiveElem()

    const hideEvent = active ?
      EventHandler.trigger(active, EVENT_HIDE, { relatedTarget: innerElem }) :
      null

    const showEvent = EventHandler.trigger(innerElem, EVENT_SHOW, { relatedTarget: active })

    if (showEvent.defaultPrevented || (hideEvent && hideEvent.defaultPrevented)) {
      return
    }

    this._deactivate(active, innerElem)
    this._activate(innerElem, active)
  }

  // Private
  _activate(element, relatedElem) {
    if (!element) {
      return
    }

    element.classList.add(CLASS_NAME_ACTIVE)

    this._activate(SelectorEngine.getElementFromSelector(element)) // Search and activate/show the proper section

    const complete = () => {
      if (element.getAttribute(''role'') !== ''tab'') {
        element.classList.add(CLASS_NAME_SHOW)
        return
      }

      element.removeAttribute(''tabindex'')
      element.setAttribute(''aria-selected'', true)
      this._toggleDropDown(element, true)
      EventHandler.trigger(element, EVENT_SHOWN, {
        relatedTarget: relatedElem
      })
    }

    this._queueCallback(complete, element, element.classList.contains(CLASS_NAME_FADE))
  }

  _deactivate(element, relatedElem) {
    if (!element) {
      return
    }

    element.classList.remove(CLASS_NAME_ACTIVE)
    element.blur()

    this._deactivate(SelectorEngine.getElementFromSelector(element)) // Search and deactivate the shown section too

    const complete = () => {
      if (element.getAttribute(''role'') !== ''tab'') {
        element.classList.remove(CLASS_NAME_SHOW)
        return
      }

      element.setAttribute(''aria-selected'', false)
      element.setAttribute(''tabindex'', ''-1'')
      this._toggleDropDown(element, false)
      EventHandler.trigger(element, EVENT_HIDDEN, { relatedTarget: relatedElem })
    }

    this._queueCallback(complete, element, element.classList.contains(CLASS_NAME_FADE))
  }

  _keydown(event) {
    if (!([ARROW_LEFT_KEY, ARROW_RIGHT_KEY, ARROW_UP_KEY, ARROW_DOWN_KEY, HOME_KEY, END_KEY].includes(event.key))) {
      return
    }

    event.stopPropagation()// stopPropagation/preventDefault both added to support up/down keys without scrolling the page
    event.preventDefault()

    const children = this._getChildren().filter(element => !isDisabled(element))
    let nextActiveElement

    if ([HOME_KEY, END_KEY].includes(event.key)) {
      nextActiveElement = children[event.key === HOME_KEY ? 0 : children.length - 1]
    } else {
      const isNext = [ARROW_RIGHT_KEY, ARROW_DOWN_KEY].includes(event.key)
      nextActiveElement = getNextActiveElement(children, event.target, isNext, true)
    }

    if (nextActiveElement) {
      nextActiveElement.focus({ preventScroll: true })
      Tab.getOrCreateInstance(nextActiveElement).show()
    }
  }

  _getChildren() { // collection of inner elements
    return SelectorEngine.find(SELECTOR_INNER_ELEM, this._parent)
  }

  _getActiveElem() {
    return this._getChildren().find(child => this._elemIsActive(child)) || null
  }

  _setInitialAttributes(parent, children) {
    this._setAttributeIfNotExists(parent, ''role'', ''tablist'')

    for (const child of children) {
      this._setInitialAttributesOnChild(child)
    }
  }

  _setInitialAttributesOnChild(child) {
    child = this._getInnerElement(child)
    const isActive = this._elemIsActive(child)
    const outerElem = this._getOuterElement(child)
    child.setAttribute(''aria-selected'', isActive)

    if (outerElem !== child) {
      this._setAttributeIfNotExists(outerElem, ''role'', ''presentation'')
    }

    if (!isActive) {
      child.setAttribute(''tabindex'', ''-1'')
    }

    this._setAttributeIfNotExists(child, ''role'', ''tab'')

    // set attributes to the related panel too
    this._setInitialAttributesOnTargetPanel(child)
  }

  _setInitialAttributesOnTargetPanel(child) {
    const target = SelectorEngine.getElementFromSelector(child)

    if (!target) {
      return
    }

    this._setAttributeIfNotExists(target, ''role'', ''tabpanel'')

    if (child.id) {
      this._setAttributeIfNotExists(target, ''aria-labelledby'', `${child.id}`)
    }
  }

  _toggleDropDown(element, open) {
    const outerElem = this._getOuterElement(element)
    if (!outerElem.classList.contains(CLASS_DROPDOWN)) {
      return
    }

    const toggle = (selector, className) => {
      const element = SelectorEngine.findOne(selector, outerElem)
      if (element) {
        element.classList.toggle(className, open)
      }
    }

    toggle(SELECTOR_DROPDOWN_TOGGLE, CLASS_NAME_ACTIVE)
    toggle(SELECTOR_DROPDOWN_MENU, CLASS_NAME_SHOW)
    outerElem.setAttribute(''aria-expanded'', open)
  }

  _setAttributeIfNotExists(element, attribute, value) {
    if (!element.hasAttribute(attribute)) {
      element.setAttribute(attribute, value)
    }
  }

  _elemIsActive(elem) {
    return elem.classList.contains(CLASS_NAME_ACTIVE)
  }

  // Try to get the inner element (usually the .nav-link)
  _getInnerElement(elem) {
    return elem.matches(SELECTOR_INNER_ELEM) ? elem : SelectorEngine.findOne(SELECTOR_INNER_ELEM, elem)
  }

  // Try to get the outer element (usually the .nav-item)
  _getOuterElement(elem) {
    return elem.closest(SELECTOR_OUTER) || elem
  }

  // Static
  static jQueryInterface(config) {
    return this.each(function () {
      const data = Tab.getOrCreateInstance(this)

      if (typeof config !== ''string'') {
        return
      }

      if (data[config] === undefined || config.startsWith(''_'') || config === ''constructor'') {
        throw new TypeError(`No method named "${config}"`)
      }

      data[config]()
    })
  }
}

/**
 * Data API implementation
 */

EventHandler.on(document, EVENT_CLICK_DATA_API, SELECTOR_DATA_TOGGLE, function (event) {
  if ([''A'', ''AREA''].includes(this.tagName)) {
    event.preventDefault()
  }

  if (isDisabled(this)) {
    return
  }

  Tab.getOrCreateInstance(this).show()
})

/**
 * Initialize on focus
 */
EventHandler.on(window, EVENT_LOAD_DATA_API, () => {
  for (const element of SelectorEngine.find(SELECTOR_DATA_TOGGLE_ACTIVE)) {
    Tab.getOrCreateInstance(element)
  }
})
/**
 * jQuery
 */

defineJQueryPlugin(Tab)

export default Tab' withPlatformLineEndings
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptLongTest >> longStringExample4 [

	"long typescript code copied from a Bootstrap project on github https://github.com/twbs/bootstrap/blob/main/js/src/tooltip.js"

	^ '/**
 * --------------------------------------------------------------------------
 * Bootstrap dropdown.js
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/main/LICENSE)
 * --------------------------------------------------------------------------
 */

import * as Popper from ''@popperjs/core''
import BaseComponent from ''./base-component.js''
import EventHandler from ''./dom/event-handler.js''
import Manipulator from ''./dom/manipulator.js''
import SelectorEngine from ''./dom/selector-engine.js''
import {
  defineJQueryPlugin,
  execute,
  getElement,
  getNextActiveElement,
  isDisabled,
  isElement,
  isRTL,
  isVisible,
  noop
} from ''./util/index.js''

/**
 * Constants
 */

const NAME = ''dropdown''
const DATA_KEY = ''bs.dropdown''
const EVENT_KEY = `.${DATA_KEY}`
const DATA_API_KEY = ''.data-api''

const ESCAPE_KEY = ''Escape''
const TAB_KEY = ''Tab''
const ARROW_UP_KEY = ''ArrowUp''
const ARROW_DOWN_KEY = ''ArrowDown''
const RIGHT_MOUSE_BUTTON = 2 // MouseEvent.button value for the secondary button, usually the right button

const EVENT_HIDE = `hide${EVENT_KEY}`
const EVENT_HIDDEN = `hidden${EVENT_KEY}`
const EVENT_SHOW = `show${EVENT_KEY}`
const EVENT_SHOWN = `shown${EVENT_KEY}`
const EVENT_CLICK_DATA_API = `click${EVENT_KEY}${DATA_API_KEY}`
const EVENT_KEYDOWN_DATA_API = `keydown${EVENT_KEY}${DATA_API_KEY}`
const EVENT_KEYUP_DATA_API = `keyup${EVENT_KEY}${DATA_API_KEY}`

const CLASS_NAME_SHOW = ''show''
const CLASS_NAME_DROPUP = ''dropup''
const CLASS_NAME_DROPEND = ''dropend''
const CLASS_NAME_DROPSTART = ''dropstart''
const CLASS_NAME_DROPUP_CENTER = ''dropup-center''
const CLASS_NAME_DROPDOWN_CENTER = ''dropdown-center''

const SELECTOR_DATA_TOGGLE = ''[data-bs-toggle="dropdown"]:not(.disabled):not(:disabled)''
const SELECTOR_DATA_TOGGLE_SHOWN = `${SELECTOR_DATA_TOGGLE}.${CLASS_NAME_SHOW}`
const SELECTOR_MENU = ''.dropdown-menu''
const SELECTOR_NAVBAR = ''.navbar''
const SELECTOR_NAVBAR_NAV = ''.navbar-nav''
const SELECTOR_VISIBLE_ITEMS = ''.dropdown-menu .dropdown-item:not(.disabled):not(:disabled)''

const PLACEMENT_TOP = isRTL() ? ''top-end'' : ''top-start''
const PLACEMENT_TOPEND = isRTL() ? ''top-start'' : ''top-end''
const PLACEMENT_BOTTOM = isRTL() ? ''bottom-end'' : ''bottom-start''
const PLACEMENT_BOTTOMEND = isRTL() ? ''bottom-start'' : ''bottom-end''
const PLACEMENT_RIGHT = isRTL() ? ''left-start'' : ''right-start''
const PLACEMENT_LEFT = isRTL() ? ''right-start'' : ''left-start''
const PLACEMENT_TOPCENTER = ''top''
const PLACEMENT_BOTTOMCENTER = ''bottom''

const Default = {
  autoClose: true,
  boundary: ''clippingParents'',
  display: ''dynamic'',
  offset: [0, 2],
  popperConfig: null,
  reference: ''toggle''
}

const DefaultType = {
  autoClose: ''(boolean|string)'',
  boundary: ''(string|element)'',
  display: ''string'',
  offset: ''(array|string|function)'',
  popperConfig: ''(null|object|function)'',
  reference: ''(string|element|object)''
}

/**
 * Class definition
 */

class Dropdown extends BaseComponent {
  constructor(element, config) {
    super(element, config)

    this._popper = null
    this._parent = this._element.parentNode // dropdown wrapper
    // TODO: v6 revert #37011 & change markup https://getbootstrap.com/docs/5.3/forms/input-group/
    this._menu = SelectorEngine.next(this._element, SELECTOR_MENU)[0] ||
      SelectorEngine.prev(this._element, SELECTOR_MENU)[0] ||
      SelectorEngine.findOne(SELECTOR_MENU, this._parent)
    this._inNavbar = this._detectNavbar()
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
  toggle() {
    return this._isShown() ? this.hide() : this.show()
  }

  show() {
    if (isDisabled(this._element) || this._isShown()) {
      return
    }

    const relatedTarget = {
      relatedTarget: this._element
    }

    const showEvent = EventHandler.trigger(this._element, EVENT_SHOW, relatedTarget)

    if (showEvent.defaultPrevented) {
      return
    }

    this._createPopper()

    // If this is a touch-enabled device we add extra
    // empty mouseover listeners to the body''s immediate children;
    // only needed because of broken event delegation on iOS
    // https://www.quirksmode.org/blog/archives/2014/02/mouse_event_bub.html
    if (''ontouchstart'' in document.documentElement && !this._parent.closest(SELECTOR_NAVBAR_NAV)) {
      for (const element of [].concat(...document.body.children)) {
        EventHandler.on(element, ''mouseover'', noop)
      }
    }

    this._element.focus()
    this._element.setAttribute(''aria-expanded'', true)

    this._menu.classList.add(CLASS_NAME_SHOW)
    this._element.classList.add(CLASS_NAME_SHOW)
    EventHandler.trigger(this._element, EVENT_SHOWN, relatedTarget)
  }

  hide() {
    if (isDisabled(this._element) || !this._isShown()) {
      return
    }

    const relatedTarget = {
      relatedTarget: this._element
    }

    this._completeHide(relatedTarget)
  }

  dispose() {
    if (this._popper) {
      this._popper.destroy()
    }

    super.dispose()
  }

  update() {
    this._inNavbar = this._detectNavbar()
    if (this._popper) {
      this._popper.update()
    }
  }

  // Private
  _completeHide(relatedTarget) {
    const hideEvent = EventHandler.trigger(this._element, EVENT_HIDE, relatedTarget)
    if (hideEvent.defaultPrevented) {
      return
    }

    // If this is a touch-enabled device we remove the extra
    // empty mouseover listeners we added for iOS support
    if (''ontouchstart'' in document.documentElement) {
      for (const element of [].concat(...document.body.children)) {
        EventHandler.off(element, ''mouseover'', noop)
      }
    }

    if (this._popper) {
      this._popper.destroy()
    }

    this._menu.classList.remove(CLASS_NAME_SHOW)
    this._element.classList.remove(CLASS_NAME_SHOW)
    this._element.setAttribute(''aria-expanded'', ''false'')
    Manipulator.removeDataAttribute(this._menu, ''popper'')
    EventHandler.trigger(this._element, EVENT_HIDDEN, relatedTarget)
  }

  _getConfig(config) {
    config = super._getConfig(config)

    if (typeof config.reference === ''object'' && !isElement(config.reference) &&
      typeof config.reference.getBoundingClientRect !== ''function''
    ) {
      // Popper virtual elements require a getBoundingClientRect method
      throw new TypeError(`${NAME.toUpperCase()}: Option "reference" provided type "object" without a required "getBoundingClientRect" method.`)
    }

    return config
  }

  _createPopper() {
    if (typeof Popper === ''undefined'') {
      throw new TypeError(''Bootstrap\''s dropdowns require Popper (https://popper.js.org/docs/v2/)'')
    }

    let referenceElement = this._element

    if (this._config.reference === ''parent'') {
      referenceElement = this._parent
    } else if (isElement(this._config.reference)) {
      referenceElement = getElement(this._config.reference)
    } else if (typeof this._config.reference === ''object'') {
      referenceElement = this._config.reference
    }

    const popperConfig = this._getPopperConfig()
    this._popper = Popper.createPopper(referenceElement, this._menu, popperConfig)
  }

  _isShown() {
    return this._menu.classList.contains(CLASS_NAME_SHOW)
  }

  _getPlacement() {
    const parentDropdown = this._parent

    if (parentDropdown.classList.contains(CLASS_NAME_DROPEND)) {
      return PLACEMENT_RIGHT
    }

    if (parentDropdown.classList.contains(CLASS_NAME_DROPSTART)) {
      return PLACEMENT_LEFT
    }

    if (parentDropdown.classList.contains(CLASS_NAME_DROPUP_CENTER)) {
      return PLACEMENT_TOPCENTER
    }

    if (parentDropdown.classList.contains(CLASS_NAME_DROPDOWN_CENTER)) {
      return PLACEMENT_BOTTOMCENTER
    }

    // We need to trim the value because custom properties can also include spaces
    const isEnd = getComputedStyle(this._menu).getPropertyValue(''--bs-position'').trim() === ''end''

    if (parentDropdown.classList.contains(CLASS_NAME_DROPUP)) {
      return isEnd ? PLACEMENT_TOPEND : PLACEMENT_TOP
    }

    return isEnd ? PLACEMENT_BOTTOMEND : PLACEMENT_BOTTOM
  }

  _detectNavbar() {
    return this._element.closest(SELECTOR_NAVBAR) !== null
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

  _getPopperConfig() {
    const defaultBsPopperConfig = {
      placement: this._getPlacement(),
      modifiers: [{
        name: ''preventOverflow'',
        options: {
          boundary: this._config.boundary
        }
      },
      {
        name: ''offset'',
        options: {
          offset: this._getOffset()
        }
      }]
    }

    // Disable Popper if we have a static display or Dropdown is in Navbar
    if (this._inNavbar || this._config.display === ''static'') {
      Manipulator.setDataAttribute(this._menu, ''popper'', ''static'') // TODO: v6 remove
      defaultBsPopperConfig.modifiers = [{
        name: ''applyStyles'',
        enabled: false
      }]
    }

    return {
      ...defaultBsPopperConfig,
      ...execute(this._config.popperConfig, [undefined, defaultBsPopperConfig])
    }
  }

  _selectMenuItem({ key, target }) {
    const items = SelectorEngine.find(SELECTOR_VISIBLE_ITEMS, this._menu).filter(element => isVisible(element))

    if (!items.length) {
      return
    }

    // if target isn''t included in items (e.g. when expanding the dropdown)
    // allow cycling to get the last item in case key equals ARROW_UP_KEY
    getNextActiveElement(items, target, key === ARROW_DOWN_KEY, !items.includes(target)).focus()
  }

  // Static
  static jQueryInterface(config) {
    return this.each(function () {
      const data = Dropdown.getOrCreateInstance(this, config)

      if (typeof config !== ''string'') {
        return
      }

      if (typeof data[config] === ''undefined'') {
        throw new TypeError(`No method named "${config}"`)
      }

      data[config]()
    })
  }

  static clearMenus(event) {
    if (event.button === RIGHT_MOUSE_BUTTON || (event.type === ''keyup'' && event.key !== TAB_KEY)) {
      return
    }

    const openToggles = SelectorEngine.find(SELECTOR_DATA_TOGGLE_SHOWN)

    for (const toggle of openToggles) {
      const context = Dropdown.getInstance(toggle)
      if (!context || context._config.autoClose === false) {
        continue
      }

      const composedPath = event.composedPath()
      const isMenuTarget = composedPath.includes(context._menu)
      if (
        composedPath.includes(context._element) ||
        (context._config.autoClose === ''inside'' && !isMenuTarget) ||
        (context._config.autoClose === ''outside'' && isMenuTarget)
      ) {
        continue
      }

      // Tab navigation through the dropdown menu or events from contained inputs shouldn''t close the menu
      if (context._menu.contains(event.target) && ((event.type === ''keyup'' && event.key === TAB_KEY) || /input|select|option|textarea|form/i.test(event.target.tagName))) {
        continue
      }

      const relatedTarget = { relatedTarget: context._element }

      if (event.type === ''click'') {
        relatedTarget.clickEvent = event
      }

      context._completeHide(relatedTarget)
    }
  }

  static dataApiKeydownHandler(event) {
    // If not an UP | DOWN | ESCAPE key => not a dropdown command
    // If input/textarea && if key is other than ESCAPE => not a dropdown command

    const isInput = /input|textarea/i.test(event.target.tagName)
    const isEscapeEvent = event.key === ESCAPE_KEY
    const isUpOrDownEvent = [ARROW_UP_KEY, ARROW_DOWN_KEY].includes(event.key)

    if (!isUpOrDownEvent && !isEscapeEvent) {
      return
    }

    if (isInput && !isEscapeEvent) {
      return
    }

    event.preventDefault()

    // TODO: v6 revert #37011 & change markup https://getbootstrap.com/docs/5.3/forms/input-group/
    const getToggleButton = this.matches(SELECTOR_DATA_TOGGLE) ?
      this :
      (SelectorEngine.prev(this, SELECTOR_DATA_TOGGLE)[0] ||
        SelectorEngine.next(this, SELECTOR_DATA_TOGGLE)[0] ||
        SelectorEngine.findOne(SELECTOR_DATA_TOGGLE, event.delegateTarget.parentNode))

    const instance = Dropdown.getOrCreateInstance(getToggleButton)

    if (isUpOrDownEvent) {
      event.stopPropagation()
      instance.show()
      instance._selectMenuItem(event)
      return
    }

    if (instance._isShown()) { // else is escape and we check if it is shown
      event.stopPropagation()
      instance.hide()
      getToggleButton.focus()
    }
  }
}

/**
 * Data API implementation
 */

EventHandler.on(document, EVENT_KEYDOWN_DATA_API, SELECTOR_DATA_TOGGLE, Dropdown.dataApiKeydownHandler)
EventHandler.on(document, EVENT_KEYDOWN_DATA_API, SELECTOR_MENU, Dropdown.dataApiKeydownHandler)
EventHandler.on(document, EVENT_CLICK_DATA_API, Dropdown.clearMenus)
EventHandler.on(document, EVENT_KEYUP_DATA_API, Dropdown.clearMenus)
EventHandler.on(document, EVENT_CLICK_DATA_API, SELECTOR_DATA_TOGGLE, function (event) {
  event.preventDefault()
  Dropdown.getOrCreateInstance(this).toggle()
})

/**
 * jQuery
 */

defineJQueryPlugin(Dropdown)

export default Dropdown' withPlatformLineEndings
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptLongTest >> newLongStringDeleteBeginning [

	"deleting the comment at the beginning"

	^ 'import * as Popper from ''@popperjs/core''
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

export default Tooltip' withPlatformLineEndings
]

{ #category : 'instance creation' }
TSIncrementalParsingTypescriptLongTest >> newLongStringDeleteEnd [

	"deleting in the middle: removing all imports"
	
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

' withPlatformLineEndings
]

{ #category : 'instance creation' }
TSIncrementalParsingTypescriptLongTest >> newLongStringDeleteMiddle [

	"deleting in the middle: removing all imports"
	
	^ '/**
 * --------------------------------------------------------------------------
 * Bootstrap tooltip.js
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/main/LICENSE)
 * --------------------------------------------------------------------------
 */


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

export default Tooltip' withPlatformLineEndings
]

{ #category : 'instance creation' }
TSIncrementalParsingTypescriptLongTest >> newLongStringInsertBeginning [

	"Inserting new comment at the beginning"
	
	^ '/**
 * --------------------------------------------------------------------------
 * Bootstrap tooltip.js
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/main/LICENSE)
 * --------------------------------------------------------------------------
 */
/**
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

export default Tooltip' withPlatformLineEndings
]

{ #category : 'instance creation' }
TSIncrementalParsingTypescriptLongTest >> newLongStringInsertEnd [

	"Adding console log at the end"
	
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

export default Tooltip
console.log(greeter(user));' withPlatformLineEndings 
]

{ #category : 'instance creation' }
TSIncrementalParsingTypescriptLongTest >> newLongStringInsertMiddle [
	"new interface inserted between last const and class declaration"
	
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
interface Person {
	firstName: string;
	lastName: string;
}
 
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

export default Tooltip' withPlatformLineEndings 
]

{ #category : 'instance creation' }
TSIncrementalParsingTypescriptLongTest >> newLongStringUpdateBeginning [

	"replacing comment by import at the beginning"
	
	^ 'import * as Popper from ''@popperjs/core''

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

export default Tooltip' withPlatformLineEndings 
]

{ #category : 'instance creation' }
TSIncrementalParsingTypescriptLongTest >> newLongStringUpdateEnd [

	"replacing export by console.log"
	
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


console.log(greeter(user));' withPlatformLineEndings
]

{ #category : 'instance creation' }
TSIncrementalParsingTypescriptLongTest >> newLongStringUpdateMiddle [

	"replacing the last const, defined before comment and class definition named Tooltip, by a class"
	
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

class DefaultType {
  allowList: object = {};
  animation: boolean = false;
  boundary: string | Element = '''';
  container: string | Element | boolean = false;
  customClass: string | ((arg: any) => any) = '''';
  delay: number | object = 0;
  fallbackPlacements: any[] = [];
  html: boolean = false;
  offset: any[] | string | ((arg: any) => any) = [];
  placement: string | ((arg: any) => any) = '''';
  popperConfig: null | object | ((arg: any) => any) = null;
  sanitize: boolean = false;
  sanitizeFn: null | ((arg: any) => any) = null;
  selector: string | boolean = '''';
  template: string = '''';
  title: string | Element | ((arg: any) => any) = '''';
  trigger: string = '''';
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

export default Tooltip' withPlatformLineEndings
]

{ #category : 'running' }
TSIncrementalParsingTypescriptLongTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	typescriptLanguage := TSLanguage typescript.
	parser language: typescriptLanguage
]

{ #category : 'running' }
TSIncrementalParsingTypescriptLongTest >> tearDown [

	parser reset.
	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongDeleteBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 39."
	self assert:  originalTree rootNode firstNamedChild type equals: 'comment'.
			
	newTree := self editTreeForDeleteBeginingLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size < originalTree rootNode collectNamedChild size.
	self assert:  newTree rootNode firstNamedChild type equals: 'import_statement'. 
	self assert:  newTree rootNode endByte equals: self newLongStringDeleteBeginning size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongDeleteEnd [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 39."
	self assert:  originalTree rootNode collectNamedChild last type equals: 'export_statement'.
			
	newTree := self editTreeForDeleteEndLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size < originalTree rootNode collectNamedChild size.
	self assert:  newTree rootNode collectNamedChild last type equals: 'expression_statement'. 
	self assert:  newTree rootNode endByte equals: self newLongStringDeleteEnd size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongDeleteMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 39."
	self assert:  originalTree rootNode firstNamedChild type equals: 'comment'.
			
	newTree := self editTreeForDeleteMiddleLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size < originalTree rootNode collectNamedChild size.
	self assert:  newTree rootNode firstNamedChild type equals: 'comment'. 
	self assert:  newTree rootNode endByte equals: self newLongStringDeleteMiddle size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongInsertBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 39."
	self assert:  originalTree rootNode firstNamedChild type equals: 'comment'.
			
	newTree := self editTreeForInsertBeginningLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size > originalTree rootNode collectNamedChild size.
	self assert:  newTree rootNode firstNamedChild type equals: 'comment'.  
	self assert:  newTree rootNode collectNamedChild second type equals: 'comment'. 
	self assert:  newTree rootNode endByte equals: self newLongStringInsertBeginning size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongInsertEnd [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 39."
	self assert:  originalTree rootNode collectNamedChild last type equals: 'export_statement'.
			
	newTree := self editTreeForInsertEndLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size > originalTree rootNode collectNamedChild size. 
	self assert:  newTree rootNode collectNamedChild last type equals: 'expression_statement'. 	
	self assert:  newTree rootNode endByte equals: self newLongStringInsertEnd size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongInsertMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 39."
	self assert: (originalTree rootNode namedChildAt: 36) type equals: 'class_declaration'.
			
	newTree := self editTreeForInsertMiddleLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size >  originalTree rootNode collectNamedChild size.
	self assert:  (newTree rootNode namedChildAt: 36) type equals: 'interface_declaration'. 
	self assert:  (newTree rootNode namedChildAt: 37) type equals: 'class_declaration'. 	
	self assert:  newTree rootNode endByte equals: self newLongStringInsertMiddle size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongUpdateBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 39."
	self assert:  originalTree rootNode firstNamedChild type equals: 'comment'.
			
	newTree := self editTreeForUpdateBeginningLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: originalTree rootNode collectNamedChild size . 
	self assert:  newTree rootNode firstNamedChild type equals: 'import_statement'. 	
	self assert:  newTree rootNode endByte equals: self newLongStringUpdateBeginning size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongUpdateEnd [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 39."
	self assert: originalTree rootNode collectNamedChild last type equals: 'export_statement'.
			
	newTree := self editTreeForUpdateEndLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: originalTree rootNode collectNamedChild size . 
	self assert:  newTree rootNode collectNamedChild last type equals: 'expression_statement'. 	
	self assert:  newTree rootNode endByte equals: self newLongStringUpdateEnd size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongUpdateMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 39."
	self assert:   (originalTree rootNode namedChildAt: 34) type equals: 'lexical_declaration'.
			
	newTree := self editTreeForUpdateMiddleLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: originalTree rootNode collectNamedChild size. 
	self assert:  (newTree rootNode namedChildAt: 34) type equals: 'class_declaration'. 	
	self assert:  newTree rootNode endByte equals: self newLongStringUpdateMiddle size .
]
