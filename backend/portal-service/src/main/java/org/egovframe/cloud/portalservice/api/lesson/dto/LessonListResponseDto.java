package org.egovframe.cloud.portalservice.api.lesson.dto;

import com.querydsl.core.annotations.QueryProjection;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * org.egovframe.cloud.portalservice.api.lesson.dto.LessonListResponseDto
 * <p>
 * 레슨 목록 응답 DTO 클래스
 *
 * @author 정서한
 * @version 1.0
 * @since 2023/12/24
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *     수정일        수정자           수정내용
 *  ----------    --------    ---------------------------
 *  2023/12/24    seohan       최초 생성
 * </pre>
 */
@Getter
@NoArgsConstructor
public class LessonListResponseDto implements Serializable {

    /**
     * 의소코드
     */
    private String lessonId;

    /**
     * 의소 주제
     */
    private String subject;

    /**
     * 수정자
     */
    private String lastModifiedBy;

    /**
     * 수정 일시
     */
    private LocalDateTime modifiedDate;

    /**
     * 레슨 목록 응답 DTO 생성자
     *
     * @param lessonId 레슨 id
     * @param subject 레슨 주제
     * @param lastModifiedBy 수정자
     * @param modifiedDate 수정 일시
     */
    @QueryProjection
    public LessonListResponseDto(String lessonId, String subject, String lastModifiedBy, LocalDateTime modifiedDate) {
        this.lessonId = lessonId;
        this.subject = subject;
        this.lastModifiedBy = lastModifiedBy;
        this.modifiedDate = modifiedDate;
    }

}
