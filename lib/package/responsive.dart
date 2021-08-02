// ==== CHANGELOGS ====
// v1.0.0.0 = MediaQuery is declared internally, users just need to provide a context
// v2.0.0.0 = internal MediaQuery is removed in favor of making it a parameter to prevent it from getting invoked multiple times
// v2.1.0.0 = users can now declare a single breakpoint for bootstrapBreakpoint, ealier versions throw an error if you don't declare all breakpoints, ie: declaring valueFor768px only
// ==== CHANGELOGS ====

// Responsive class helps you render a value
// depending on the breakpoint

// anything can be responsive on the data/value level
// or widget level or anywhere as long as context is available
// IMPORTANT: there are widget properties that can only be declared once!

// Responsive has 2 static methods
// breakpointMap = render values depending on user defined breakpoints
// bootstrapBreakpoint = render values depending on bootstrap breakpoints

// see examples below for usage

class Responsive {
  // ! ========================
  // ! ==== BREAKPOINT MAP ====
  // ! ========================
  // breakpointMap returns a user defined value based on user defined breakpoints
  // breakpointMap must be always inside a BuildContext
  static dynamic breakpointMap({
    // mediaQuerySizeWidth = MediaQuery.of(context).size.width;
    // always declare var screenWidth = MediaQuery.of(context).size.width
    // before you return a scaffold so that you don't have to create
    // multiple instance of MediaQuery
    mediaQuerySizeWidth,

    // by default, breakpointMap uses max width to determine breakpoints
    // setting mobileFirst to true will enable this method to use min width
    // if mobileFirst is enabled, start from the smallest breakpoint going up
    // if mobileFirst is false, start from the highest breakpoint going down
    mobileFirst = false,

    // initialValue = the initial value to return. duhh
    // the fallback value if screen is larger/smaller than the given breakpoints
    initialValue,

    // breakpointMap = a map of width: value
    // value will change depending on screen width
    required Map<double, dynamic> breakpointMap,
  }) {
    // value = initialValue: the value to return on first render
    // if the screen is larger than the given breakpoints
    // then initialValue will be shown
    // ie: breakpointmap's largest value is 1000 but screen is 1440px
    var value = initialValue;

    // map of user defined breakpoint and the value related to it
    if (breakpointMap != null && mobileFirst == false) {
      // iterate through the user defined map and set the breakpoints and values
      // uses MAX width
      breakpointMap.forEach((key, mapValue) {
        if (mediaQuerySizeWidth <= key) value = mapValue;
      });
    }

    if (breakpointMap != null && mobileFirst == true) {
      // iterate through the user defined map and set the breakpoints and values
      // uses MIN width
      breakpointMap.forEach((key, mapValue) {
        if (mediaQuerySizeWidth >= key) value = mapValue;
      });
    }

    return value;
  }

  // ! ==============================
  // ! ==== BOOTSTRAP BREAKPOINT ====
  // ! ==============================
  // bootstrapBreakpoint follows bootstrap grid breakpoints
  static dynamic bootstrapBreakpoint({
    // mediaQuerySizeWidth = MediaQuery.of(context).size.width;
    // always declare var screenWidth = MediaQuery.of(context).size.width
    // before you return a scaffold so that you don't have to create
    // multiple instance of MediaQuery
    mediaQuerySizeWidth,

    // by default, bootstrapBreakpoint uses max width to determine breakpoints
    // setting mobileFirst to true will enable this method to use min width
    mobileFirst = false,

    // initialValue = the initial value to return. duhh
    // the fallback value if screen is larger than the given breakpoints
    initialValue,

    // breakpoints
    valueFor1200px,
    valueFor992px,
    valueFor768px,
    valueFor576px,
  }) {
    // value = initialValue: the value to return on first render
    var value = initialValue;

    // if mobileFirst is false
    if (mobileFirst == false) {
      if (valueFor1200px != null && mediaQuerySizeWidth <= 1200)
        value = valueFor1200px;
      if (valueFor992px != null && mediaQuerySizeWidth <= 992)
        value = valueFor992px;
      if (valueFor768px != null && mediaQuerySizeWidth <= 768)
        value = valueFor768px;
      if (valueFor576px != null && mediaQuerySizeWidth <= 576)
        value = valueFor576px;
    }

    // if mobileFirst is true
    if (mobileFirst == true) {
      if (valueFor576px != null && mediaQuerySizeWidth >= 576)
        value = valueFor576px;
      if (valueFor768px != null && mediaQuerySizeWidth >= 768)
        value = valueFor768px;
      if (valueFor992px != null && mediaQuerySizeWidth >= 992)
        value = valueFor992px;
      if (valueFor1200px != null && mediaQuerySizeWidth >= 1200)
        value = valueFor1200px;
    }

    return value;
  }
}

