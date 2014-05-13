library(R4CDISC)
library(testthat)


## Test metadata preparation 
define <- system.file("extdata", 
                      "define2-0-0-example-sdtm(2013-11-09).xml", 
                      package="R4CDISC") 

#Get dataset level metadata
dataset.metadata <- getDLMD(define)

#Get variable level metadata
variable.metadata <- getVarMD(define)

#Get value level metadata
value.metadata <- getValMD(define)

#Get controlled terms
controlled.terms <- getCT(define)


# Excute unit tests for import Dataset-XML

# Check number of records
test_that("Check number of records", {
    expect_equal(nrow(dataset.metadata), 34)
    expect_equal(nrow(variable.metadata[variable.metadata$IGD_Name == "LB",]), 28)
    expect_equal(nrow(value.metadata[value.metadata$ValueListOID == "VL.QS.QSORRES",]), 28)
    expect_equal(nrow(controlled.terms[value.metadata$CT_OID == "CL.IETEST",]), 6)
})
CL.IETEST

# Check number of colums
test_that("Check number of colums", {
    expect_equal(ncol(DM), 16)
})


# Check culumn name
test_that("Check a column name", {
    expect_equal(names(DM)[5], "")
})


# Check character value 
test_that("chech an imported value", {
    expect_equal(DM[3,"USUBJID"], "CDISC01.200001")
    expect_equal(DM[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"AETERM"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"AETERM"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
})


# Check integer value 
test_that("chech integer value", {
    expect_equal(DM[3,"USUBJID"], "CDISC01.200001")
    expect_equal(DM[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"AETERM"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"AETERM"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
})


# Check float value 
test_that("chech float value", {
    expect_equal(DM[3,"USUBJID"], "CDISC01.200001")
    expect_equal(DM[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"AETERM"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"AETERM"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
    expect_equal(AE[3,"USUBJID"], "CDISC01.200001")
})
