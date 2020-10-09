*** Settings ***
Resource  ./PO/Main.robot
Resource  ./PO/Envision.robot
Resource  ./PO/Encore.robot
Resource  ./PO/EncoreGX.robot
Resource  ./PO/Enclave.robot
Resource  ./PO/EnvisionFeatures.robot
Resource  ./PO/EnclaveFeatures.robot
Resource  ./PO/EncoreGXFeatures.robot
Resource  ./PO/EncoreSpecs.robot

*** Variables ***


*** Keywords ***
Go To Main Page
    Main.Open Main Page
    Main.Verify Page Loaded

Go To "Encore" Page
    Main.Click "Vehicles" Dropdown
    Main.Go To "Encore" Page
    Encore.Verify Page Loaded

Go To "Encore GX" Page
    Main.Click "Vehicles" Dropdown
    Main.Go To "Encore GX" Page
    EncoreGX.Verify Page Loaded

Go To "Envision" Page
    Main.Click "Vehicles" Dropdown
    Main.Go To "Envision" Page
    Envision.Verify Page Loaded

Go To "Enclave" Page
    Main.Click "Vehicles" Dropdown
    Main.Go To "Enclave" Page
    Enclave.Verify Page Loaded


Switch "Encore" Colors And Ensure Changes
    Encore.Verify Colours Loaded
    Encore.Check First Color
    Encore.Check Second Color
    Encore.Check Third Color
    Encore.Check Fourth Color

Switch "Encore GX" Colors And Ensure Changes
    EncoreGX.Verify Colours Loaded
    EncoreGX.Check First Color
    EncoreGX.Check Second Color
    EncoreGX.Check Third Color
    EncoreGX.Check Fourth Color
    EncoreGX.Check Fifth Color
    EncoreGX.Check Sixth Color
    EncoreGX.Check Seventh Color
    EncoreGX.Check Eighth Color
    EncoreGX.Check Ninth Color

Switch "Envision" Colors And Ensure Changes
    Envision.Verify Colours Loaded
    Envision.Check First Color
    Envision.Check Second Color
    Envision.Check Third Color
    Envision.Check Fourth Color
    Envision.Check Fifth Color
    Envision.Check Sixth Color

Switch "Enclave" Colors And Ensure Changes
    Enclave.Verify Colours Loaded
    Enclave.Check First Color
    Enclave.Check Second Color
    Enclave.Check Third Color
    Enclave.Check Fourth Color
    Enclave.Check Fifth Color
    Enclave.Check Sixth Color
    Enclave.Check Seventh Color
    Enclave.Check Eighth Color
    Enclave.Check Ninth Color
    Enclave.Check Tenth Color


Go To "Encore" 'Specs' Page And Verify Loaded
    Encore.Go To "Specs" Page
    EncoreSpecs.Verify Page Loaded

Go To "Encore GX" 'Features' Page And Verify Loaded
    EncoreGX.Go To "Features" Page
    EncoreGXFeatures.Verify Page Loaded

Go To "Envision" 'Features' Page And Verify Loaded
    Envision.Go To "Features" Page
    EnvisionFeatures.Verify Page Loaded

Go To "Enclave" 'Features' Page And Verify Loaded
    Enclave.Go To "Features" Page
    EnclaveFeatures.Verify Page Loaded