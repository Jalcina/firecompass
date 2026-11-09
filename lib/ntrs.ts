const NTRS_BASE = 'https://ntrs.nasa.gov/api/citations'

export interface NTRSPaper {
  id: number
  title: string
  abstract: string
  stiType: string
  distributionDate: string
  center: { code: string }
  authorAffiliations: Array<{ meta: { author: { name: string } } }>
  downloadsAvailable: boolean
  downloads: Array<{ links: { pdf?: string } }>
}

export interface NTRSSearchResult {
  results: NTRSPaper[]
  stats: { total: number }
}

export async function searchNTRS(query: string, rows = 10): Promise<NTRSSearchResult> {
  const params = new URLSearchParams({
    q: query,
    rows: String(rows),
    sort: 'score desc'
  })
  const res = await fetch(`${NTRS_BASE}/search?${params}`, {
    next: { revalidate: 1800 }
  })
  if (!res.ok) throw new Error(`NTRS search failed: ${res.status}`)
  return res.json()
}

export function getPDFUrl(paper: NTRSPaper): string | null {
  return paper.downloads?.[0]?.links?.pdf ?? null
}

export async function getFireSafetyPapers(): Promise<NTRSPaper[]> {
  const { results } = await searchNTRS('microgravity fire safety combustion ISS spacecraft', 20)
  return results
}
