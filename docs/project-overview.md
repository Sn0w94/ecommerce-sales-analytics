\---

tags: \[portfolio, ecommerce, sales-analytics, power-bi]

status: in-progress

created: 2026-05-26

\---



\# E-Commerce Sales Analytics — Dokumentacja Projektu



\## 1. Przegląd Projektu



| Pole | Wartość |

|------|---------|

| \*\*Cel biznesowy\*\* | Analiza sprzedaży e-commerce w celu identyfikacji rentownych produktów i regionów |

| \*\*Źródło danych\*\* | `ecommerce\_sales\_data.csv` |

| \*\*Zakres czasowy\*\* | 2022–2024 (3 lata) |

| \*\*Narzędzia\*\* | SQL / Power BI / Python |

| \*\*Status\*\* | 🔄 In Progress |



\## 2. Słownik Danych (Data Dictionary)



| Kolumna | Typ | Opis | Przykład |

|---------|-----|------|---------|

| Order Date | DATE | Data złożenia zamówienia | 2024-12-31 |

| Product Name | TEXT | Nazwa produktu (SKU) | Laptop, Mouse |

| Category | TEXT | Kategoria produktu | Electronics, Accessories, Office |

| Region | TEXT | Region sprzedaży | North, South, East, West |

| Quantity | INT | Liczba sprzedanych sztuk | 1–9 |

| Sales | INT | Wartość sprzedaży (przychód) | 51–10 782 |

| Profit | FLOAT | Zysk z transakcji | 6.97–2 946.93 |



\## 3. Znane Ograniczenia Datasetu



\- \[ ] Brak kolumny Order ID — nie można analizować unikalnych zamówień

\- \[ ] Brak kolumny Customer ID — analiza CLV niemożliwa

\- \[ ] Brak kolumny Cost — Profit Margin liczony pośrednio (Profit/Sales)

\- \[ ] \_\[Wpisz inne ograniczenia, które odkryjesz podczas ETL]\_



\## 4. Wymagania ETL / Transformacje



\- \[ ] Sparsowanie kolumny `Order Date` do prawidłowego typu DATE

\- \[ ] Ekstrakcja kolumn pochodnych: Year, Quarter, Month, Month Name

\- \[ ] Stworzenie miary `Profit Margin %`

\- \[ ] Walidacja: czy wszystkie wartości Sales > 0 i Profit > 0

\- \[ ] \_\[Wpisz inne transformacje, które zidentyfikujesz]\_



\## 5. Cele Wizualizacji (Dashboard Requirements)



\- \[ ] \*\*KPI Cards:\*\* Total Revenue, Total Profit, Profit Margin %, Units Sold

\- \[ ] \*\*Wykres liniowy:\*\* Trend przychodów miesięcznie (2022–2024)

\- \[ ] \*\*Bar chart:\*\* Ranking produktów wg Profit Margin %

\- \[ ] \*\*Mapa/Bar chart:\*\* Porównanie regionów (Revenue + Profit)

\- \[ ] \*\*Matrix/Heatmap:\*\* Produkt × Region (Sales lub Profit)

\- \[ ] \*\*Slicer:\*\* Rok, Kategoria, Region



\## 6. Wnioski Analityczne






\### 6.1 Top Findings

1\. 

2\. 

3\. 



\### 6.2 Rekomendacje Biznesowe

1\. 

2\.



\## 7. Anomalie i Problemy z Jakością Danych



| # | Tabela | Kolumna | Wartość | Opis | Status |

|---|--------|---------|---------|------|--------|

| 1 | DimProduct | Category | Monitor = Accessories | Monitor prawdopodobnie powinien należeć do kategorii Electronics | ⚠️ Do weryfikacji z biznesem |



\## 8. Log ETL



| Data | Tabela | Akcja | Wynik |

|------|--------|-------|-------|

| 2026-05-28 | DimDate | INSERT CTE 2022-2024 | 1096 wierszy ✅ |

| 2026-05-28 | DimProduct | INSERT DISTINCT z StagingRaw | 10 wierszy ✅ |

| 2026-05-28 | DimRegion | INSERT DISTINCT z StagingRaw | 4 wiersze ✅ |

| 2026-05-28 | StagingRaw | Import CSV | 3500 wierszy ✅ |

