open ReactNative

type index = int

type renderItemProps<'item> = {item: 'item, index: index}

type itemLayout = {@set "span": int}

type cellRendererComponentProps<'element> = {
  ref?: Ref.t<'element>,
  children: React.element,
  index: index,
  onLayout: Event.layoutEvent => unit,
  style: Style.t,
}

type element
type ref = Ref.t<element>

@send
external prepareForLayoutAnimationRender: element => unit = "prepareForLayoutAnimationRender"

@send
external recordInteraction: element => unit = "recordInteraction"

@send
external recomputeViewableItems: element => unit = "recomputeViewableItems"

type scrollToEndParams = {animated?: bool /* , duration?: float */}
@send
external scrollToEnd: (element, ~params: scrollToEndParams=?) => unit = "scrollToEnd"

type scrollToIndexParams = {index: index, animated?: bool, viewOffset?: float, viewPosition?: float}
@send
external scrollToIndex: (element, scrollToIndexParams) => unit = "scrollToIndex"

type scrollToItemParams<'item> = {item: 'item, animated?: bool, viewPosition?: float}
@send
external scrollToItem: (element, scrollToItemParams<'item>) => unit = "scrollToItem"

type scrollToOffsetParams = {animated?: bool, offset: float}
@send
external scrollToOffset: (element, scrollToOffsetParams) => unit = "scrollToOffset"

type viewToken<'item> = {
  index: index,
  isViewable: bool,
  item: 'item,
  key: string,
  timestamp: int,
}

type viewableInfo<'item> = {
  viewableItems: array<viewToken<'item>>,
  changed: array<viewToken<'item>>,
}

type viewabilityConfig = {
  minimumViewTime?: int,
  viewAreaCoveragePercentThreshold?: float,
  itemVisiblePercentThreshold?: float,
  waitForInteraction?: bool,
}

type maintainVisibleContentPosition = {
  disabled?: bool,
  autoscrollToTopThreshold?: float,
  autoscrollToBottomThreshold?: float,
  animateAutoScrollToBottom?: bool,
  startRenderingFromBottom?: bool,
}

type initialScrollIndexParams = {viewOffset?: float}

type props<'item, 'cellElement> = {
  ref?: ref,
  ...ScrollView.scrollViewPropsWithoutListConflict,
  renderItem: renderItemProps<'item> => React.element,
  data: array<'item>,
  \"CellRendererComponent"?: cellRendererComponentProps<'cellElement> => React.element,
  \"ItemSeparatorComponent"?: unit => React.element,
  \"ListEmptyComponent"?: React.element,
  \"ListFooterComponent"?: unit => React.element,
  \"ListFooterComponentStyle"?: Style.t,
  \"ListHeaderComponent"?: unit => React.element,
  \"ListHeaderComponentStyle"?: Style.t,
  drawDistance?: float,
  extraData?: {.},
  initialScrollIndex?: int,
  initialScrollIndexParams?: initialScrollIndexParams,
  keyExtractor: ('item, index) => string,
  maintainVisibleContentPosition?: maintainVisibleContentPosition,
  masonry?: bool,
  maxItemsInRecyclePool?: bool,
  numColumns?: int,
  onCommitLayoutEffect?: unit => unit,
  onEndReached?: unit => unit,
  onEndReachedThreshold?: float,
  //onLoad: TODO
  onRefresh?: unit => unit,
  getItemType?: ('item, index) => string,
  onStartReached?: unit => unit,
  onStartReachedThreshold?: float,
  onViewableItemsChanged?: viewableInfo<'item> => unit,
  optimizeItemArrangement?: bool,
  overrideItemLayout?: (itemLayout, 'item) => unit,
  // overrideProps: TODO
  progressViewOffset?: float,
  refreshing?: bool,
  renderScrollComponent?: React.component<ScrollView.props>,
  viewabilityConfig?: viewabilityConfig,
}

@module("@shopify/flash-list")
external make: React.component<props<'item, 'cellElement>> = "FlashList"

module AnimatedFlashList = {
  @module("@shopify/flash-list")
  external make: React.component<props<'item, 'cellElement>> = "AnimatedFlashList"
}
