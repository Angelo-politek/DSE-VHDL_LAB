# FIR Filter Algorithm Pseudo-code

## Initialization
- DONE = 0
- CNT = 0
- SUM = 0

## Main Algorithm
```
IF START = 1 THEN
    // First Loop: Data Input
    FOR CNT = 0 TO 1023
        X(CNT) = DATA_IN
    END FOR

    // Second Loop: Filter Processing
    FOR CNT = 0 TO 1023
        // Register Updates
        reg_X3 = reg_X2
        reg_X2 = reg_X1
        reg_X1 = reg_X
        reg_X = X(CNT)

        // Filter Operations
        shift_dx(reg_X)
        SUM = SUM - reg_X
        
        shift_sx(reg_X1)
        SUM = SUM - reg_X1
        
        shift2_dx(reg_X2)
        SUM = SUM + reg_X2
        
        shift2_sx(reg_X3)
        SUM = SUM + reg_X3

        // Output Saturation
        IF SUM > 01111111 THEN
            Y(CNT) = 01111111
        ELSE IF SUM < 10000000 THEN
            Y(CNT) = 10000000
        ELSE
            Y(CNT) = SUM
        END IF

        SUM = 0
    END FOR

    DONE = 1
END IF
```
