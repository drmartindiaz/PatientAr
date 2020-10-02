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