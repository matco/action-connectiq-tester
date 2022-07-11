# ConnectIQ Tester for GitHub Actions

ConnectIQ Tester is a GitHub Action that can be used to run the test "Run No Evil" of a ConnectIQ application. It relies on the Docker image [ghcr.io/matco/connectiq-tester](https://github.com/matco/connectiq-tester).

## Usage

Here is sample step to test your application in your CI workflows:
```
- name: Test application
  id: run_tests
  uses: matco/connectiq-tester@v1
  with:
    device: fenix5
```

### Inputs
* path: The path of the application to test. By default the root of the repository will be used.
* device: The id of the device used to run the tests. By default, a Fenix 7 will be used.
* certificate: The optional path of a certificate used to compile the application relatively to the path of the application. If not specified, a temporary certificate will be generated automatically.

### Outputs
* status: "success" if tests succeeded, "failure" if not
