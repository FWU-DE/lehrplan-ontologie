# Lehrplan Ontology rc6 — Release Summary


## Key Changes

- **Qualifications:** `LP_0000019` now represents a qualification specification. New class `LP_0000008` represents the qualification role held by a person.
- **Educational tracks:** `LP_0000816` now represents a track specification. New class `LP_0000567` represents the actual educational process.
- **School types:** `LP_0000475` changes from a BFO function to a BFO role.
- **Roles and competence:** Teacher and student roles require a person as bearer. Competence requires a person and a curricular competence specification.
- **Structural relations:** New direct-part properties distinguish immediate parts. Unit links now use QUDT `hasUnit`.

## Vocabulary and Documentation

- Subject mappings expand across all 16 states:
  - 110 exact matches added.
  - 8 exact matches removed.
  - 33 close matches added.
- Four subject concepts are added: Sprachbildung and Medienbildung for Berlin and Brandenburg.
- Six Bista-level individuals are added.
- Berlin and Brandenburg now distinguish content references from connected-competency references.
- Definition text moves extensively from `rdfs:comment` to `skos:definition`.

## Migration Checklist

- Review data using repurposed qualification, track, and school-type IRIs.
- Replace `LP_0000041` unit links with QUDT `hasUnit`.
- Replace `LP_0000477` school-type links with `LP_0000024` (`described by`).

