open ReactNative

type index = int

type renderItemProps<'item> = {item: 'item, index: index}

type itemLayout = {@set "span": int, @set "size": float}

type dimension = {height: float, width: float}

module CellContainer = {
  type props = {
    ref?: NativeElement.ref,
    children: React.element,
    index: index,
    onLayout: Event.layoutEvent => unit,
    style: Style.t,
  }

  @module("@shopify/flash-list")
  external make: React.component<props> = "CellContainer"
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

type recyclerListViewProps = {
  initialOffset?: float,
  renderAheadOffset?: float,
  scrollThrottle?: int,
}

type props<'item> = {
  ref?: ref,
  ...ScrollView.scrollViewProps,
  ...recyclerListViewProps,
  renderItem: renderItemProps<'item> => React.element,
  data: array<'item>,
  estimatedItemSize?: float,
  \"CellRendererComponent"?: CellContainer.props => React.element,
  \"ItemSeparatorComponent"?: unit => React.element,
  \"ListEmptyComponent"?: React.element,
  \"ListFooterComponent"?: unit => React.element,
  \"ListFooterComponentStyle"?: Style.t,
  \"ListHeaderComponent"?: unit => React.element,
  \"ListHeaderComponentStyle"?: Style.t,
  disableAutoLayout?: bool,
  disableHorizontalListHeightMeasurement?: bool,
  drawDistance?: float,
  estimatedFirstItemOffset?: float,
  estimatedListSize?: dimension,
  extraData?: {.},
  initialScrollIndex?: int,
  inverted?: bool,
  keyExtractor: ('item, index) => string,
  numColumns?: int,
  //onBlankArea: TODO
  onEndReached?: unit => unit,
  onEndReachedThreshold?: float,
  //onLoad: TODO
  onViewableItemsChanged?: viewableInfo<'item> => unit,
  onRefresh?: unit => unit,
  getItemType?: ('item, index) => string,
  overrideItemLayout?: (itemLayout, 'item, index) => unit,
  // overrideProps: TODO
  progressViewOffset?: float,
  refreshing?: bool,
  renderScrollComponent?: React.component<ScrollView.props>,
  viewabilityConfig?: viewabilityConfig,
}

@module("@shopify/flash-list")
external make: React.component<props<'item>> = "FlashList"

module AnimatedFlashList = {
  @module("@shopify/flash-list")
  external make: React.component<props<'item>> = "AnimatedFlashList"
}
