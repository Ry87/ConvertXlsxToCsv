library(readxl)
inputDir <- paste0(getwd(),"/input/")
outputDir <- paste0(getwd(),"/output")

files <- list.files(inputDir)
fileNum <- length(files)

ExportCsv = function(data, dir)
{
    if(!file.exists(outputDir))
    {
        dir.create(outputDir)
    }
    write.csv(data, paste0(dir), row.names = FALSE)
}

if(fileNum > 0)
{
    for(index in 1:fileNum)
    {
        inputFileDir <- paste0(inputDir,files[index])
        fileName <- sub(".xlsx","",files[index])
        data <- as.data.frame(read_excel(inputFileDir, 1))
        outputFileDir <- paste0(outputDir,"/",fileName,".csv")
        ExportCsv(data, outputFileDir)
    }
}
