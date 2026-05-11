Describe 'joomla-download'
  It 'shows help message for --help'
    When run "./joomla-download" "--help"
    The status should be success
    The output should include "Usage: joomla-download <path> [<version>]"
  End

  It 'shows help message for -h'
    When run "./joomla-download" "-h"
    The status should be success
    The output should include "Usage: joomla-download <path> [<version>]"
  End

  Context 'when destination path does not exist'
    It 'aborts with an error'
      When run "./joomla-download" "/no/such/dir"
      The status should be failure
      The error should eq "joomla-download: path does not exist: /no/such/dir"
    End
  End

  Context 'when curl is not installed'
    It 'aborts with an error'
      export PATH="${SHELLSPEC_PROJECT_ROOT}/spec/fixtures/tar"
      When run script "./joomla-download" "${SHELLSPEC_WORKDIR}"
      The status should be failure
      The error should eq "joomla-download: curl is not installed"
    End
  End

  Context 'when tar is not installed'
    It 'aborts with an error'
      export PATH="${SHELLSPEC_PROJECT_ROOT}/spec/fixtures/curl"
      When run script "./joomla-download" "${SHELLSPEC_WORKDIR}"
      The status should be failure
      The error should eq "joomla-download: tar is not installed"
    End
  End
End
