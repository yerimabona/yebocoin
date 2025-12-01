(define-fungible-token yebocoin)

;; Constants
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-INSUFFICIENT-BALANCE (err u101))

(define-constant CONTRACT-OWNER tx-sender)

;; Data variables
(define-data-var total-supply uint u0)

;; Public functions

(define-public (mint (recipient principal) (amount uint))
  (begin
    (if (is-eq tx-sender CONTRACT-OWNER)
        (let ((mint-result (ft-mint? yebocoin amount recipient)))
          (match mint-result
            minted
              (begin
                (var-set total-supply (+ (var-get total-supply) amount))
                (ok minted))
            error (err error)))
        ERR-NOT-AUTHORIZED)))

(define-public (burn (amount uint))
  (let ((balance (ft-get-balance yebocoin tx-sender)))
    (if (< balance amount)
        ERR-INSUFFICIENT-BALANCE
        (let ((burn-result (ft-burn? yebocoin amount tx-sender)))
          (match burn-result
            burned
              (begin
                (var-set total-supply (- (var-get total-supply) amount))
                (ok burned))
            error (err error))))))

(define-public (transfer (recipient principal) (amount uint))
  (let ((result (ft-transfer? yebocoin amount tx-sender recipient)))
    (match result
      transferred (ok transferred)
      error (err error))))

;; Read-only functions

(define-read-only (get-total-supply)
  (ok (var-get total-supply)))

(define-read-only (get-balance (who principal))
  (ok (ft-get-balance yebocoin who)))
