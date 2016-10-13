# Vectors of prices
PA <- c(38.23, 41.29)
PC <- c(41.11, 41.74)

# Simple monthly returns
RA <- (PA[2] - PA[1]) / PA[1]
RC <- (PC[2] - PC[1]) / PC[1]


# Cash dividend per share
DA <- 0.10

# Simple total return
RA_total <- (PA[2] + DA - PA[1]) / PA[1]

# Dividend yield
DY <- DA / PA[1]

# Simple annual return
RA_annual <- (1 + RA) ^ 12 - 1

# Continuously compounded annual return
rA_annual <- log(1 + RA_annual)

# Portfolio shares
xA <- RA[2] * 8000
xC <- RA[2] * 2000

# Portfolio shares
xA <- 8000 / 10000
xC <- 1 - xA

# Simple monthly return
xA * RA + xC * RC
