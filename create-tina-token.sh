#!/bin/bash

# TINA Token 2022 생성 스크립트
# Solana CLI를 사용하여 Token 2022 프로그램으로 토큰을 생성합니다.

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 함수 정의
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Solana CLI 설치 확인
check_solana_cli() {
    if ! command -v solana &> /dev/null; then
        print_error "Solana CLI가 설치되지 않았습니다."
        print_info "다음 명령어로 설치하세요:"
        echo "sh -c \"\$(curl -sSfL https://release.solana.com/v1.18.4/install)\""
        exit 1
    fi
    print_success "Solana CLI가 설치되어 있습니다."
}

# 네트워크 설정 확인
check_network() {
    local network=$(solana config get | grep "RPC URL" | awk '{print $3}')
    print_info "현재 네트워크: $network"
    
    if [[ "$network" == *"testnet"* ]]; then
        print_warning "테스트넷에 연결되어 있습니다. 테스트용 SOL이 필요합니다."
    elif [[ "$network" == *"mainnet"* ]]; then
        print_warning "메인넷에 연결되어 있습니다. 실제 SOL이 필요합니다."
    fi
}

# 지갑 확인
check_wallet() {
    local wallet_address=$(solana address 2>/dev/null)
    if [ -z "$wallet_address" ]; then
        print_error "지갑이 설정되지 않았습니다."
        print_info "다음 명령어로 지갑을 생성하거나 가져오세요:"
        echo "solana-keygen new --outfile ~/.config/solana/id.json"
        echo "또는"
        echo "solana config set --keypair /path/to/your/keypair.json"
        exit 1
    fi
    print_success "지갑 주소: $wallet_address"
}

# 잔액 확인
check_balance() {
    local balance=$(solana balance 2>/dev/null | awk '{print $1}')
    print_info "현재 잔액: $balance SOL"
    
    if (( $(echo "$balance < 0.1" | bc -l) )); then
        print_warning "잔액이 부족할 수 있습니다. 토큰 생성에는 최소 0.1 SOL이 필요합니다."
        print_info "테스트넷의 경우 다음 명령어로 에어드롭을 받으세요:"
        echo "solana airdrop 2"
    fi
}

# Token 2022 프로그램 확인
check_token_2022_program() {
    local token_2022_program="TokenzQdBNbLqP5VEhdkAS6EPFLC1PHnBqCXEpPxuEb"
    print_info "Token 2022 프로그램 ID: $token_2022_program"
}

# 토큰 생성
create_token() {
    print_info "TINA 토큰을 생성하는 중..."
    
    # 토큰 생성
    local token_mint=$(spl-token create-token --program-id TokenzQdBNbLqP5VEhdkAS6EPFLC1PHnBqCXEpPxuEb 2>/dev/null | grep "Creating token" | awk '{print $3}')
    
    if [ -z "$token_mint" ]; then
        print_error "토큰 생성에 실패했습니다."
        exit 1
    fi
    
    print_success "토큰이 생성되었습니다!"
    print_info "토큰 주소: $token_mint"
    
    # 토큰 계정 생성
    print_info "토큰 계정을 생성하는 중..."
    spl-token create-account "$token_mint" --program-id TokenzQdBNbLqP5VEhdkAS6EPFLC1PHnBqCXEpPxuEb
    
    # 초기 공급량 설정 (예: 1,000,000,000 TINA)
    local initial_supply="1000000000"
    print_info "초기 공급량을 설정하는 중... ($initial_supply TINA)"
    spl-token mint "$token_mint" "$initial_supply" --program-id TokenzQdBNbLqP5VEhdkAS6EPFLC1PHnBqCXEpPxuEb
    
    print_success "TINA 토큰이 성공적으로 생성되었습니다!"
    echo ""
    print_info "토큰 정보:"
    echo "  토큰 주소: $token_mint"
    echo "  초기 공급량: $initial_supply TINA"
    echo "  프로그램: Token 2022"
    echo ""
    print_info "Solana Explorer에서 확인:"
    echo "  https://explorer.solana.com/address/$token_mint"
    echo ""
    print_info "SolScan에서 확인:"
    echo "  https://solscan.io/token/$token_mint"
}

# 메인 실행
main() {
    echo "=========================================="
    echo "    TINA Token 2022 생성 스크립트"
    echo "=========================================="
    echo ""
    
    check_solana_cli
    check_network
    check_wallet
    check_balance
    check_token_2022_program
    echo ""
    
    read -p "토큰 생성을 계속하시겠습니까? (y/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        create_token
    else
        print_info "토큰 생성이 취소되었습니다."
    fi
}

# 스크립트 실행
main "$@"
