FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app


FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["CatalogApi/CatalogApi.csproj", "CatalogApi/"]
RUN dotnet restore "CatalogApi/CatalogApi.csproj"
COPY . .
WORKDIR "/src/CatalogApi"
RUN dotnet build "CatalogApi.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "CatalogApi.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .

CMD dotnet CatalogApi.dll