# 백업 전략 문서

## 1. 백업 종류
- **전체 백업(Full Backup)**: 데이터베이스의 모든 데이터와 구조를 백업
- **증분 백업(Incremental Backup)**: 마지막 전체 백업 이후 변경된 데이터만 백업
- **차등 백업(Differential Backup)**: 마지막 전체 백업 이후 변경된 데이터를 누적 백업

## 2. 백업 주기
- 중요 서비스: 매일 또는 실시간 백업
- 일반 서비스: 주 1회 백업
- 개발 DB: 배포 전 백업

## 3. 복구 시나리오
- 테이블 삭제 실수: 최근 백업에서 복원
- 서버 장애: 다른 서버에서 복원
- 시점 복원(Point-in-time recovery): Binary Log 필요

## 4. 자동화
- cron을 활용한 매일 새벽 백업 스케줄링
- 클라우드 스토리지(예: AWS S3)에 업로드
- 스크립트 예시:
```bash
0 3 * * * mysqldump -u root -p practice_db > /path/to/backup/full_backup_$(date +\%Y\%m\%d).sql
