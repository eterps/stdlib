import gleam/bit_string.{BitString}

/// BitStringBuilder is a type used for efficiently concatenating bit strings.
///
/// When we append one string to another the strings must be copied to a
/// new location in memory so that they can sit together. This behaviour
/// enables efficient reading of the string but copying can be expensive,
/// especially if we want to join many strings together.
///
/// BitStringBuilder is different in that it can be joined together in constant
/// time using minimal memory, and then can be efficiently converted to a
/// bit string using the `to_bit_string` function.
///
pub external type BitStringBuilder

// TODO: test
/// Prepend a bit string to the start of a builder.
///
/// Runs in constant time.
///
pub external fn prepend(
  to: BitStringBuilder,
  prefix: BitString,
) -> BitStringBuilder =
  "gleam_stdlib" "iodata_prepend"

// TODO: test
/// Append a bit string to the end of a builder.
///
/// Runs in constant time.
///
pub external fn append(
  to: BitStringBuilder,
  suffix: String,
) -> BitStringBuilder =
  "gleam_stdlib" "iodata_append"

// TODO: test
/// Prepend a builder onto the start of another.
///
/// Runs in constant time.
///
pub external fn prepend_builder(
  to: BitStringBuilder,
  prefix: BitStringBuilder,
) -> BitStringBuilder =
  "gleam_stdlib" "iodata_prepend"

// TODO: test
/// Append a builder onto the end of another.
///
/// Runs in constant time.
///
pub external fn append_builder(
  to: BitStringBuilder,
  suffix: BitStringBuilder,
) -> BitStringBuilder =
  "gleam_stdlib" "iodata_append"

// TODO: test
/// Prepend a string onto the start of a builder.
///
/// Runs in constant time.
///
pub external fn prepend_string(
  to: BitStringBuilder,
  prefix: String,
) -> BitStringBuilder =
  "gleam_stdlib" "iodata_prepend"

// TODO: test
/// Append a string onto the end of a builder.
///
/// Runs in constant time.
///
pub external fn append_string(
  to: BitStringBuilder,
  suffix: String,
) -> BitStringBuilder =
  "gleam_stdlib" "iodata_append"

// TODO: test
/// Convert a list of strings into iodata.
///
/// Runs in constant time.
///
pub external fn from_strings(List(String)) -> BitStringBuilder =
  "gleam_stdlib" "identity"

// TODO: test
/// Joins a list of builders into a single builders.
///
/// Runs in constant time.
///
pub external fn concat(List(BitStringBuilder)) -> BitStringBuilder =
  "gleam_stdlib" "identity"

// TODO: test
/// Create a new builder from a bit string.
///
/// Runs in constant time.
///
pub external fn new(BitString) -> BitStringBuilder =
  "gleam_stdlib" "identity"

// TODO: test
/// Turns an builder into a bit string.
///
/// This function is implemented natively by the virtual machine and is highly
/// optimised.
///
pub external fn to_string(BitStringBuilder) -> String =
  "erlang" "list_to_bitstring"
