Alias:   SCT = http://snomed.info/sct
Alias:   SCTAr = http://snomed.info/sct/11000221109
Alias:   IDType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        PatientAr
Parent:         Patient
Id:             paciente-argentino
Title:          "Paciente Argentina"
Description:    "Paciente para la Red de Salud Digital de la República Argentina."
* name                  0..* MS
* extension contains 
    IdentidadGenero named identidadGenero   0..1 MS and
    Etnia           named etnia             0..1 MS and
    LugarNacimiento named lugarNacimiento   0..1 


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
* name[official].use = http://hl7.org/fhir/identifier-use#official
* name[official].family.extension contains  
    ApellidoPaterno named fathers           0..1 and
    ApellidoMaterno named mothers           0..1   

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

Extension:  IdentidadGenero
Id: idGenero
Title: "Identidad de Género"
Description: "Género con el cual el paciente se siente identificado."
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/gender-identity (extensible)

Extension:  Etnia
Id: EtniaAr
Title: "Etnia"
Description: "Etnia a la que pertenece el paciente."
* value[x] only CodeableConcept
* valueCodeableConcept from EtniasValueSet (extensible)

Extension: LugarNacimiento
Id: lugarNacimiento
Title: "Lugar de nacimiento"
Description: "Lugar de nacimiento. Tipo de dato dirección. Pueden completarse sólo los campos necesarios, por ejemplo sólo el país o país y provincia."
* value[x] only Address

Extension: ApellidoPaterno
Id: apellidoPaterno
Title: "Apellido del padre de paciente"
Description: "Apellido del padre de paciente"
* value[x] only string  

Extension: ApellidoMaterno
Id: apellidoMaterno
Title: "Apellido de la madre de paciente"
Description: "Apellido de la madre de paciente"
* value[x] only string  

ValueSet:  EtniasValueSet
Id: etnias-argentinas-value-set
Title: "Etnias Argentinas Value Set"
Description:  "Codigo que describe las etnias argentinas desde la edición argentina de SNOMED-CT."
* codes from system SCTAr where concept is-a #372148003 

Instance:  HonorioBustosDomecq
InstanceOf: PatientAr
Title:   "Honorio Bustos Domecq"
Usage:  #example
* name.given = "Honorio"
* extension[ApellidoPaterno].valueString = "Bustos"
* extension[ApellidoMaterno].valueString = "Domecq"
* birthDate = 1942-12-20
* deceasedBoolean = true
* gender = http://hl7.org/fhir/ValueSet/administrative-gender#male 
* address.city = "Pujato"
* address.district = "San Lorenzo"
* address.state = "Santa Fe"
* address.country = "Argentina"
* maritalStatus = http://hl7.org/fhir/ValueSet/marital-status#T //Domestic Partner
* multipleBirthBoolean = false
