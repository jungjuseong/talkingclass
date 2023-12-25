package org.egovframe.cloud.portalservice.domain.lesson;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * org.egovframe.cloud.portalservice.domain.lesson.LessonRepository
 * <p>
 * 레슨 레파지토리 인터페이스
 *
 * @author 정서한 SEOHAN
 * @version 1.0
 * @since 2023/12/24
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *     수정일        수정자           수정내용
 *  ----------    --------    ---------------------------
 *  2023/12/24    SEOHAN       최초 생성
 * </pre>
 */
public interface LessonRepository extends JpaRepository<Lesson, String>, LessonRepositoryCustom {
    Optional<Lesson> findById(String lesssCode);

}