// ===========================
// ===== EXAMPLE WIDGETS =====
// you are allow to define
// a single breakpoint only
// ===========================

// ======================================
// ==== BREAKPOINT MAP DESKTOP FIRST ====
// always write your breakpoints from
// highest to lowest (descending)
//
// always declare var screenWidth = MediaQuery.of(context).size.width
// before you return a scaffold so that you don't have to create
// multiple instance of MediaQuery
// ======================================
//*   var screenWidth = MediaQuery.of(context).size.width;
//    ...
//    Text(
//      Responsive.breakpointMap(
//*       mediaQuerySizeWidth: screenWidth,
//        initialValue: 'this is the initial value',
//        breakpointMap: {
//          1200: 'value for 1200px',
//          992: 'value for 992px',
//          768: 'value for 768px',
//          576: 'value for 576px',
//        },
//      ),
//    )

// =====================================
// ==== BREAKPOINT MAP MOBILE FIRST ====
// always write your breakpoints from
// lowest to highest (ascending)
//
// always declare var screenWidth = MediaQuery.of(context).size.width
// before you return a scaffold so that you don't have to create
// multiple instance of MediaQuery
// =====================================
//*   var screenWidth = MediaQuery.of(context).size.width;
//    ...
//    Text(
//      Responsive.breakpointMap(
//*       mediaQuerySizeWidth: screenWidth,
//        mobileFirst: true,
//        initialValue: 'this is the initial value',
//        breakpointMap: {
//          576: 'value for 576px',
//          768: 'value for 768px',
//          992: 'value for 992px',
//          1200: 'value for 1200px',
//        },
//      ),
//    )

// ==========================================
// === BOOTSTRAP BREAKPOINT DESKTOP FIRST ===
// always declare var screenWidth = MediaQuery.of(context).size.width
// before you return a scaffold so that you don't have to create
// multiple instance of MediaQuery
// ==========================================
//*   var screenWidth = MediaQuery.of(context).size.width;
//    ...
//    Text(
//      Responsive.bootstrapBreakpoint(
//*       mediaQuerySizeWidth: screenWidth,
//        initialValue: 'intial value',
//        valueFor1200px: '1200',
//        valueFor992px: '992',
//        valueFor768px: '768',
//        valueFor576px: '576',
//      ),
//    )

// =======================================
// == BOOTSTRAP BREAKPOINT MOBILE FIRST ==
// always declare var screenWidth = MediaQuery.of(context).size.width
// before you return a scaffold so that you don't have to create
// multiple instance of MediaQuery
// =======================================
//*   var screenWidth = MediaQuery.of(context).size.width;
//    ...
//    Text(
//      Responsive.bootstrapBreakpoint(
//*       mediaQuerySizeWidth: screenWidth,
//        mobileFirst: true,
//        initialValue: 'intial value',
//        valueFor1200px: '1200',
//        valueFor992px: '992',
//        valueFor768px: '768',
//        valueFor576px: '576',
//      ),
//    )

// ============================
// ==== SINGLE BREAKPOINTS ====
// ============================

//    Text(
//      Responsive.breakpointMap(
//*       mediaQuerySizeWidth: screenWidth,
//        initialValue: 'this is the initial value',
//        breakpointMap: {
//          768: 'value for 768px',
//        },
//      ),
//    )

//    Text(
//      Responsive.bootstrapBreakpoint(
//*       mediaQuerySizeWidth: screenWidth,
//        initialValue: 'intial value',
//        valueFor768px: '768',
//      ),
//    )