# Has the Recession Started? - Code and Data

This repository contains the code and data accompanying the paper "Has the Recession Started?", written by [Pascal Michaillat](https://pascalmichaillat.org) and [Emmanuel Saez](https://eml.berkeley.edu/~saez/), and published in the [Oxford Bulletin of Economics and Statistics](http://doi.org/10.1111/obes.12685) in May 2025.

## Paper webpage

The paper is available at https://pascalmichaillat.org/16/.

## Raw data

The raw data used by the code to produce the results in the paper are stored as CSV files in the `raw` folder.

+ `20210719_cycle_dates_pasted.csv` - US business cycle dates, 1857–2021
	+ Source: [NBER (2023)](https://www.nber.org/research/data/us-business-cycle-expansions-and-contractions)
+ `CLF16OV.csv` - US labor force level, 1948–2025
	+ Source: [BLS (2025a)](https://fred.stlouisfed.org/series/CLF16OV)
+ `CompositeHWI.xlsx - Sheet1.csv` - US vacancy rate, 1951–2020
	+ Source: [Barnichon (2010)](https://docs.google.com/spreadsheets/d/1fkMinSHkjTL99-bLZYFldQ8rHtgh8lxd)
+ `HistoricalSeries_JME_2020January.csv` - US unemployment and vacancy rates, 1890–2017
	+ Source: [Petrosky-Nadeau and Zhang (2021)](https://drive.google.com/file/d/1NcuUMRR4_fOwJW6qHb-XxitVSXXONBHW)
+ `JTSJOL.csv` - US vacancy level, 2001–2025
	+ Source: [BLS (2025b)](https://fred.stlouisfed.org/series/JTSJOL)
+ `UNEMPLOY.csv` - US unemployment level, 1948–2025
	+ Source: [BLS (2025d)](https://fred.stlouisfed.org/series/UNEMPLOY)
	
## Code

The results in the paper are obtained using MATLAB. The MATLAB code is located in the `code` folder.

### Main script

The main script, `main.m`, orchestrates the production of the results in the paper. The script collects the raw data, performs the computations, and produces the 8 figures and 2 tables presented in the paper.

### Computations

The main script performs the computations in three steps, using the following scripts:

+ `getData.m` - Load data on US unemployment, job vacancies, and recessions
+ `computeIndicator.m` - Compute minimum indicator
+ `detectRecessions.m` -  Detect recessions with Michez rule

The output from the computations is stored in variables in the MATLAB workspace. These variables are then used to produce tables and figures.

### Figure production

Before producing the figures, the main script calls the `formatFigure.m` script to preformat figures and predefine figure properties. The figure properties are stored in variables in the MATLAB workspace.

The main script then produces the figures using a collection of scripts:

+ `figure1.m` - Produce figure 1
+ `figure2.m` - Produce figure 2
+ `figure3.m` - Produce figure 3
+ `figure4.m` - Produce figure 4
+ `figure5.m` - Produce figure 5
+ `figure6.m` - Produce figure 6
+ `figure7.m` - Produce figure 7
+ `figure8.m` - Produce figure 8

The scripts display the figures in MATLAB figure windows, save each figure as a PDF file, and save the underlying data as CSV files. 

### Table production

Next, the main script produces the tables using the following scripts:

+ `table1.m` - Produce table 1
+ `table2.m` - Produce table 2

The scripts display the tables in the MATLAB command window and save the tables as CSV file. The scripts also generate numerical results associated with the tables. The results are displayed in the command window and saved in Markdown files.

## Results

### Figures

The figures produced by the code are saved as PDF files. The data used to generate the figures are saved as CSV files. All the files are located in the `results` folder, each corresponding to a specific figure in the paper:

+ `figure1.pdf`, `figure1.csv` - Figure 1
+ `figure2.pdf`, `figure2.csv` - Figure 2
+ `figure3.pdf`, `figure3.csv` - Figure 3
+ `figure4.pdf`, `figure4.csv` - Figure 4
+ `figure5.pdf`, `figure5.csv` - Figure 5
+ `figure6.pdf`, `figure6.csv` - Figure 6
+ `figure7.pdf`, `figure7.csv` - Figure 7
+ `figure8.pdf`, `figure8.csv` - Figure 8

### Tables

The tables produced by the code are saved as CSV files. The numerical results associated with each table are saved in Markdown files. All the files are located in the `results` folder, each corresponding to a specific table in the paper:

+ `table1.csv`, `table1.md` - Table 1
+ `table2.csv`, `table2.md` - Table 2

## Usage

1. Clone the repository to your local machine using Git or by downloading the ZIP file.

2. Open MATLAB and set the `code` folder as the current folder.

3. To generate the figures and tables presented in the paper, run the following command in the MATLAB command window:

```matlab
run('main.m')
```

4. By default, the main script overwrites the files in the `results` folder. To preserve existing files, make a copy of the folder before running the script.

## Software

The results were obtained using MATLAB R2024a on macOS Sequoia (Apple silicon).

## License

This repository is licensed under the [MIT License](LICENSE.md).