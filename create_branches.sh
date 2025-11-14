#!/bin/bash

# 각 문서를 브랜치로 만드는 스크립트

# 브랜치와 파일 매핑
declare -A branches=(
    ["docs/02-wbs"]="docs/02_WBS_최신화.md"
    ["docs/03-system-flow"]="docs/03_시스템_흐름도.md"
    ["docs/04-architecture"]="docs/04_시스템_아키텍처.md"
    ["docs/05-erd"]="docs/05_ERD.md"
    ["docs/06-requirements"]="docs/06_요구사항_정의서.md"
    ["docs/07-yolo-model"]="docs/07_YOLO_모델_정의서.md"
    ["docs/08-rag-llm"]="docs/08_RAG-LLM_시스템_정의서.md"
    ["docs/09-performance"]="docs/09_성능_평가_결과서.md"
    ["docs/10-supabase"]="docs/10_Supabase_BaaS_가이드.md"
)

for branch in "${!branches[@]}"; do
    file="${branches[$branch]}"
    echo "Creating branch: $branch from $file"

    git checkout -b "$branch" 2>/dev/null || git checkout "$branch"
    cp "$file" README.md
    git add README.md
    git commit -m "docs: Add $(basename $file .md) as README"
    git checkout main
done

echo "All branches created!"
echo "Run: git branch to see all branches"
