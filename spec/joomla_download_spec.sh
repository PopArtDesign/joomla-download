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

  Context 'when Joomla version is not found'
    It 'aborts with an error'
      export PATH="${SHELLSPEC_PROJECT_ROOT}/spec/fixtures/curl:${PATH}"
      export MOCK_CURL_HEAD_FAIL_URL="99.99.99"
      When run "./joomla-download" "${SHELLSPEC_WORKDIR}" "99.99.99"
      The status should be failure
      The error should eq "joomla-download: can't find any appropriate version"
    End
  End

  Context 'when Joomla version is not provided'
    export PATH="${SHELLSPEC_PROJECT_ROOT}/spec/fixtures/curl:${PATH}"

    It 'downloads and extracts the latest version'
      When run script "./joomla-download" "${SHELLSPEC_WORKDIR}"

      The status should be success
      The output should include "Trying to download Joomla 5.2.2"
      The output should include "https://github.com/joomla/joomla-cms/releases/download/5.2.2/Joomla_5.2.2-Stable-Full_Package.tar.gz"

      # Check that 'tar' extracted the file from our test archive.
      The file "${SHELLSPEC_WORKDIR}/joomla.txt" should be a file
      The contents of file "${SHELLSPEC_WORKDIR}/joomla.txt" should eq "hello joomla"
    End
  End

  Context 'when exact Joomla version is provided'
    export PATH="${SHELLSPEC_PROJECT_ROOT}/spec/fixtures/curl:${PATH}"
    export MOCK_CURL_JOOMLA_VERSION="Joomla! 5.2.1 release"

    It 'downloads and extracts the specified version'
      When run script "./joomla-download" "${SHELLSPEC_WORKDIR}" "5.2.1"

      The status should be success
      The output should include "Trying to download Joomla 5.2.1"
      The output should include "https://github.com/joomla/joomla-cms/releases/download/5.2.1/Joomla_5.2.1-Stable-Full_Package.tar.gz"

      # Check that 'tar' extracted the file from our test archive.
      The file "${SHELLSPEC_WORKDIR}/joomla.txt" should be a file
      The contents of file "${SHELLSPEC_WORKDIR}/joomla.txt" should eq "hello joomla"
    End
  End

  Context 'when non-exact Joomla version is provided'
    export PATH="${SHELLSPEC_PROJECT_ROOT}/spec/fixtures/curl:${PATH}"
    export MOCK_CURL_JOOMLA_VERSION="Joomla! 4.3.2 release\nJoomla! 4.3.1 release\nJoomla! 4.2.9 release"

    It 'downloads and extracts the latest matching version'
      When run script "./joomla-download" "${SHELLSPEC_WORKDIR}" "4.3"

      The status should be success
      The output should include "Trying to download Joomla 4.3.2"
      The output should include "https://github.com/joomla/joomla-cms/releases/download/4.3.2/Joomla_4.3.2-Stable-Full_Package.tar.gz"

      # Check that 'tar' extracted the file from our test archive.
      The file "${SHELLSPEC_WORKDIR}/joomla.txt" should be a file
      The contents of file "${SHELLSPEC_WORKDIR}/joomla.txt" should eq "hello joomla"
    End
  End

  Context 'when only major Joomla version is provided'
    export PATH="${SHELLSPEC_PROJECT_ROOT}/spec/fixtures/curl:${PATH}"
    export MOCK_CURL_JOOMLA_VERSION="Joomla! 5.2.2 release\nJoomla! 5.1.0 release\nJoomla! 5.0.0 release\nJoomla! 4.1.0 release"

    It 'downloads and extracts the latest version for that major'
      When run script "./joomla-download" "${SHELLSPEC_WORKDIR}" "5"

      The status should be success
      The output should include "Trying to download Joomla 5.2.2"
      The output should include "https://github.com/joomla/joomla-cms/releases/download/5.2.2/Joomla_5.2.2-Stable-Full_Package.tar.gz"

      # Check that 'tar' extracted the file from our test archive.
      The file "${SHELLSPEC_WORKDIR}/joomla.txt" should be a file
      The contents of file "${SHELLSPEC_WORKDIR}/joomla.txt" should eq "hello joomla"
    End
  End

  Context 'when JOOMLA_VERSION environment variable is set'
    export PATH="${SHELLSPEC_PROJECT_ROOT}/spec/fixtures/curl:${PATH}"
    export JOOMLA_VERSION="5.2.1"
    export MOCK_CURL_JOOMLA_VERSION="Joomla! 5.2.1 release"

    It 'downloads and extracts the version specified by JOOMLA_VERSION'
      When run script "./joomla-download" "${SHELLSPEC_WORKDIR}"

      The status should be success
      The output should include "Trying to download Joomla 5.2.1"
      The output should include "https://github.com/joomla/joomla-cms/releases/download/5.2.1/Joomla_5.2.1-Stable-Full_Package.tar.gz"

      # Check that 'tar' extracted the file from our test archive.
      The file "${SHELLSPEC_WORKDIR}/joomla.txt" should be a file
      The contents of file "${SHELLSPEC_WORKDIR}/joomla.txt" should eq "hello joomla"
    End
  End

  Context 'when downloading pre-release versions'
    export PATH="${SHELLSPEC_PROJECT_ROOT}/spec/fixtures/curl:${PATH}"

    It 'downloads an alpha version'
      export MOCK_CURL_JOOMLA_VERSION="Joomla! 5.0.0-alpha1 release"
      When run script "./joomla-download" "${SHELLSPEC_WORKDIR}" "5.0.0-alpha1"
      The status should be success
      The output should include "Trying to download Joomla 5.0.0-alpha1"
      The output should include "https://github.com/joomla/joomla-cms/releases/download/5.0.0-alpha1/Joomla_5.0.0-alpha1-Alpha-Full_Package.tar.gz"
      The file "${SHELLSPEC_WORKDIR}/joomla.txt" should be a file
    End

    It 'downloads a beta version'
      export MOCK_CURL_JOOMLA_VERSION="Joomla! 5.0.0-beta2 release"
      When run script "./joomla-download" "${SHELLSPEC_WORKDIR}" "5.0.0-beta2"
      The status should be success
      The output should include "Trying to download Joomla 5.0.0-beta2"
      The output should include "https://github.com/joomla/joomla-cms/releases/download/5.0.0-beta2/Joomla_5.0.0-beta2-Beta-Full_Package.tar.gz"
      The file "${SHELLSPEC_WORKDIR}/joomla.txt" should be a file
    End

    It 'downloads a release candidate version'
      export MOCK_CURL_JOOMLA_VERSION="Joomla! 5.0.0-rc3 release"
      When run script "./joomla-download" "${SHELLSPEC_WORKDIR}" "5.0.0-rc3"
      The status should be success
      The output should include "Trying to download Joomla 5.0.0-rc3"
      The output should include "https://github.com/joomla/joomla-cms/releases/download/5.0.0-rc3/Joomla_5.0.0-rc3-Release_Candidate-Full_Package.tar.gz"
      The file "${SHELLSPEC_WORKDIR}/joomla.txt" should be a file
    End
  End
End