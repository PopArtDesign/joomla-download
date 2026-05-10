Describe 'joomla-download'
  Describe '--help option'
    It 'shows help message and exits with status 0'
      When run script "joomla-download" "--help"
      The status should be success
      The output should include "Usage: joomla-download <path> [<version>]"
    End
  End
End
