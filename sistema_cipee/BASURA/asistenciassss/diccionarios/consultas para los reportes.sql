SELECT * from cheque where
ESTADO='ANULADO' AND
(fecha >= '2008-02-14' AND fecha <= '2008-02-29')
;

SELECT * from cheque where
ESTADO='PAGADO' AND
(fecha >= '2008-02-14' AND fecha <= '2008-02-29')
;

SELECT * from retencion_iva where
(fecha >= '2008-02-14' AND fecha <= '2008-02-29')
;

SELECT * from retencion_isrl where
(fecha >= '2008-02-14' AND fecha <= '2008-02-29')
;

SELECT * from ingresos where
(fecha >= '2008-02-01' AND fecha <= '2008-02-29')
;

