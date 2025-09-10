# TINA Token

![TINA Token](https://img.shields.io/badge/Token-2022-blue)
![Solana](https://img.shields.io/badge/Blockchain-Solana-purple)
![SPL Token](https://img.shields.io/badge/Standard-SPL%20Token-green)

## 📖 프로젝트 소개

TINA는 Solana 블록체인에서 Token 2022 프로그램을 사용하여 구현된 공식 SPL(Solana Program Library) 토큰입니다. 이 레포지토리는 TINA 토큰의 공식 GitHub 저장소로, 토큰의 기술적 구현과 관련 문서를 제공합니다.

## 🚀 주요 특징

- **Token 2022 프로그램**: Solana의 최신 토큰 프로그램 표준 사용
- **SPL 토큰**: Solana 생태계의 표준 토큰 형식
- **고성능**: Solana의 빠른 처리 속도와 저렴한 거래 수수료
- **확장성**: 향후 기능 업그레이드 및 확장 가능
- **투명성**: 오픈 소스 코드로 검증 가능

## 🛠️ 기술 스택

- **Blockchain**: Solana
- **Token Program**: Token 2022
- **Token Standard**: SPL Token
- **Development**: Rust, Solana CLI

## 📋 요구사항

- Solana CLI
- Rust (최신 안정 버전)
- Node.js (선택사항)

## 🚀 설치 및 실행

### 1. 저장소 클론

```bash
git clone https://github.com/tinafoundationteam/TINA.git
cd TINA
```

### 2. 의존성 설치

```bash
# Solana CLI 설치 (macOS)
sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)"

# 또는 다른 플랫폼의 경우
# https://docs.solana.com/cli/install-solana-cli-tools 참조
```

### 3. 환경 설정

```bash
# Solana 네트워크 설정 (테스트넷)
solana config set --url https://api.testnet.solana.com

# 또는 메인넷
solana config set --url https://api.mainnet-beta.solana.com
```

## 🔧 Token 2022 프로그램

TINA 토큰은 Solana의 Token 2022 프로그램을 사용합니다. 이는 기존 SPL Token 프로그램의 향상된 버전으로 다음과 같은 기능을 제공합니다:

- **확장 가능한 메타데이터**: 토큰에 대한 추가 정보 저장
- **전송 훅**: 토큰 전송 시 커스텀 로직 실행
- **멀티 시그**: 여러 서명자 지원
- **토큰 그룹**: 관련 토큰들을 그룹화
- **기본 수수료**: 토큰 전송 시 자동 수수료 수집

## 📊 토큰 정보

**토큰 주소**: `BJUP7hZoN8GFunH3ucrdBjuphyz2Ryg1R8pt3D4tm6wZ`

Solana Explorer에서 실시간 토큰 정보를 확인하세요:
- 토큰 공급량 및 순환 공급량
- 홀더 정보 및 분포
- 거래 내역 및 가격 정보
- 토큰 메타데이터 및 설정

[🔍 Solana Explorer에서 TINA 토큰 확인하기](https://explorer.solana.com/address/BJUP7hZoN8GFunH3ucrdBjuphyz2Ryg1R8pt3D4tm6wZ)

## 📚 문서

자세한 프로젝트 정보는 다음 문서를 참조하세요:

- [TINA 토큰 오딧 보고서](document/CertoraToken2022Audit-2024-05-24.pdf)
- [Token 2022 프로그램 공식 문서](https://spl.solana.com/token-2022)
- [Solana 개발자 문서](https://docs.solana.com/)

## 🤝 기여하기

TINA 토큰 프로젝트에 기여하고 싶으시다면:

1. 이 저장소를 포크하세요
2. 새로운 브랜치를 생성하세요 (`git checkout -b feature/amazing-feature`)
3. 변경사항을 커밋하세요 (`git commit -m 'Add some amazing feature'`)
4. 브랜치에 푸시하세요 (`git push origin feature/amazing-feature`)
5. Pull Request를 생성하세요

## 🔗 링크

- **Solana Explorer**: [TINA 토큰 정보](https://explorer.solana.com/address/BJUP7hZoN8GFunH3ucrdBjuphyz2Ryg1R8pt3D4tm6wZ)
- **SolScan**: [TINA 토큰 정보](https://solscan.io/token/BJUP7hZoN8GFunH3ucrdBjuphyz2Ryg1R8pt3D4tm6wZ)

## ⚠️ 면책 조항

이 프로젝트는 교육 및 개발 목적으로 제공됩니다. 투자 결정을 내리기 전에 충분한 조사를 수행하고, 암호화폐 투자의 위험을 이해하시기 바랍니다.

---

**TINA Token** - Solana 기반의 차세대 디지털 자산
