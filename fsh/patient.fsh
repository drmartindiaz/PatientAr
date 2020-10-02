Profile:        PatientAr
Parent:         Patient
Id:             paciente-argentino
Title:          "Paciente Argentina"
Description:    "Paciente para la Red de Salud Digital de la República Argentina."

* extension contains 
    IdentidadGenero named identidadGenero   0..1 MS and
    Etnia           named etnia             0..1 MS and
    LugarNacimiento named lugarNacimiento   0..1 

* identifier 1..*
//slicing de IDENTIFIER
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #open
    //DNI
    * identifier contains DNI 0..1 MS
    * identifier[DNI].use = http://hl7.org/fhir/identifier-use#official 
    * identifier[DNI].system = "http://www.renaper.gob.ar/dni" //lo toma como pattern y no como fixed value....
    * identifier[DNI].type = IDType#NI 
    * identifier[DNI].value MS 
    //idDominio
    * identifier contains idDominio 0..* MS
    * identifier[idDominio].use from http://hl7.org/fhir/identifier-use
    * identifier[idDominio].type = IDType#MR 
    * identifier[idDominio].value MS 
    //ciPaisLimitrofe
    * identifier contains ciPaisLimitrofe 0..1 MS
    * identifier[ciPaisLimitrofe].use = http://hl7.org/fhir/identifier-use#official 
    * identifier[ciPaisLimitrofe].type = IDType#PN
    * identifier[ciPaisLimitrofe].value MS 
    //pasaporteExtranjero
    * identifier contains pasaporteExtranjero 0..1 MS
    * identifier[pasaporteExtranjero].use = http://hl7.org/fhir/identifier-use#official 
    * identifier[pasaporteExtranjero].type = IDType#PPN
    * identifier[pasaporteExtranjero].value MS 
    //fuirn
    * identifier contains fuirn 0..1 MS
    * identifier[fuirn].use from http://hl7.org/fhir/identifier-use
    * identifier[fuirn].type = IDType#BR
    * identifier[fuirn].value MS 
    * identifier[fuirn].system = "http://www.renaper.gob.ar/fuirn" //lo toma como pattern y no como fixed value....

//slicing de NAME
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "type.coding.code"
* name ^slicing.rules = #open
* name contains official 0..1 MS
* name[official].text 1..1
* name[official].use = http://hl7.org/fhir/identifier-use#official 
* name[official].family.extension contains  
    ApellidoPaterno named fathers           0..1 and
    ApellidoMaterno named mothers           0..1   
* name.prefix 0..0
* name.suffix 0..0

* active                0..1 MS
* telecom               0..1 MS
* gender from http://hl7.org/fhir/ValueSet/administrative-gender  
* gender                1..1
* birthDate             0..1 MS
* deceased[x]           0..1 MS
* address               0..* MS
* maritalStatus from http://hl7.org/fhir/ValueSet/marital-status
* maritalStatus         0..1 MS 
* multipleBirth[x]      0..1
* photo                 0..*
* contact               0..* MS
* communication         0..*
* generalPractitioner   0..* MS
* managingOrganization  0..1 MS
* link                  0..* MS