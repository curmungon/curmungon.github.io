$portfolioProjectsJsonPath = "./resources/portfolioProject.json"

$portfolioData = (Get-Content $portfolioProjectsJsonPath | ConvertFrom-Json).projectData | 
Sort-Object -Property projectDisplayOrder;

$portfolioItemString = @'
<div id="grid-tile-#TILENUM#" class="portfolio-grid-tile">
    <a id="tile-link-#TILENUM#" href="#PROJURL#" target="_blank" rel="noopener"
        aria-describedby="tile-description-#TILENUM#"
        ><span class="portfolio-grid-tile-link"></span
    ></a>
    <picture>
        <source
            srcset="#PROJWEBPURL#"
            type="image/webp"
        />
        <img class="portfolio-grid-thumbnail" src="#PROJIMGURL#" alt="#PROJTITLE# Thumbnail" />
    </picture>
    <p id="tile-description-#TILENUM#" class="portfolio-grid-description">
        <strong>#PROJTITLE#</strong><br />#PROJDESC#
    </p>
</div>
'@

$portfolioData | ForEach-Object -Begin { $portfolioProjectString = ''; $tileNum = 0; } -Process {
    $projUrl = $_.projectUrl; 
    $projTitle = $_.projectTitle; 
    $projImgUrl = $_.projectImageUrl; 
    $projWebpUrl = $_.projectWebpUrl;
    $projDescription = $_.projectDescription;

    $portfolioProjectString += $portfolioItemString -replace "#TILENUM#", $tileNum `
        -replace '#PROJURL#', $projUrl `
        -replace '#PROJTITLE#', $projTitle `
        -replace '#PROJIMGURL#', $projImgUrl `
        -replace '#PROJWEBPURL#', $projWebpUrl `
        -replace '#PROJDESC#', $projDescription

    $tileNum += 1
} -End { Set-Content -Path ./staticPortfolioHTML.txt -Value $portfolioProjectString -Encoding UTF8 }

