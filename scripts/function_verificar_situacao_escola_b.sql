USE bd_escola_b
DELIMITER $$
CREATE FUNCTION verificar_situacao(media DECIMAL(4,2), frequencia INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    IF media >= 6 AND frequencia >= 75 THEN
        RETURN 'Aprovado';
    ELSEIF frequencia < 75 THEN
        RETURN 'Reprovado por frequência';
    ELSE
        RETURN 'Reprovado por nota';
    END IF;
END$$