/*
 *
 * Read Me for WWDC 2013 Downloadable script.
 * 
 * Disclaimer *
 * 
 * This script the best with Mac, Have not really tried it against Windows / UNIX or any other systems.
 *
 * These changes are not managed and maintained regularly, so this might not work some time.
 *
 * If, folder you provided does not exist, then the download will occur at current folder
 *
 */
 

/* File */
wwdc_download.sh:

	/* What it can do */
	 This file is responsible for downloading the file all 100 videos mentioned in either of "wwdc_downloadListSD.txt" or "wwdc_downloadListHD.txt" files.
	
	/* How ? */
	Just execute following command at the terminal in a mac:
		./wwdc_download.sh <DOWNLOAD_FOLDER> <SD/HD>
		./wwdc_download.sh /Volumes/Data/RKS/iTunes_Videos/WWDC2013/0Videos 1
	
	/* Parameters */
	DOWNLOAD_FOLDER: Location, where you want your download to go to.
	SD/HD: Whether to download SD / HD. Values are 0 or 1.

/* File */
wwdc_downloadListSD.txt:
wwdc_downloadListHD.txt:
	File containing the list of links to be downloaded.
	
wwdc_title.txt:
	After files are downloaded, its names are in numbers, example, 710.mov, 101.mov. This really does not give any context as to what the videos contains.
	This files provides a list of names that the downloaded files should get.
	wwdc_download.sh files later on renames the .mov / .pdfs to correct titles.

