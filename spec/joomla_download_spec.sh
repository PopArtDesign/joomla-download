Describe 'joomla-download'
  It 'shows help message for --help'
    When run script "joomla-download" "--help"
    The status should be success
    The output should include "Usage: joomla-download <path> [<version>]"
  End

  It 'shows help message for -h'
    When run script "joomla-download" "-h"
    The status should be success
    The output should include "Usage: joomla-download <path> [<version>]"
  End
End
