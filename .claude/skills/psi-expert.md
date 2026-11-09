---
name: psi-expert
description: Expert on NASA PSI database structure, investigation IDs, DOIs, and how to query the PSI API. Use when working with NASA combustion data.
---

# PSI Expert Skill

## PSI API Endpoints
```
Base: https://psi.nasa.gov/geode-py/ws

# Get all combustion investigations
GET /repo/search?source=psi&type=investigation&size=50&from=0

# Get single investigation detail (files, tables, metadata)
GET /repo/investigations/{accession}
# accession = PSI-69, PSI-25, etc.

# Download a file
GET https://psi.ndc.nasa.gov/mpglobal/api/athena/file/{file_id}/?inline=1&log=1
```

## Investigation JSON structure
```typescript
{
  accession: string,           // "PSI-69"
  investigationAcronym: string, // "FLEX"
  title: string,
  approach: string,
  hypothesis: string,
  added: FileObject[],         // all files (videos, docs, etc.)
  experimentalTable: FileObject[] // CSV data tables
}

// FileObject
{
  file_name: string,
  file_size: number,           // bytes
  remote_url: string,          // direct download URL
  s3_path: string,
  restricted: boolean          // false = public
}
```

## Key video files (BASS-II)
- File ID 4435701 → PSI-25_Raw Data_BASS_GMT50_SAMPLE_147_TEST_B1.mp4 (5.5 MB)
- File ID 4435702 → Still sequence version (2.8 MB) — BEST FOR ANALYSIS
- 296 total MP4 videos available

## Citation format required
Always cite: "Source: {Investigation Name} ({PSI-ID}, DOI: {doi})"
Example: "Source: BASS-II (PSI-25, DOI: 10.60555/4qc4-de67)"
