$portfolioProjectsJsonPath = "./resources/portfolioProject.json"

$portfolioData = (Get-Content $portfolioProjectsJsonPath | ConvertFrom-Json).projectData | 
Sort-Object -Property projectDisplayOrder;

$portfolioItemString = @'
<div class="portfolio-grid-tile">
    <a href="#PROJURL#" target="_blank"
        ><span class="portfolio-grid-tile-link"></span
    ></a>
    <picture>
        <source
            srcset="#PROJWEBPURL#"
            type="image/webp"
        />
        <img  class="portfolio-grid-thumbnail" src="#PROJIMGURL#" alt="#PROJTITLE# Thumbnail" />
    </picture>
    <p class="portfolio-grid-description">
        <strong>#PROJTITLE#</strong><br />#PROJDESC#
    </p>
</div>
'@

$portfolioData | ForEach-Object -Begin { $portfolioProjectString = ''; } -Process {
    $projUrl = $_.projectUrl; 
    $projTitle = $_.projectTitle; 
    $projImgUrl = $_.projectImageUrl; 
    $projWebpUrl = $_.projectWebpUrl;
    $projDescription = $_.projectDescription;

    $portfolioProjectString += $portfolioItemString -replace '#PROJURL#', $projUrl `
        -replace '#PROJTITLE#', $projTitle `
        -replace '#PROJIMGURL#', $projImgUrl `
        -replace '#PROJWEBPURL#', $projWebpUrl `
        -replace '#PROJDESC#', $projDescription
} -End { Set-Content -Path ./staticPortfolioHTML.txt -Value $portfolioProjectString -Encoding UTF8 }

