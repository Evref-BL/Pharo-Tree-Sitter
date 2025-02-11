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

export default Tooltip'
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

export default Tooltip'
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

'
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

export default Tooltip'
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

export default Tooltip'
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
console.log(greeter(user));'
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

export default Tooltip'
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

export default Tooltip'
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


console.log(greeter(user));'
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

export default Tooltip'
]

{ #category : 'running' }
TSIncrementalParsingTypescriptLongTest >> setUp [

	super setUp.

	parser := TSParser new.
	typescriptLanguage := TSLanguage typescript .
	parser language: typescriptLanguage.
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
	self assert: originalTree rootNode collectNamedChild size equals: 39.
	self assert:  originalTree rootNode collectNamedChild first type equals: 'comment'.
			
	newTree := self editTreeForDeleteBeginingLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 38.
	self assert:  newTree rootNode collectNamedChild first type equals: 'import_statement'. 
	self assert:  newTree rootNode endByte equals: self newLongStringDeleteBeginning size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongDeleteEnd [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 39.
	self assert:  originalTree rootNode collectNamedChild last type equals: 'export_statement'.
			
	newTree := self editTreeForDeleteEndLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 38.
	self assert:  newTree rootNode collectNamedChild last type equals: 'expression_statement'. 
	self assert:  newTree rootNode endByte equals: self newLongStringDeleteEnd size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongDeleteMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 39.
	self assert:  originalTree rootNode collectNamedChild first type equals: 'comment'.
			
	newTree := self editTreeForDeleteMiddleLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 32.
	self assert:  newTree rootNode collectNamedChild first type equals: 'comment'. 
	self assert:  newTree rootNode endByte equals: self newLongStringDeleteMiddle size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongInsertBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 39.
	self assert:  originalTree rootNode collectNamedChild first type equals: 'comment'.
			
	newTree := self editTreeForInsertBeginningLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 40.
	self assert:  newTree rootNode collectNamedChild first type equals: 'comment'.  
	self assert:  newTree rootNode collectNamedChild second type equals: 'comment'. 
	self assert:  newTree rootNode endByte equals: self newLongStringInsertBeginning size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongInsertEnd [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 39.
	self assert:  originalTree rootNode collectNamedChild last type equals: 'export_statement'.
			
	newTree := self editTreeForInsertEndLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 40. 
	self assert:  newTree rootNode collectNamedChild last type equals: 'expression_statement'. 	
	self assert:  newTree rootNode endByte equals: self newLongStringInsertEnd size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongInsertMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 39.
	self assert: (originalTree rootNode namedChildAt: 36) type equals: 'class_declaration'.
			
	newTree := self editTreeForInsertMiddleLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 40.
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
	self assert: originalTree rootNode collectNamedChild size equals: 39.
	self assert:  originalTree rootNode collectNamedChild first type equals: 'comment'.
			
	newTree := self editTreeForUpdateBeginningLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 39. 
	self assert:  newTree rootNode collectNamedChild first type equals: 'import_statement'. 	
	self assert:  newTree rootNode endByte equals: self newLongStringUpdateBeginning size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongUpdateEnd [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 39.
	self assert: originalTree rootNode collectNamedChild last type equals: 'export_statement'.
			
	newTree := self editTreeForUpdateEndLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 39. 
	self assert:  newTree rootNode collectNamedChild last type equals: 'expression_statement'. 	
	self assert:  newTree rootNode endByte equals: self newLongStringUpdateEnd size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptLongTest >> testTypescriptIncrementalParsingLongUpdateMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self longStringExample.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 39.
	self assert:   (originalTree rootNode namedChildAt: 34) type equals: 'lexical_declaration'.
			
	newTree := self editTreeForUpdateMiddleLongExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 39. 
	self assert:  (newTree rootNode namedChildAt: 34) type equals: 'class_declaration'. 	
	self assert:  newTree rootNode endByte equals: self newLongStringUpdateMiddle size .
]
