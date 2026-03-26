# Next Steps

## Issues resolved
- Transformed DocumentProcessor.Web.csproj to net8.0

## Summary

The transformation appears to have completed successfully. No build errors were detected across any of the projects in the solution, including the most independent project `DocumentProcessor.Web`.

## Validation Steps

### 1. Restore Dependencies

Run the following command from the solution root to ensure all NuGet packages are properly restored:

```bash
dotnet restore
```

Review the output for any warnings related to package compatibility or deprecated packages targeting older frameworks.

### 2. Build the Solution

Perform a full solution build to confirm the error-free state holds in a clean build context:

```bash
dotnet build --configuration Release
```

Check the output for any warnings that, while non-breaking, may indicate areas of concern such as nullable reference type warnings or obsolete API usage.

### 3. Run Unit Tests

If the solution contains test projects, execute them to verify that runtime behavior has not been affected by the migration:

```bash
dotnet test --configuration Release
```

Review test results carefully. A successful build does not guarantee correctness of runtime behavior.

### 4. Verify Target Framework

Open `DocumentProcessor.Web.csproj` and confirm the `<TargetFramework>` element targets the intended .NET version (e.g., `net8.0`). Ensure all dependent projects target compatible frameworks.

### 5. Check for Platform-Specific Code

Review the codebase for any APIs that were available in .NET Framework but have changed or been removed in cross-platform .NET, such as:

- `System.Web` references
- Windows Registry access
- `HttpContext` usage patterns specific to ASP.NET (non-Core)
- `AppDomain` usage
- `BinaryFormatter` (deprecated and disabled by default)

Use the [.NET Upgrade Assistant compatibility analyzer](https://learn.microsoft.com/en-us/dotnet/core/porting/upgrade-assistant-overview) or the `Microsoft.DotNet.PlatformAbstractions` tooling to assist with this review.

### 6. Run the Application Locally

Start the application and exercise its primary workflows:

```bash
dotnet run --project src/DocumentProcessor.Web/DocumentProcessor.Web.csproj --configuration Release
```

Verify that:
- The application starts without runtime exceptions
- Core document processing features behave as expected
- Any file system paths or configuration values are valid in the new environment

### 7. Review Configuration Files

Confirm that `appsettings.json` (and environment-specific variants such as `appsettings.Production.json`) contain correct values and that any settings previously held in `Web.config` or `App.config` have been properly migrated.

### 8. Validate Publish Output

Produce a publish artifact to confirm the output is complete and self-contained if required:

```bash
dotnet publish src/DocumentProcessor.Web/DocumentProcessor.Web.csproj --configuration Release --output ./publish
```

Inspect the `./publish` directory to ensure all expected assemblies, static assets, and configuration files are present.