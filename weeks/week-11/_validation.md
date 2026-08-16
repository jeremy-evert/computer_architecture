# Week 11 validation

**Status:** IMPLEMENTED WITH NAMED YELLOWS

- [x] memory story grows directly from Week 10
- [x] required live path is unprivileged (`/proc/self/maps`, `getconf PAGESIZE`)
- [x] primary Linux and RISC-V privileged sources reverified during campaign
- [x] no brittle physical-frame/pagemap/root requirement
- [x] fallback trace doctrine explicit for non-Linux
- [x] student deck compiled: 12 pages, 57,603 bytes, SHA-256 `bb7861cab4c59a22e7676f283cb680f0faa003d46e5127608e92f2c786bb6cf6`
- [x] notes deck compiled: 12 pages, 73,728 bytes, SHA-256 `1e9a44592f9f2ab86b45bab7e4ff33558a49d729780b992d6347b4684386e0c2`

YELLOW: exact non-Linux student fallback packet and physical WSL/macOS execution are finalized in 004_m.

**Judgment:** implemented enough to proceed to Week 12.