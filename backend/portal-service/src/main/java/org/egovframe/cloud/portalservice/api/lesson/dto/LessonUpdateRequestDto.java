package org.egovframe.cloud.portalservice.api.lesson.dto;

import lombok.Getter;

import javax.validation.constraints.NotBlank;

/**
 * org.egovframe.cloud.portalservice.api.content.lesson.LessonUpdateRequestDto
 * <p>
 * 레슨 수정 요청 DTO 클래스
 *
 * @author 정서한
 * @version 1.0
 * @since 2021/07/08
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *     수정일        수정자           수정내용
 *  ----------    --------    ---------------------------
 *  2023/12/24   seohan       최초 생성
 * </pre>
 */
@Getter
public class LessonUpdateRequestDto {

    /**
     * 레슨 의소주제
     */
    @NotBlank(message = "{lesson.subject} {err.required}")
    private String subject;

    /**
     * 레슨 예제
     */
     @NotBlank(message = "{lesson.example} {err.required}")
    private String example;

    /**
     * 레슨 1단계
     */
    @NotBlank(message = "{content.step1} {err.required}")
    private String step1;

    /**
     * 레슨 2단계
     */
    @NotBlank(message = "{content.step2} {err.required}")
    private String step2;

    /**
     * 레슨 3단계
     */
    @NotBlank(message = "{content.step3} {err.required}")
    private String step3;

}
