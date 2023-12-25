package org.egovframe.cloud.portalservice.api.lesson.dto;

import lombok.Getter;
import org.egovframe.cloud.portalservice.domain.lesson.Lesson;

import javax.validation.constraints.NotBlank;

/**
 * org.egovframe.cloud.portalservice.api.lesson.dto.LessonSaveRequestDto
 * <p>
 * 레슨 등록 요청 DTO 클래스
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
public class LessonSaveRequestDto {

    /**
     * 레슨 주제
     */
    @NotBlank(message = "{lesson.subject} {err.required}")
    private String subject;

    /**
     * 레슨 에제
     */
    @NotBlank(message = "{lesson.example} {err.required}")
    private String example;

    /**
     * 레슨 1단계
     */
    @NotBlank(message = "{lesson.step1} {err.required}")
    private String step1;
    /**
     * 레슨 2단계
     */
    @NotBlank(message = "{lesson.step2} {err.required}")
    private String step2;
    /**
     * 레슨 3단계
     */
    @NotBlank(message = "{lesson.step3} {err.required}")
    private String step3;

    /**
     * 레슨 등록 요청 DTO 속성 값으로 레슨 엔티티 빌더를 사용하여 객체 생성
     *
     * @return 레슨 엔티티
     */
    public Lesson toEntity() {
        return Lesson.builder()
                .subject(subject)
                .example(example)
                .step1(step1)
                .step2(step2)
                .step3(step3)
                .build();
    }

}
