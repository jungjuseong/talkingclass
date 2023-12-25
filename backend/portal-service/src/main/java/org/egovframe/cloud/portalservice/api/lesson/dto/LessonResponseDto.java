package org.egovframe.cloud.portalservice.api.lesson.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import org.egovframe.cloud.portalservice.domain.lesson.Lesson;

/**
 * org.egovframe.cloud.portalservice.api.lesson.dto.LessonResponseDto
 * <p>
 * 레슨 상세 응답 DTO 클래스
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
public class LessonResponseDto {
    /**
     * 레슨 의소코드
     */
    private String lessonId;

    /**
     * 레슨 주제
     */
    private String subject;

    /**
     * 레슨 예제
     */
    private String example;

    /**
     * 레슨 1단계
     */
    private String step1;

    /**
     * 레슨 2단계
     */
    private String step2;

    /**
     * 레슨 3단계
     */
    private String step3;

    /**
     * 레슨 엔티티를 생성자로 주입 받아서 레슨 상세 응답 DTO 속성 값 세팅
     *
     * @param entity 레슨 엔티티
     */
    public LessonResponseDto(Lesson entity) {
        this.lessonId = entity.getLessonId();
        this.subject = entity.getSubject();
        this.example = entity.getExample();
        this.step1 = entity.getStep1();
        this.step2 = entity.getStep2();
        this.step3 = entity.getStep3();
    }

    /**
     * 레슨 상세 응답 DTO 속성 값으로 레슨 엔티티 빌더를 사용하여 객체 생성
     *
     * @return Lesson 레슨 엔티티
     */
    public Lesson toEntity() {
        return Lesson.builder()
                .lessonId(lessonId)
                .subject(subject)
                .example(example)
                .step1(step1)
                .step2(step2)
                .step3(step3)
                .build();
    }

}
