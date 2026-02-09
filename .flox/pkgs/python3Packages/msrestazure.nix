{
  catalogs,
  lib,
  adal,
  buildPythonPackage,
  fetchFromGitHub,
  httpretty,
  mock,
  pytest-asyncio,
  pytestCheckHook,
  setuptools,
}:

let
  inherit (catalogs.msrest-for-python.python3Packages) msrest;

in buildPythonPackage rec {
  pname = "msrestazure";
  version = "0.6.4";
  pyproject = true;

  src = ../../..;

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    adal
    msrest
  ];

  nativeCheckInputs = [
    httpretty
    mock
    pytest-asyncio
    pytestCheckHook
  ];

  pythonImportsCheck = [ "msrest" ];

  meta = {
    description = "Runtime library 'msrestazure' for AutoRest generated Python clients";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      bendlas
    ];
  };
}
