CREATE OR REPLACE FUNCTION simon_game()
RETURNS VOID AS $$
DECLARE
    cnt INT;
    v_rnd INT;
    v_last_seq TEXT := '';
	v_score INT;
    current_char CHAR;
    result TEXT;
    step_count INT := 3;
BEGIN
    SET LOCAL client_min_messages = 'notice';
    
	SELECT score INTO v_score
    FROM game_history
    WHERE game_history_id = (SELECT MAX(game_history_id) FROM game_history);

    IF v_score IS NOT NULL THEN 
        step_count := v_score + 1; 
    END IF;
	
    RAISE INFO '%', e'\033[2J\033[H';

    FOR cnt IN 1..step_count LOOP
        v_rnd := floor(random() * 4) + 1;
        current_char := CASE v_rnd 
                            WHEN 1 THEN 'r' 
                            WHEN 2 THEN 'g' 
                            WHEN 3 THEN 'y' 
                            ELSE 'b' 
                        END;
        v_last_seq := v_last_seq || current_char;
        SELECT FORMAT('%s %s%s%s', 
            CASE WHEN v_rnd <> 1 
                 THEN MAX(o.out_object_figure) FILTER (WHERE o.out_object_id = 1)
                 ELSE MAX(o.out_object_figure) FILTER (WHERE o.out_object_id = 5)
            END,
            CASE WHEN v_rnd <> 2
                 THEN MAX(o.out_object_figure) FILTER (WHERE o.out_object_id = 2) 
                 ELSE MAX(o.out_object_figure) FILTER (WHERE o.out_object_id = 6)
            END,
            E'\n',
            FORMAT('%s %s',
                CASE WHEN v_rnd <> 3
                     THEN MAX(o.out_object_figure) FILTER (WHERE o.out_object_id = 3)
                     ELSE MAX(o.out_object_figure) FILTER (WHERE o.out_object_id = 7)
                END,
                CASE WHEN v_rnd <> 4
                     THEN MAX(o.out_object_figure) FILTER (WHERE o.out_object_id = 4)
                     ELSE MAX(o.out_object_figure) FILTER (WHERE o.out_object_id = 8)
                END
            )
        ) INTO result
        FROM out_object o;

        UPDATE game_history 
        SET last_seq = v_last_seq 
        WHERE game_history_id = (SELECT max(game_history_id) FROM game_history);

        RAISE INFO E'\033[2K \033[H%', result;
        
        PERFORM pg_sleep(1);
    END LOOP;
    RAISE INFO E'\033[H\033[J \033[2K \033[H%', 'Enter: hi_simon(ANSWER) for the answer';
	RAISE INFO E'\033[2K%', 'The ANSWER is sequance. For example: rbb (r - red, b - blue, b - blue)';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION hi_simon()
RETURNS VOID AS $$
DECLARE

BEGIN
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION hi_simon(user_answer TEXT)
RETURNS VOID AS $$
DECLARE
    correct_seq TEXT;
BEGIN
    SET LOCAL client_min_messages = 'notice';

    SELECT last_seq INTO correct_seq
    FROM game_history
    WHERE game_history_id = (SELECT MAX(game_history_id) FROM game_history);
    RAISE INFO '%', E'\033[2J\033[H';
    
    IF LOWER(user_answer) = LOWER(correct_seq) THEN
        RAISE INFO E'\033[H\033[J \033[2K \033[92mNice! %\033[0m is right', correct_seq;
		UPDATE game_history 
        SET score = LENGTH(correct_seq), game_status_id = 1
        WHERE game_history_id = (SELECT MAX(game_history_id) FROM game_history);
    ELSE
        RAISE INFO E'\033[H\033[J \033[2K \033[H\033[91mBad news! Your answer: % ... The right answer: % \(-.-)/  \033[0m', user_answer, correct_seq;
		UPDATE game_history 
        SET score = LENGTH(correct_seq), game_status_id = 2
        WHERE game_history_id = (SELECT MAX(game_history_id) FROM game_history);
		INSERT INTO game_history (game_status_id) VALUES (0);
    END IF;
    
    RAISE INFO E'\033[2K \033[36mTry again: SELECT simon_game();\033[0m';
END;
$$ LANGUAGE plpgsql;
